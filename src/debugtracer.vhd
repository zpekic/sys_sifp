----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:29:08 11/12/2019 
-- Design Name: 
-- Module Name:    debugtracer - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.sifp_package.all;

entity debugtracer is
    Port ( reset : in  STD_LOGIC;
			  cpu_clk: in STD_LOGIC;
			  txd_clk: in STD_LOGIC;
			  continue: in STD_LOGIC;
           ready : out  STD_LOGIC;
           txd : out STD_LOGIC;
			  load : in STD_LOGIC;							-- load trigger selection
			  sel : in STD_LOGIC_VECTOR(4 downto 0);	-- 1 for signal that will trigger trace
           M1 : in  STD_LOGIC;
           nIOR : in  STD_LOGIC;
           nIOW : in  STD_LOGIC;
           nMEMR : in  STD_LOGIC;
           nMEMW : in  STD_LOGIC;
           ABUS : in  STD_LOGIC_VECTOR (15 downto 0);
           DBUS : in  STD_LOGIC_VECTOR (15 downto 0)
			  );
end debugtracer;

architecture Behavioral of debugtracer is

signal trace, trace_enable, tr_clk, tr_on, tr_off: std_logic;
signal reg_sel, cbus: std_logic_vector(4 downto 0);
signal counter: std_logic_vector(7 downto 0);
alias chrSel: std_logic_vector(3 downto 0) is counter(7 downto 4);
alias bitSel: std_logic_vector(3 downto 0) is counter(3 downto 0);

signal char_1, char_2, char_hex, char: std_logic_vector(7 downto 0);
signal hex: std_logic_vector(3 downto 0);

begin

ready <= not trace;
cbus <= M1 & nIOR & nIOW & nMEMR & nMEMW;

on_cpu_clk: process(reset, cpu_clk, ABUS, sel, nIOW)
begin
	if (reset = '1') then 
		trace_enable <= '1';
		reg_sel <= sel;
	else
		if (rising_edge(cpu_clk)) then
			-- update trace enable FF 
			-- responds to OUT 0x00 (trace off) to OUT 0x01 (trace on)
			if (load = '1') then
				reg_sel <= sel;
				trace_enable <= '1';
			end if;
			if ((ABUS(7 downto 1) = "0000000") and (nIOW = '0')) then
				trace_enable <= ABUS(0);
			end if;
		end if;
		if (falling_edge(cpu_clk)) then
			if (trace = '0') then
				if (trace_enable = '1') then
					trace <= (reg_sel(4) and M1) or 
								(reg_sel(3) and (not nIOR)) or 
								(reg_sel(2) and (not nIOW)) or 
								(reg_sel(1) and (not nMEMR)) or 
								(reg_sel(0) and (not nMEMW));
				else
					trace <= '0';
				end if;
			else
				if (char = X"00") then
					trace <= continue;
				else 
					trace <= '1';
				end if;
			end if;
		end if;
	end if;
end process;

---- main trace counter
on_txd_clk: process(txd_clk, trace, char)
begin
	if (trace = '0') then
		counter <= (others => '0');
	else
		if (rising_edge(txd_clk)) then
			if (char /= X"00") then
				counter <= std_logic_vector(unsigned(counter) + 1);
			end if;
		end if;
	end if;
end process;

-- character generation
with cbus select char_1 <=
	c('M') when "11101",
	c('M') when "01101",
	c('M') when "01110",
	c('I') when "00111",
	c('I') when "01011",
	"010" & cbus when others;
	--c('?') when others;

with cbus select char_2 <=
	c('1') when "11101",
	c('R') when "01101",
	c('W') when "01110",
	c('R') when "00111",
	c('W') when "01011",
	"010" & cbus when others;
	--c('?') when others;

with chrSel select hex <=
	ABUS(15 downto 12) when X"3",	-- A
	ABUS(11 downto 8) when X"4",	-- A
	ABUS(7 downto 4) when X"5",	-- A
	ABUS(3 downto 0) when X"6",	-- A
	DBUS(15 downto 12) when X"8",	-- D
	DBUS(11 downto 8) when X"9",	-- D
	DBUS(7 downto 4) when X"A",	-- D
	DBUS(3 downto 0) when others; -- D

char_hex <= hex2ascii(to_integer(unsigned(hex)));

with chrSel select char <= 
	char_1 when X"0",
	char_2 when X"1",
	c(',') when X"2",
--	char_hex when X"3",	-- A
--	char_hex when X"4",	-- A
--	char_hex when X"5",	-- A
--	char_hex when X"6",	-- A
	c(' ') when X"7",
--	char_hex when X"8",	-- D
--	char_hex when X"9", 	-- D
--	char_hex when X"A", 	-- D
--	char_hex when X"B", 	-- D
	char_CR when X"C",
	char_LF when X"D",
	X"00" when X"E",
	X"00" when X"F",
	char_hex when others;
	
-- serial output logic
with bitSel select txd <= 		
			'1'     when X"0", -- high while not busy
			'1'	  when X"1", -- delay 1 (to sync with txd_clk)
			'1'	  when X"2", -- delay 2 
			'0' 	  when X"3", -- start bit
			char(0) when X"4", -- data
			char(1) when X"5",
			char(2) when X"6",
			char(3) when X"7",
			char(4) when X"8",
			char(5) when X"9",
			char(6) when X"A",
			char(7) when X"B",
			'1'     when X"C",	-- parity or stop
			'1' 	  when X"D",	-- stop
			'1' when others;		-- delay
			
end Behavioral;

