----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:29:38 09/13/2024 
-- Design Name: 
-- Module Name:    mem2mif - Behavioral 
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

entity mem2mif is
    Port ( reset : in  STD_LOGIC;
           txd : out  STD_LOGIC;
           txd_clk : in  STD_LOGIC;
			  enable : in STD_LOGIC;
           busy : buffer  STD_LOGIC;
           a : out  STD_LOGIC_VECTOR (15 downto 0);
           d : in  STD_LOGIC_VECTOR (15 downto 0);
           rnW : out  STD_LOGIC;
           vma : out  STD_LOGIC;
           pnD : out  STD_LOGIC;
           debug : out  STD_LOGIC_VECTOR (15 downto 0));
end mem2mif;

architecture Behavioral of mem2mif is

signal counter: std_logic_vector(23 downto 0);
alias cnt_bit: std_logic_vector(3 downto 0) is counter(3 downto 0);
alias cnt_char: std_logic_vector(3 downto 0) is counter(7 downto 4);
alias cnt_addr: std_logic_vector(15 downto 0) is counter(23 downto 8);
signal readmem: std_logic;
signal hex: std_logic_vector(3 downto 0);
signal char_hex, char: std_logic_vector(7 downto 0);

begin

readmem <= cnt_char(3) and (not cnt_char(2)) and busy;
	
a <= "ZZZZZZZZZZZZZZZZ" when (readmem = '0') else cnt_addr; 
rnW <= 'Z' when (readmem = '0') else '1'; 
vma <= 'Z' when (readmem = '0') else '1'; 
pnD <= 'Z' when (readmem = '0') else '0'; 

on_txdclk: process(reset, txd_clk)
begin
	if (reset = '1') then
		counter <= (others => '1'); -- set to -1
		busy <= '0';
	else
		if (rising_edge(txd_clk)) then
			if (enable = '1') then					-- TODO: sense enable only on address change
				if (cnt_addr = X"0800") then		-- TODO: pass in end address
					busy <= '0';
					--counter <= (others => '1');	-- reset to -1
				else
					busy <= '1';
					counter <= std_logic_vector(unsigned(counter) + 1);
				end if;
			else
				busy <= '0';
			end if;
		end if;
	end if;
end process;

with cnt_char select hex <=
	cnt_addr(15 downto 12) when X"0",-- A
	cnt_addr(11 downto 8) when X"1",	-- A
	cnt_addr(7 downto 4) when X"2",	-- A
	cnt_addr(3 downto 0) when X"3",	-- A
	d(15 downto 12) when X"8",	-- D
	d(11 downto 8) when X"9",	-- D
	d(7 downto 4) when X"A",	-- D
	d(3 downto 0) when X"B",	-- D
	X"0" when others;

char_hex <= hex2ascii(to_integer(unsigned(hex)));

with cnt_char select char <= 
	c(' ') when X"4",
	c(':') when X"5",
	c(' ') when X"6",
	c(' ') when X"7",
	c(' ') when X"C",
	c(' ') when X"D",
	char_CR when X"E",
	char_LF when X"F",
	char_hex when others;
	
-- serial output logic
with cnt_bit select txd <= 		
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

