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
           TRACEIN : in  STD_LOGIC;
			  HOLD: in STD_LOGIC;
			  INT: in STD_LOGIC;
           ABUS : out  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : inout  STD_LOGIC_VECTOR (15 downto 0);
           RnW : out  STD_LOGIC;
           VMA : out  STD_LOGIC;
           PnD : out  STD_LOGIC;
			  HALT: out STD_LOGIC;
			  DONE: out STD_LOGIC;
			  HOLDA: out STD_LOGIC;
			  INTA: out STD_LOGIC;
			  TRACEOUT: out STD_LOGIC;
			  OPCNT: out STD_LOGIC_VECTOR(3 downto 0);	-- operations per instruction
           FETCH : out  STD_LOGIC);
end SIFP16;

architecture Behavioral of SIFP16 is

--
-- Special case instruction combinations
constant c_FETCH: std_logic_vector(15 downto 0) := r_p_M_IMM & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS;
constant c_NOP: std_logic_vector(15 downto 0) 	:=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS;		-- only increment P
constant c_LDP: std_logic_vector(15 downto 0) 	:=	r_p_LDP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS;		-- load P
constant c_FTOS: std_logic_vector(15 downto 0) 	:=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_S;		-- mostly for flag output in trace mode
constant c_PUSHP: std_logic_vector(15 downto 0) := r_p_STP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_PUSH;	-- P (program counter) to stack
constant c_PUSHF: std_logic_vector(15 downto 0) := r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_PUSH;	-- flags to stack
constant c_POPF: std_logic_vector(15 downto 0) 	:=	r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_M_POP;	-- pick up flags from stack
constant c_HALT: std_logic_vector(15 downto 0) 	:=	r_p_M_IMM & r_a_A & r_x_X & r_y_Y & r_s_S;			-- ABUS will indicate where CPU halted
constant c_INTON:		std_logic_vector(15 downto 0) :=	r_p_NOP & r_a_A & r_x_X & r_y_Y & r_s_S;		-- Enable interrupts (set flag_ie to 1)
constant c_INTOFF:	std_logic_vector(15 downto 0) :=	r_p_STP4 & r_a_A & r_x_X & r_y_Y & r_s_S;		-- Disable interrupts (set flag_ie to 0)
constant c_TRACEON:	std_logic_vector(15 downto 0) :=	r_p_STP2 & r_a_A & r_x_X & r_y_Y & r_s_S;		-- Enable tracing (set flag_te to 1)
constant c_TRACEOFF:	std_logic_vector(15 downto 0) :=	r_p_STP &  r_a_A & r_x_X & r_y_Y & r_s_S;		-- Disable tracing (set flag_te to 0)

-- internal program constants
constant if_hold:	std_logic_vector(1 downto 0) := "00";
constant if_cont:	std_logic_vector(1 downto 0) := "01";
constant if_trce: std_logic_vector(1 downto 0) := "10";
constant if_intr:	std_logic_vector(1 downto 0) := "11";

