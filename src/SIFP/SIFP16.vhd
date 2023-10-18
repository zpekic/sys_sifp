----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:02 10/16/2023 
-- Design Name: 
-- Module Name:    SIFP16 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.sifp_package.all;
use work.helloworld_code.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SIFP16 is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           READY : in  STD_LOGIC;
           RUNnTRACE : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           RnW : out  STD_LOGIC;
           VMA : out  STD_LOGIC;
           PnD : out  STD_LOGIC;
			  HALT: out STD_LOGIC;
           FETCH : out  STD_LOGIC);
end SIFP16;

architecture Behavioral of SIFP16 is

--
-- Special case instruction combinations
constant c_NOP: std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS;		-- only increment P
constant c_FTOS: std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_S;		-- mostly for flag output is trace mode 
constant c_PUSHF: std_logic_vector(15 downto 0) := r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_PUSH;	-- flags to stack
constant c_POPF: std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_POP;	-- pick up flags from stack
constant c_HALT: std_logic_vector(15 downto 0) :=	r_p_M_IMM & r_a_A & r_x_X & r_y_Y & r_s_S;				-- ABUS will indicate where CPU halted

-- CPU program
-- CPU always executes only 8 instructions continously!
constant cpu_program: mem16x20 := (
-- 8 instructions to execute in TRACE mode (FETCH-EXECUTE-6*REGISTER OUT)
	"0101" & r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS, -- FETCH (load instruction register)
	"0110" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS, 	-- EXECUTE (from instruction register)
	"0000" & c_FTOS,														 	-- output F(lags) 
	"0000" & r_p_NOP & r_a_A 	& r_x_NOX & r_y_NOY & r_s_NOS,	-- output A
	"0000" & r_p_NOP & r_a_NOA & r_x_X	 & r_y_NOY & r_s_NOS,	-- output X
	"0000" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_Y	  & r_s_NOS,	-- output Y
	"0000" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_S,		-- output S
	"0000" & r_p_P0 & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,		-- output P
-- 8 instructions to execute in RUN mode (4 times the FETCH-EXECUTE sequence)
	"0101" & r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0110" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0101" & r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0110" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0101" & r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0110" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0101" & r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	"0110" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS
);


signal seq_cnt: std_logic_vector(2 downto 0);
signal cpu_upc: std_logic_vector(3 downto 0);

signal cpu_ucurrent: std_logic_vector(19 downto 0);
alias cpu_rsvrd: std_logic is cpu_ucurrent(19); -- ?: reserved for future use
alias cpu_bctrl: std_logic is cpu_ucurrent(18); -- 0: alternative bus control (ABUS = register address; VMA, PnD, RnW = '0')
alias cpu_irexe: std_logic is cpu_ucurrent(17); -- 1: execute from instruction register 
alias cpu_fetch: std_logic is cpu_ucurrent(16); -- 1: fetch
alias cpu_instr: std_logic_vector(15 downto 0) is cpu_ucurrent(15 downto 0);

-- internally sync'd with CLK
signal int_runtrace, int_halt, int_ready: std_logic;
signal reg_clk: std_logic;

-- non-programmable registers
signal reg_instr: std_logic_vector(15 downto 0); -- instruction register
signal reg_flags: std_logic_vector(15 downto 0); -- flags


-- other
signal int_abus: std_logic_vector(15 downto 0);
signal int_dbus: std_logic_vector(15 downto 0);
signal int_rnw, int_vma, int_pnd: std_logic;

begin

-- drive CPU output signals
ABUS <= X"000" & cpu_upc when (cpu_bctrl = '0') else int_abus;
DBUS <= "ZZZZZZZZZZZZZZZZ";-- when (int_rnw = '1') else int_dbus;
RnW <= cpu_bctrl and int_rnw;
VMA <= cpu_bctrl and int_vma;
PnD <= cpu_bctrl and int_pnd;
HALT <= int_halt;
FETCH <= cpu_fetch;

-- capture READY at falling edge of CLK
on_clk: process(CLK)
begin
	if (falling_edge(CLK)) then
		int_ready <= READY;
	end if;
end process;

-- internal clock 
reg_clk <= CLK and int_ready and (not int_halt);


-- execution sequence counter and non-program accessible registers
on_reg_clk: process(reg_clk, RESET)
begin
	if (RESET = '1') then
		seq_cnt <= "000";
		int_halt <= '0';
		reg_instr <= c_NOP;	-- has no effect, won't be executed
		reg_flags <= X"1111";-- initialize all Z flags with 1 to reflect register values of 0
	else
		if (rising_edge(reg_clk)) then
			seq_cnt <= std_logic_vector(unsigned(seq_cnt) + 1);
			if (cpu_uinstruction = c_HALT) then
				int_halt <= '1';
			end if;
			-- safely change run/trace mode only at the end of full sequence
			if (seq_cnt = "111") then
				int_runtrace <= RUNnTRACE; 
			end if;
			-- load Flags register
			if (cpu_uinstruction = c_POPF) then
				reg_flags <= DBUS;
			else
				reg_flags <= X"BEEF";	-- TODO, load from register flag outputs
			end if;
			-- load instruction register
			if (cpu_fetch = '1') then
				reg_instr <= DBUS;
			end if;
		end if;
	end if;
end process;

-- microinstruction program counter is only 4 bits!
cpu_upc <= int_runtrace & seq_cnt;

-- current microinstruction is 1 out of 16 20-bit words
cpu_ucurrent <= cpu_program(to_integer(unsigned(cpu_upc)));

-- CPU executes either internal microinstruction, or the one from instruction register
cpu_uinstruction <= reg_instr when (cpu_irexe = '1') else cpu_instr;

-- loading Flags register

end Behavioral;

