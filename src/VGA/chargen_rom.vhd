----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:15:08 11/17/2018 
-- Design Name: 
-- Module Name:    chargen_rom - Behavioral 
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

entity chargen_rom is
    Port ( a : in  STD_LOGIC_VECTOR (10 downto 0);
           h : in  STD_LOGIC_VECTOR (2 downto 0);
			  pixel: out STD_LOGIC
			);
end chargen_rom;

architecture Behavioral of chargen_rom is

-- temporary character generator table
type chargen is array (0 to (128 * 8 - 1)) of std_logic_vector(7 downto 0);
constant tinyfont: chargen :=(
----------------------------------------------------------
-- Based on "TinyFont" from http://www.rinkydinkelectronics.com/r_fonts.php
----------------------------------------------------------
X"00", X"00", X"77", X"55", X"55", X"55", X"77", X"00", -- 00
X"00", X"00", X"71", X"51", X"51", X"51", X"71", X"00", -- 01
X"00", X"00", X"73", X"51", X"53", X"52", X"73", X"00", -- 02
X"00", X"00", X"73", X"51", X"53", X"51", X"73", X"00", -- 03
X"00", X"00", X"74", X"55", X"57", X"51", X"71", X"00", -- 04
X"00", X"00", X"77", X"54", X"57", X"51", X"77", X"00", -- 05
X"00", X"00", X"77", X"54", X"57", X"55", X"77", X"00", -- 06
X"00", X"00", X"77", X"51", X"52", X"54", X"74", X"00", -- 07
X"00", X"00", X"77", X"55", X"57", X"55", X"77", X"00", -- 08
X"00", X"00", X"77", X"55", X"57", X"51", X"77", X"00", -- 09
X"00", X"00", X"77", X"55", X"57", X"55", X"75", X"00", -- 0A
X"00", X"00", X"74", X"54", X"57", X"55", X"77", X"00", -- 0B
X"00", X"00", X"77", X"54", X"54", X"54", X"77", X"00", -- 0C
X"00", X"00", X"71", X"51", X"57", X"55", X"77", X"00", -- 0D
X"00", X"00", X"77", X"54", X"57", X"54", X"77", X"00", -- 0E
X"00", X"00", X"77", X"54", X"57", X"54", X"74", X"00", -- 0F
X"00", X"00", X"17", X"15", X"15", X"15", X"17", X"00", -- 10
X"00", X"00", X"11", X"11", X"11", X"11", X"11", X"00", -- 11
X"00", X"00", X"13", X"11", X"13", X"12", X"13", X"00", -- 12
X"00", X"00", X"13", X"11", X"13", X"11", X"13", X"00", -- 13
X"00", X"00", X"14", X"15", X"17", X"11", X"11", X"00", -- 14
X"00", X"00", X"17", X"14", X"17", X"11", X"17", X"00", -- 15
X"00", X"00", X"17", X"14", X"17", X"15", X"17", X"00", -- 16
X"00", X"00", X"17", X"11", X"12", X"14", X"14", X"00", -- 17
X"00", X"00", X"17", X"15", X"17", X"15", X"17", X"00", -- 18
X"00", X"00", X"17", X"15", X"17", X"11", X"17", X"00", -- 19
X"00", X"00", X"17", X"15", X"17", X"15", X"15", X"00", -- 1A
X"00", X"00", X"14", X"14", X"17", X"15", X"17", X"00", -- 1B
X"00", X"00", X"17", X"14", X"14", X"14", X"17", X"00", -- 1C
X"00", X"00", X"11", X"11", X"17", X"15", X"17", X"00", -- 1D
X"00", X"00", X"17", X"14", X"17", X"14", X"17", X"00", -- 1E
X"00", X"00", X"17", X"14", X"17", X"14", X"14", X"00", -- 1F
---------------------------------------------------------------
X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"00", -- <Space>
X"18", X"3C", X"3C", X"18", X"18", X"00", X"18", X"00", -- !
X"66", X"66", X"24", X"00", X"00", X"00", X"00", X"00", -- "
X"6C", X"6C", X"FE", X"6C", X"FE", X"6C", X"6C", X"00", -- #
X"18", X"3E", X"60", X"3C", X"06", X"7C", X"18", X"00", -- $
X"00", X"C6", X"CC", X"18", X"30", X"66", X"C6", X"00", -- %
X"38", X"6C", X"38", X"76", X"DC", X"CC", X"76", X"00", -- &
X"18", X"18", X"30", X"00", X"00", X"00", X"00", X"00", -- '
X"0C", X"18", X"30", X"30", X"30", X"18", X"0C", X"00", -- (
X"30", X"18", X"0C", X"0C", X"0C", X"18", X"30", X"00", -- )
X"00", X"66", X"3C", X"FF", X"3C", X"66", X"00", X"00", -- *
X"00", X"18", X"18", X"7E", X"18", X"18", X"00", X"00", -- +
X"00", X"00", X"00", X"00", X"00", X"18", X"18", X"30", -- , --
X"00", X"00", X"00", X"7E", X"00", X"00", X"00", X"00", -- -
X"00", X"00", X"00", X"00", X"00", X"18", X"18", X"00", -- .
X"06", X"0C", X"18", X"30", X"60", X"C0", X"80", X"00", -- /
X"7C", X"C6", X"CE", X"D6", X"E6", X"C6", X"7C", X"00", -- 0
X"18", X"38", X"18", X"18", X"18", X"18", X"7E", X"00", -- 1
X"7C", X"C6", X"06", X"1C", X"30", X"66", X"FE", X"00", -- 2
X"7C", X"C6", X"06", X"3C", X"06", X"C6", X"7C", X"00", -- 3
X"1C", X"3C", X"6C", X"CC", X"FE", X"0C", X"1E", X"00", -- 4
X"FE", X"C0", X"C0", X"FC", X"06", X"C6", X"7C", X"00", -- 5
X"38", X"60", X"C0", X"FC", X"C6", X"C6", X"7C", X"00", -- 6
X"FE", X"C6", X"0C", X"18", X"30", X"30", X"30", X"00", -- 7
X"7C", X"C6", X"C6", X"7C", X"C6", X"C6", X"7C", X"00", -- 8
X"7C", X"C6", X"C6", X"7E", X"06", X"0C", X"78", X"00", -- 9
X"00", X"18", X"18", X"00", X"00", X"18", X"18", X"00", -- :
X"00", X"18", X"18", X"00", X"00", X"18", X"18", X"30", -- ;
X"06", X"0C", X"18", X"30", X"18", X"0C", X"06", X"00", -- <
X"00", X"00", X"7E", X"00", X"00", X"7E", X"00", X"00", -- =
X"60", X"30", X"18", X"0C", X"18", X"30", X"60", X"00", -- >
X"7C", X"C6", X"0C", X"18", X"18", X"00", X"18", X"00", -- ?
X"7C", X"C6", X"DE", X"DE", X"DE", X"C0", X"78", X"00", -- @
X"38", X"6C", X"C6", X"FE", X"C6", X"C6", X"C6", X"00", -- A
X"FC", X"66", X"66", X"7C", X"66", X"66", X"FC", X"00", -- B
X"3C", X"66", X"C0", X"C0", X"C0", X"66", X"3C", X"00", -- C
X"F8", X"6C", X"66", X"66", X"66", X"6C", X"F8", X"00", -- D
X"FE", X"62", X"68", X"78", X"68", X"62", X"FE", X"00", -- E
X"FE", X"62", X"68", X"78", X"68", X"60", X"F0", X"00", -- F
X"3C", X"66", X"C0", X"C0", X"CE", X"66", X"3A", X"00", -- G
X"C6", X"C6", X"C6", X"FE", X"C6", X"C6", X"C6", X"00", -- H
X"3C", X"18", X"18", X"18", X"18", X"18", X"3C", X"00", -- I
X"1E", X"0C", X"0C", X"0C", X"CC", X"CC", X"78", X"00", -- J
X"E6", X"66", X"6C", X"78", X"6C", X"66", X"E6", X"00", -- K
X"F0", X"60", X"60", X"60", X"62", X"66", X"FE", X"00", -- L
X"C6", X"EE", X"FE", X"FE", X"D6", X"C6", X"C6", X"00", -- M
X"C6", X"E6", X"F6", X"DE", X"CE", X"C6", X"C6", X"00", -- N
X"7C", X"C6", X"C6", X"C6", X"C6", X"C6", X"7C", X"00", -- O
X"FC", X"66", X"66", X"7C", X"60", X"60", X"F0", X"00", -- P
X"7C", X"C6", X"C6", X"C6", X"C6", X"CE", X"7C", X"0E", -- Q
X"FC", X"66", X"66", X"7C", X"6C", X"66", X"E6", X"00", -- R
X"7C", X"C6", X"60", X"38", X"0C", X"C6", X"7C", X"00", -- S
X"7E", X"7E", X"5A", X"18", X"18", X"18", X"3C", X"00", -- T
X"C6", X"C6", X"C6", X"C6", X"C6", X"C6", X"7C", X"00", -- U
X"C6", X"C6", X"C6", X"C6", X"C6", X"6C", X"38", X"00", -- V
X"C6", X"C6", X"C6", X"D6", X"D6", X"FE", X"6C", X"00", -- W
X"C6", X"C6", X"6C", X"38", X"6C", X"C6", X"C6", X"00", -- X
X"66", X"66", X"66", X"3C", X"18", X"18", X"3C", X"00", -- Y
X"FE", X"C6", X"8C", X"18", X"32", X"66", X"FE", X"00", -- Z
X"3C", X"30", X"30", X"30", X"30", X"30", X"3C", X"00", -- [
X"C0", X"60", X"30", X"18", X"0C", X"06", X"02", X"00", -- <Backslash>
X"3C", X"0C", X"0C", X"0C", X"0C", X"0C", X"3C", X"00", -- ]
X"10", X"38", X"6C", X"C6", X"00", X"00", X"00", X"00", -- ^
X"00", X"00", X"00", X"00", X"00", X"00", X"00", X"FF", -- _
--------------------------------------------------------------
X"30", X"18", X"0C", X"00", X"00", X"00", X"00", X"00", -- '
X"00", X"00", X"78", X"0C", X"7C", X"CC", X"76", X"00", -- a
X"E0", X"60", X"7C", X"66", X"66", X"66", X"DC", X"00", -- b
X"00", X"00", X"7C", X"C6", X"C0", X"C6", X"7C", X"00", -- c
X"1C", X"0C", X"7C", X"CC", X"CC", X"CC", X"76", X"00", -- d
X"00", X"00", X"7C", X"C6", X"FE", X"C0", X"7C", X"00", -- e
X"3C", X"66", X"60", X"F8", X"60", X"60", X"F0", X"00", -- f
X"00", X"00", X"76", X"CC", X"CC", X"7C", X"0C", X"F8", -- g
X"E0", X"60", X"6C", X"76", X"66", X"66", X"E6", X"00", -- h
X"18", X"00", X"38", X"18", X"18", X"18", X"3C", X"00", -- i
X"06", X"00", X"06", X"06", X"06", X"66", X"66", X"3C", -- j
X"E0", X"60", X"66", X"6C", X"78", X"6C", X"E6", X"00", -- k
X"38", X"18", X"18", X"18", X"18", X"18", X"3C", X"00", -- l
X"00", X"00", X"EC", X"FE", X"D6", X"D6", X"D6", X"00", -- m
X"00", X"00", X"DC", X"66", X"66", X"66", X"66", X"00", -- n
X"00", X"00", X"7C", X"C6", X"C6", X"C6", X"7C", X"00", -- o
X"00", X"00", X"DC", X"66", X"66", X"7C", X"60", X"F0", -- p
X"00", X"00", X"76", X"CC", X"CC", X"7C", X"0C", X"1E", -- q
X"00", X"00", X"DC", X"76", X"60", X"60", X"F0", X"00", -- r
X"00", X"00", X"7E", X"C0", X"7C", X"06", X"FC", X"00", -- s
X"30", X"30", X"FC", X"30", X"30", X"36", X"1C", X"00", -- t
X"00", X"00", X"CC", X"CC", X"CC", X"CC", X"76", X"00", -- u
X"00", X"00", X"C6", X"C6", X"C6", X"6C", X"38", X"00", -- v
X"00", X"00", X"C6", X"D6", X"D6", X"FE", X"6C", X"00", -- w
X"00", X"00", X"C6", X"6C", X"38", X"6C", X"C6", X"00", -- x
X"00", X"00", X"C6", X"C6", X"C6", X"7E", X"06", X"FC", -- y
X"00", X"00", X"7E", X"4C", X"18", X"32", X"7E", X"00", -- z
X"0E", X"18", X"18", X"70", X"18", X"18", X"0E", X"00", -- {
X"18", X"18", X"18", X"18", X"18", X"18", X"18", X"00", -- |
X"70", X"18", X"18", X"0E", X"18", X"18", X"70", X"00", -- }
X"76", X"DC", X"00", X"00", X"00", X"00", X"00", X"00", -- ~
X"55", X"AA", X"55", X"AA", X"55", X"AA", X"55", X"AA"  -- DEL 
---------------------------------------------------------------

);
--attribute rom_style : string;
--attribute rom_style of tinyfont : signal is "block";

signal mask, pattern: std_logic_vector(7 downto 0);

begin

pattern <= tinyfont(to_integer(unsigned(a(9 downto 0))));
mask <= (others => a(10)); -- codes 128..255 are reverse pattern
-- HACK HACK!!! all char patters and shifted right to compensate for messed up horizontal timing!
--d <= mask xor ('0' & pattern(7 downto 1));
--d <= mask xor pattern;

with h select
	pixel <= (a(10) xor pattern(0)) when "000",
				(a(10) xor pattern(7)) when "001",
				(a(10) xor pattern(6)) when "010",
				(a(10) xor pattern(5)) when "011",
				(a(10) xor pattern(4)) when "100",
				(a(10) xor pattern(3)) when "101",
				(a(10) xor pattern(2)) when "110",
				(a(10) xor pattern(1)) when others;

end Behavioral;

