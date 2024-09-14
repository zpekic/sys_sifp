----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:22:55 09/07/2024 
-- Design Name: 
-- Module Name:    bin2mem - Behavioral 
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

entity bin2mem is
    Port ( reset : in  STD_LOGIC;
           rxd : in  STD_LOGIC;
           rxd_clk4 : in  STD_LOGIC;
           delay_clk : in  STD_LOGIC;
           busy : buffer  STD_LOGIC;
           a : out  STD_LOGIC_VECTOR(15 downto 0);
           d : out  STD_LOGIC_VECTOR(15 downto 0);
           rnW : out STD_LOGIC;
			  vma: out STD_LOGIC;
			  pnD : out STD_LOGIC;
			  --
			  debug: out STD_LOGIC_VECTOR(15 downto 0));
end bin2mem;

architecture Behavioral of bin2mem is

signal bytecnt: std_logic_vector(16 downto 0); -- 17 bits to have 64k 16-bit words
signal binbyte: std_logic_vector(7 downto 0);
signal binword: std_logic_vector(15 downto 0);
signal delay_reg: std_logic_vector(3 downto 0);
signal ready, nWrite: std_logic;
 
begin

-- external reset while receiving and a bit of delay after
on_delayclk: process(reset, ready, delay_clk)
begin
	if ((ready or reset) = '1') then
		delay_reg <= (others => '0');
	else
		if (rising_edge(delay_clk)) then
			delay_reg <= delay_reg(2 downto 0) & '1'; -- fill with 1s
		end if;
	end if;
end process;

nWrite <= not(bytecnt(0) and ready);
busy <= '0' when (delay_reg = "1111") else '1';

on_writeword: process(nWrite)
begin
	if (rising_edge(nWrite)) then
		debug <= binword;
	end if;
end process;

-- 3-state outputs
a <= "ZZZZZZZZZZZZZZZZ" when ((busy and bytecnt(0)) = '1') else bytecnt(16 downto 1);
d <= "ZZZZZZZZZZZZZZZZ" when ((busy and bytecnt(0)) = '1') else binword;
vma <= 'Z' when (nWrite = '1') else '1';
rnW <= 'Z' when (nWrite = '1') else '0';
pnD <= 'Z' when (nWrite = '1') else '0';

-- count incoming binary bytes
on_ready: process(reset, delay_reg, ready)
begin
	if (reset = '1' or (delay_reg = "0111")) then
		bytecnt <= (others => '0');
	else
		if (rising_edge(ready)) then
			-- assemble 16-bit word (MSB is received first)
			binword <= binword(7 downto 0) & binbyte;	
		end if;
		if (falling_edge(ready)) then
			bytecnt <= std_logic_vector(unsigned(bytecnt) + 1);
		end if;
	end if;
end process;

receiver: entity work.uart_ser2par Port map ( 
			reset => reset, 
			rxd_clk => rxd_clk4,
			mode => "000",		-- 8N1 (8 data, 1 stop) 
			char => binbyte,
			ready => ready,
			valid => open,
			rxd => rxd
		);
		
end Behavioral;

