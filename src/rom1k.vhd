----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:24:33 12/12/2022 
-- Design Name: 
-- Module Name:    rom1k - Behavioral 
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
use work.sifp_package.all;
use work.helloworld_code.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rom1k is
	generic (
		filename: string := "";
		default_value: STD_LOGIC_VECTOR(15 downto 0) := X"7FFF" -- HALT instruction
	);
	Port ( 
		A : in  STD_LOGIC_VECTOR (11 downto 0);
		D : out  STD_LOGIC_VECTOR (15 downto 0);
		CS : in  STD_LOGIC;
		OE : in  STD_LOGIC
	);
end rom1k;

architecture Behavioral of rom1k is

-- function defined in the package pulls in the content of the 
-- hex file in generic parameter
--constant rom: mem1k16 := init_filememory(filename, 1024, default_value);

begin

--	D <= rom(to_integer(unsigned(A))) when ((CS and OE) = '1') else "ZZZZZZZZZZZZZZZZ";
D <= cpu_microcode(to_integer(unsigned(A))) when ((CS and OE) = '1') else "ZZZZZZZZZZZZZZZZ";

end Behavioral;