-- CPU program
-- CPU always executes only these instructions continously
-- except at step 1 when the instruction executed is coming from instruction register
-- which was loaded from external memory
-- this works because the lower 16 bits of the instructions in this program are same as
-- instruction format stored in external memory
constant cpu_program: mem16x32 := (
	-- basic loop (fetch / execute)
	-- 0: fetch, then hold or execute
	if_hold & X"F" & X"1" & "000101" & c_FETCH,
	-- 1: execute, then continue (fetch next instruction) or special path
	if_cont & X"0" & X"2" & "001110" & c_NOP,
	
	-- trace routine outputs register index on A bus and value on D bus
	-- 2: output F(flags), if trace then output other regs else push regs (interrupt)
	if_trce & X"3" & X"8" & "000000" & c_FTOS,								
	-- 3: output A, continue	
	if_intr & X"4" & X"4" & "000000" & r_p_NOP & r_a_A 	& r_x_NOX & r_y_NOY & r_s_NOS,
	-- 4: output X, continue
	if_intr & X"5" & X"5" & "000000" & r_p_NOP & r_a_NOA & r_x_X	 & r_y_NOY & r_s_NOS,
	-- 5: output Y, continue
	if_intr & X"6" & X"6" & "000000" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_Y	  & r_s_NOS,	
	-- 6: output S, continue
	if_intr & X"7" & X"7" & "000000" & r_p_NOP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_S,
	-- 7: output P, if interrupt then push regs else fetch (new instruction) 
	if_intr & X"8" & X"0" & "001000" & r_p_STP & r_a_NOA & r_x_NOX & r_y_NOY & r_s_NOS,
	
	-- interrupt routine pushes P and F on the stack, disables tracing and interrupts, and then load the int vector
	-- 8: push P, continue
	if_cont & X"9" & X"9" & "000100" & c_PUSHP,
	-- 9: push F, continue
	if_cont & X"A" & X"A" & "000100" & c_PUSHF,
	-- A: turn trace flag off, continue
	if_cont & X"B" & X"B" & "000100" & c_INTOFF,
	-- B: turn interrupt enable off, continue
	if_cont & X"C" & X"C" & "000100" & c_TRACEOFF,
	-- C: load intrrupt vector, then fetch next instruction
	if_cont & X"0" & X"0" & "010100" & c_LDP,
	
	-- unused, reserved for future use
	-- D: unreachable nop
	if_cont & X"0" & X"0" & "000100" & c_NOP,
	-- E: unreachable nop
	if_cont & X"0" & X"0" & "000100" & c_NOP,
	
	-- bus hold routine
	-- F: hold (tri-state) until HOLD signal detected low, otherwise execute
	if_hold & X"F" & X"1" & "100000" & c_NOP
);

-- instruction word
signal cpu_instruction: std_logic_vector(31 downto 0);
alias cpu_if:	  std_logic_vector(1 downto 0) is cpu_instruction(31 downto 30); -- select condition ("IF")
alias cpu_then:  std_logic_vector(3 downto 0) is cpu_instruction(29 downto 26); -- next state if condition true ("THEN")
alias cpu_else:  std_logic_vector(3 downto 0) is cpu_instruction(25 downto 22); -- next state if condition false ("ELSE")
alias cpu_hlda:  std_logic is cpu_instruction(21); -- 0: bus hold (tri-state) machine cycle
alias cpu_inta:  std_logic is cpu_instruction(20); -- 0: load interrupt vector
alias cpu_done:  std_logic is cpu_instruction(19); -- 1: last machine cycle in instruction
alias cpu_bctrl: std_logic is cpu_instruction(18); -- 0: alternative bus control (ABUS = register address; VMA, PnD, RnW = '0')
alias cpu_irexe: std_logic is cpu_instruction(17); -- 1: execute from instruction register 
alias cpu_fetch: std_logic is cpu_instruction(16); -- 1: fetch
-- format of lower 16-bit is exactly the same like the instructions stored in external memory!
alias cpu_i: std_logic_vector(15 downto 0) is cpu_instruction(15 downto 0);

-- current microinstruction program counter and condition
signal cpu_upc: std_logic_vector(3 downto 0);
signal cpu_cond: std_logic;

-- special instruction decode
signal i_is_special: std_logic_vector(7 downto 0);
alias i_is_ftos:	std_logic is i_is_special(0); 
alias i_is_pushf:	std_logic is i_is_special(1); 
alias i_is_popf:	std_logic is i_is_special(2);
alias i_is_halt:	std_logic is i_is_special(3); 
alias i_is_int:   std_logic_vector(1 downto 0) is i_is_special(5 downto 4);
alias i_is_trace: std_logic_vector(1 downto 0) is i_is_special(7 downto 6);

-- internally sync'd
signal int_trace, int_intr, int_ready, int_done: std_logic;
signal reg_clk: std_logic;

