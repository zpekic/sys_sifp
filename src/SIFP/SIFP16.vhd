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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

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

begin

ABUS <= X"0000";
DBUS <= "ZZZZZZZZZZZZZZZZ";
RnW <= '1';
VMA <= '1';
PnD <= '1';
HALT <= '0';
FETCH <= '1';

end Behavioral;

