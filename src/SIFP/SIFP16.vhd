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
           TRACE : in  STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           RnW : out  STD_LOGIC;
           VMA : out  STD_LOGIC;
           PnD : out  STD_LOGIC;
			  HALT: out STD_LOGIC;
			  DONE: out STD_LOGIC;
           FETCH : out  STD_LOGIC);
end SIFP16;

architecture Behavioral of SIFP16 is

--
-- Special case instruction combinations
constant c_FETCH: std_logic_vector(15 downto 0) := r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS;
constant c_NOP, c_EXEC: std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS;		-- only increment P
constant c_FTOS: std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_S;		-- mostly for flag output in trace mode
constant c_PUSHF: std_logic_vector(15 downto 0) := r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_PUSH;	-- flags to stack
constant c_POPF: std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_POP;	-- pick up flags from stack
constant c_HALT: std_logic_vector(15 downto 0) :=	r_p_M_IMM & r_a_A & r_x_X & r_y_Y & r_s_S;				-- ABUS will indicate where CPU halted

-- CPU program
-- CPU always executes only 8 instructions continously!
constant cpu_program: mem16x20 := (
-- 8 instructions to execute in RUN mode (4 times the FETCH-EXECUTE sequence)
	"0101" & c_FETCH,
	"1110" & c_EXEC,
	"0101" & c_FETCH,
	"1110" & c_EXEC,
	"0101" & c_FETCH,
	"1110" & c_EXEC,
	"0101" & c_FETCH,
	"1110" & c_EXEC,
-- 8 instructions to execute in TRACE mode (FETCH-EXECUTE-6*REGISTER OUT)
	"0101" & c_FETCH, -- FETCH (load instruction register)
	"0110" & c_EXEC, 	-- EXECUTE (from instruction register)
	"0000" & c_FTOS,														 	-- output F(lags) 
	"0000" & r_p_NOP & r_a_A 	& r_x_NOX & r_y_NOY & r_s_NOS,	-- output A
	"0000" & r_p_NOP & r_a_NOA & r_x_X	 & r_y_NOY & r_s_NOS,	-- output X
	"0000" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_Y	  & r_s_NOS,	-- output Y
	"0000" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_S,		-- output S
	"1000" & r_p_P0 & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS		-- output P
);


signal clk_cnt: std_logic_vector(15 downto 0); -- free running counter, 3 LSB bits are the program counter
signal cpu_upc: std_logic_vector(3 downto 0);

-- instruction word
signal cpu_i: std_logic_vector(19 downto 0);
alias cpu_done:  std_logic is cpu_i(19); -- 1: last in machine cycle
alias cpu_bctrl: std_logic is cpu_i(18); -- 0: alternative bus control (ABUS = register address; VMA, PnD, RnW = '0')
alias cpu_irexe: std_logic is cpu_i(17); -- 1: execute from instruction register 
alias cpu_fetch: std_logic is cpu_i(16); -- 1: fetch
alias cpu_instr: std_logic_vector(15 downto 0) is cpu_i(15 downto 0);
signal i_is_ftos, i_is_pushf, i_is_popf: std_logic; 
signal i_is_halt: std_logic;

-- internally sync'd with CLK
signal int_trace, int_halt, int_ready: std_logic;
signal reg_clk: std_logic;

-- non-programmable registers
signal reg_i: std_logic_vector(15 downto 0); -- instruction register
signal reg_f: std_logic_vector(15 downto 0); -- flags
-- flags are arranged for debug convenience
alias flag_ac: std_logic is reg_f(15);
alias flag_az: std_logic is reg_f(12);
alias flag_xc: std_logic is reg_f(11);
alias flag_xz: std_logic is reg_f(8);
alias flag_yc: std_logic is reg_f(7);
alias flag_yz: std_logic is reg_f(4);
alias flag_sc: std_logic is reg_f(3);
alias flag_sz: std_logic is reg_f(0);
-- currently consumed flag value
signal flag: std_logic;