-- non-programmable registers
signal reg_i: std_logic_vector(15 downto 0); -- instruction register
signal reg_f: std_logic_vector(15 downto 0); -- flags
-- flags are arranged for debug convenience
alias flag_ie: std_logic is reg_f(15); -- interrupt enable
alias flag_te:	std_logic is reg_f(14);	-- trace enable
alias flag_ac: std_logic is reg_f(7);
alias flag_xc: std_logic is reg_f(6);
alias flag_yc: std_logic is reg_f(5);
alias flag_sc: std_logic is reg_f(4);
alias flag_az: std_logic is reg_f(3);
alias flag_xz: std_logic is reg_f(2);
alias flag_yz: std_logic is reg_f(1);
alias flag_sz: std_logic is reg_f(0);
signal new_ie, new_te: std_logic;
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
signal opr_vector: std_logic_vector(4 downto 0);
alias opr_p: std_logic is opr_vector(4);
alias opr_a: std_logic is opr_vector(3);
alias opr_x: std_logic is opr_vector(2);
alias opr_y: std_logic is opr_vector(1);
alias opr_s: std_logic is opr_vector(0);
signal opr_nop: std_logic;

begin

--------------------------------------------------------------------------
-- CPU control bus outputs 
--------------------------------------------------------------------------
-- tristate
RnW <= 'Z' when (cpu_hlda = '1') else (cpu_bctrl and int_rnw);
VMA <= 'Z' when (cpu_hlda = '1') else (cpu_bctrl and int_vma);
PnD <= 'Z' when (cpu_hlda = '1') else (cpu_bctrl and int_pnd);
-- not tristate
HALT <= i_is_halt;
TRACEOUT <= int_trace;
DONE <= (not reg_clk) and int_done;
FETCH <= cpu_fetch;
HOLDA <= cpu_hlda;
INTA <= cpu_inta;

int_done <= (not int_trace) when (cpu_irexe = '1') else cpu_done;

----------------------------------------------------------------------------
-- CPU Address bus output
----------------------------------------------------------------------------
ABUS <= "ZZZZZZZZZZZZZZZZ" when (cpu_hlda = '1') else int_abus;	

-- internal address bus is either:
-- addition of all registers that project address (VMA = 1, RnW = 0/1, normal memory read/write)
-- or 
-- register address (VMA = 1, RnW = 0, trace mode)
int_abus <= ("0000000000000" & cpu_upc(2 downto 0)) when (cpu_bctrl = '0') else std_logic_vector(unsigned(p2a) + unsigned(x2a) + unsigned(y2a) + unsigned(s2a));
p2a <= p when (reg_p_a = '1') else X"0000"; 
x2a <= x when (reg_x_a = '1') else X"0000"; 
y2a <= y when (reg_y_a = '1') else X"0000"; 
s2a <= s when (reg_s_a = '1') else X"0000"; 

-- indicate valid memory address if at least one register is projecting address
int_vma <= '0' when (cpu_inta = '1') else (reg_p_a or reg_x_a or reg_y_a or reg_s_a);

-- for Harvard mode, we need to know if program counter is involved in address generation
int_pnd <= reg_p_a;

---------------------------------------------------------------------------
-- CPU data bus outputs
---------------------------------------------------------------------------
-- internal data bus is logical OR of all registers that project data
DBUS <= "ZZZZZZZZZZZZZZZZ" when (((int_rnw and cpu_bctrl) or cpu_hlda) = '1') else int_fdbus;

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
d2d <= DBUS when (((int_rnw and int_vma) or cpu_inta) = '1') else X"0000"; 

-- capture READY at falling edge of CLK
on_clk: process(CLK)
begin
	if (falling_edge(CLK)) then
		int_ready <= READY;
	end if;
end process;