-- values of programmable registers and their flag outputs
signal p, a, x, y, s: std_logic_vector(15 downto 0);
signal reg_ac, reg_az: std_logic;
signal reg_xc, reg_xz: std_logic;
signal reg_yc, reg_yz: std_logic;
signal reg_sc, reg_sz: std_logic;

-- address (and enable) outputs of registers (note: A[ccumulator] never generates address)
signal p2a, x2a, y2a, s2a: std_logic_vector(15 downto 0);
signal reg_p_a, reg_x_a, reg_y_a, reg_s_a: std_logic;

-- data (and enable) outputs of registers (includes A and data bus input)
signal p2d, a2d, x2d, y2d, s2d, d2d: std_logic_vector(15 downto 0);
signal reg_p_d, reg_a_d, reg_x_d, reg_y_d, reg_s_d: std_logic;

-- other
signal int_abus: std_logic_vector(15 downto 0);
signal int_dbus, int_fdbus: std_logic_vector(15 downto 0);
signal int_rnw, int_vma, int_pnd: std_logic;

begin

-- CPU control bus outputs
RnW <= cpu_bctrl and int_rnw;
VMA <= cpu_bctrl and int_vma;
PnD <= cpu_bctrl and int_pnd;
HALT <= int_halt;
DONE <= (not reg_clk) and cpu_done;
FETCH <= cpu_fetch;

----------------------------------------------------------------------------
-- CPU Address bus output
----------------------------------------------------------------------------
-- in trace mode, address bits 2,1,0 (values 2..7) indicating a register
ABUS <= ("0000000000000" & clk_cnt(2 downto 0)) when (cpu_bctrl = '0') else int_abus;	

-- internal address bus is an addition of all registers that project address
int_abus <= std_logic_vector(unsigned(p2a) + unsigned(x2a) + unsigned(y2a) + unsigned(s2a));
p2a <= p when (reg_p_a = '1') else X"0000"; 
x2a <= x when (reg_x_a = '1') else X"0000"; 
y2a <= y when (reg_y_a = '1') else X"0000"; 
s2a <= s when (reg_s_a = '1') else X"0000"; 

-- indicate valid memory address if at least one register is projecting address
int_vma <= reg_p_a or reg_x_a or reg_y_a or reg_s_a;

-- for Harvard mode, we need to know if program counter is involved in address generation
int_pnd <= reg_p_a;

---------------------------------------------------------------------------
-- CPU data bus outputs
---------------------------------------------------------------------------
-- internal data bus is logical OR of all registers that project data
DBUS <= "ZZZZZZZZZZZZZZZZ" when ((int_rnw and cpu_bctrl) = '1') else int_fdbus;

-- memory write if valid memory address and trying to output at least 1 register
int_rnw <= not(reg_p_d or reg_a_d or reg_x_d or reg_y_d or reg_s_d or i_is_ftos or i_is_pushf) when (int_vma = '1') else '1';

-- MUX to allow pushing, storing F to stack memory
int_fdbus <= reg_f when ((i_is_ftos or i_is_pushf) = '1') else int_dbus;

-- internal data bus is logical OR of all registers that project data
int_dbus <= p2d or a2d or x2d or y2d or s2d or d2d;
p2d <= p when (reg_p_d = '1') else X"0000";
a2d <= a when (reg_a_d = '1') else X"0000"; 
x2d <= x when (reg_x_d = '1') else X"0000"; 
y2d <= y when (reg_y_d = '1') else X"0000"; 
s2d <= s when (reg_s_d = '1') else X"0000"; 
-- read from external memory bus if valid memory address and not write mode
d2d <= DBUS when ((int_rnw and int_vma) = '1') else X"0000"; 

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
		clk_cnt <= X"0000";
		int_halt <= '0';
		int_trace <= '1';
		reg_i <= c_NOP;	-- has no effect, won't be executed
		reg_f <= X"0001";-- initialize C,Z flags to reflect register values
	else
		if (rising_edge(reg_clk)) then
			clk_cnt <= std_logic_vector(unsigned(clk_cnt) + 1);
			if (i_is_halt = '1') then
				int_halt <= '1';
			end if;
			-- safely change run/trace mode only at the start of full sequence
			if (clk_cnt(2 downto 0) = "000") then
				int_trace <= TRACE; 
			end if;
			-- load Flags register
			if (i_is_popf = '1') then
				reg_f <= DBUS;
			else
				-- only change 8 bits of 16 bits in F[lags] register
				flag_ac <= reg_ac;
				flag_az <= reg_az;
				flag_xc <= reg_xc;
				flag_xz <= reg_xz;
				flag_yc <= reg_yc;
				flag_yz <= reg_yz;
				flag_sc <= reg_sc;
				flag_sz <= reg_sz;
			end if;
			-- load instruction register
			if (cpu_fetch = '1') then
				reg_i <= DBUS;
			end if;
		end if;
	end if;
end process;

-- internal instruction program counter is only 4 bits!
cpu_upc <= int_trace & clk_cnt(2 downto 0);

-- current instruction is 1 out of 16 20-bit words
cpu_i <= cpu_program(to_integer(unsigned(cpu_upc)));

-- CPU executes either internal instruction, or the one from instruction register
cpu_uinstruction <= reg_i when (cpu_irexe = '1') else cpu_instr;

-- decode some instructions to drive internal control signals
i_is_ftos <= '1' when (cpu_uinstruction = c_FTOS) else '0';
i_is_popf <= '1' when (cpu_uinstruction = c_POPF) else '0';
i_is_pushf <= '1' when (cpu_uinstruction = c_PUSHF) else '0';
i_is_halt <= '1' when (cpu_uinstruction = c_HALT) else '0';

-- programmable registers
p_reg: entity work.reg_progcounter Port map ( 
			clk => reg_clk,
			reset => RESET,
			operation => cpu_r_p,	-- 4 bit slice of the current instruction
			din => int_dbus,			-- data from memory or other registers (except F)
			cond(7) => flag_sz,
			cond(6) => flag_sc,
			cond(5) => flag_yz,
			cond(4) => flag_yc,
			cond(3) => flag_xz,
			cond(2) => flag_xc,
			cond(1) => flag_az,
			cond(0) => flag_ac,
			reg => p,
			reg_d => reg_p_d,
			reg_a => reg_p_a
		);

a_reg: entity work.reg_acc Port map ( 
			clk => reg_clk,
			reset => RESET,
			operation => cpu_r_a,	-- 3 bit slice of the current instruction
			din => int_dbus,			-- data from memory or other registers (except F)
			zi => flag_az,
			ci => flag_ac,
			reg => a,
			zo => reg_az,
			co => reg_ac,
			reg_d => reg_a_d,
			reg_a => open				-- A[ccumulator] never projects address
		);

x_reg: entity work.reg_index Port map ( 
			clk => reg_clk,
			reset => RESET,
			operation => cpu_r_x,	-- 3 bit slice of the current instruction
			din => int_dbus,			-- data from memory or other registers (except F)
			zi => flag_xz,
			ci => flag_xc,
			reg => x,
			zo => reg_xz,
			co => reg_xc,
			reg_d => reg_x_d,
			reg_a => reg_x_a
		);

y_reg: entity work.reg_index Port map ( 
			clk => reg_clk,
			reset => RESET,
			operation => cpu_r_y,	-- 3 bit slice of the current instruction
			din => int_dbus,			-- data from memory or other registers (except F)
			zi => flag_yz,
			ci => flag_yc,
			reg => y,
			zo => reg_yz,
			co => reg_yc,
			reg_d => reg_y_d,
			reg_a => reg_y_a
		);

s_reg: entity work.reg_stackpointer Port map ( 
			clk => reg_clk,
			reset => RESET,
			operation => cpu_r_s,	-- 3 bit slice of the current instruction
			din => int_dbus,			-- data from memory or other registers (except F)
			zi => flag_sz,
			ci => flag_sc,
			reg => s,
			zo => reg_sz,
			co => reg_sc,
			reg_d => reg_s_d,
			reg_a => reg_s_a
		);

end Behavioral;