-- capture interrupt (positive edge triggered)
on_int: process(INT, RESET, cpu_inta)
begin
	if ((RESET or cpu_inta) = '1') then
		int_intr <= '0';
	else
		if (rising_edge(INT)) then
			int_intr <= flag_ie;
		end if;
	end if;
end process;

-- internal clock
-- halt instruction forces clock high, stopping the state machine, after which reset is needed
reg_clk <= (CLK and int_ready) or i_is_halt;

-- execution sequence counter and non-program accessible registers
on_reg_clk: process(reg_clk, RESET)
begin
	if (RESET = '1') then
		cpu_upc <= X"0";
		int_trace <= '0';
		reg_i <= c_NOP;	-- has no effect, won't be executed
		reg_f <= X"0001";	-- initialize C,Z flags to reflect register values
	else
		if (rising_edge(reg_clk)) then
			-- next instruction / state
			if (cpu_cond = '1') then
				cpu_upc <= cpu_then;
			else
				cpu_upc <= cpu_else;
			end if;

			-- load instruction register
			if (cpu_fetch = '1') then
				reg_i <= DBUS;
				-- change trace mode only at this time (at beginning of each new instruction)
				int_trace <= (TRACEIN or flag_te);	
			end if;

			-- load Flags register
			if (i_is_popf = '1') then
				reg_f <= DBUS;
			else
				-- only change the used bits of 16 bits in F[lags] register
				-- coming from special instructions
				flag_ie <= new_ie;
				flag_te <= new_te;
				-- coming from A, X, Y, S
				flag_ac <= reg_ac;
				flag_az <= reg_az;
				flag_xc <= reg_xc;
				flag_xz <= reg_xz;
				flag_yc <= reg_yc;
				flag_yz <= reg_yz;
				flag_sc <= reg_sc;
				flag_sz <= reg_sz;
			end if;
		end if;
	end if;
end process;

-- internal condition code flag
with cpu_if select cpu_cond <= 
	HOLD when if_hold,
	not(int_trace or int_intr) when if_cont,
	int_trace when if_trce,
	int_intr when others;

-- current instruction is 1 out of 16 32-bit words
cpu_instruction <= cpu_program(to_integer(unsigned(cpu_upc)));

-- CPU executes either internal instruction, or the one from instruction register
cpu_uinstruction <= reg_i when (cpu_irexe = '1') else cpu_i;

-- decode some instructions to drive internal control signals
i_is_ftos <= '1' when (cpu_uinstruction = c_FTOS) else '0';
i_is_popf <= '1' when (cpu_uinstruction = c_POPF) else '0';
i_is_pushf <= '1' when (cpu_uinstruction = c_PUSHF) else '0';
i_is_halt <= '1' when (cpu_uinstruction = c_HALT) else '0';
i_is_int(1) <= '1' when (cpu_uinstruction = c_INTON) else '0';
i_is_int(0) <= '1' when (cpu_uinstruction = c_INTOFF) else '0';
i_is_trace(1) <= '1' when (cpu_uinstruction = c_TRACEON) else '0';
i_is_trace(0) <= '1' when (cpu_uinstruction = c_TRACEOFF) else '0';

-- clunky way to update interrupt and trace flags
with i_is_int select new_ie <=
	'1' when "10",
	'0' when "01",
	flag_ie when others;
	
with i_is_trace select new_te <=
	'1' when "10",
	'0' when "01",
	flag_te when others;
	
-- operation count
OPCNT <= (not cpu_irexe) & bitcnt5(to_integer(unsigned(opr_vector)))(2 downto 0);
-- all registers are idle
opr_nop <= '1' when (opr_vector(3 downto 0) = X"0") else '0';

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
			reg_a => reg_p_a,
			active => opr_p
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
			reg_a => open,				-- A[ccumulator] never projects address
			active => opr_a
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
			reg_a => reg_x_a,
			active => opr_x
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
			reg_a => reg_y_a,
			active => opr_y
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
			reg_a => reg_s_a,
			active => opr_s
		);

end Behavioral;

