----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:29 10/21/2023 
-- Design Name: 
-- Module Name:    indexreg - Behavioral 
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
use work.helloworld_code.all;

entity reg_index is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           operation : in  STD_LOGIC_VECTOR(2 downto 0);
           din : in  STD_LOGIC_VECTOR(15 downto 0);
           zi : in  STD_LOGIC;
           ci : in  STD_LOGIC;
           reg : out STD_LOGIC_VECTOR(15 downto 0);
           zo : out  STD_LOGIC;
           co : out  STD_LOGIC;
           reg_d : out  STD_LOGIC;
           reg_a : out  STD_LOGIC);
end reg_index;

architecture Behavioral of reg_index is

-- actual register value
signal r: std_logic_vector(15 downto 0);
-- helpers
signal y: std_logic_vector(16 downto 0);
signal y_z: std_logic;

begin

on_clk: process(clk, reset)
begin
	if (reset = '1') then
		r <= X"0000";
	else
		if (rising_edge(clk)) then
			case operation is
				when r_x_INX | r_x_DEX | r_x_LDX | r_x_ADX =>
					r <= y(15 downto 0);
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

-- ALU is adder generating carry_out and zero flags
with operation select y <=
      std_logic_vector(unsigned('0' & r) - unsigned(din)) when r_x_CPX,
      std_logic_vector(unsigned('0' & r) + 1) when r_x_INX,
      std_logic_vector(unsigned('0' & r) - 1) when r_x_DEX,
      '0' & din when r_x_LDX,
      std_logic_vector(unsigned('0' & r) + unsigned(din)) when r_x_ADX,
		'0' & r when others;
		
y_z <= '1' when (y(15 downto 0) = X"0000") else '0';

-- zero flag output
with operation select zo <=
      y_z when r_x_CPX,
      y_z when r_x_INX,
      y_z when r_x_DEX,
		y_z when r_x_LDX,
      y_z when r_x_ADX,
		zi when others;

-- carry flag output
with operation select co <=
      y(16) when r_x_CPX,
      y(16) when r_x_INX,
      y(16) when r_x_DEX,
      y(16) when r_x_ADX,
		ci when others;

-- value
reg <= r;

-- projecting as data
reg_d <= '1' when (operation = r_x_STX) else '0';

-- projecting as address
reg_a <= '1' when (operation = r_x_M_X) else '0';

---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_x select r_x <=
--      NOX when r_x_NOX, -- default value
--      CPX when r_x_CPX,
--      INX when r_x_INX,
--      DEX when r_x_DEX,
--      LDX when r_x_LDX,
--      ADX when r_x_ADX,
--      M[X] when r_x_M[X],
--      STX when r_x_STX;
--      STX when r_x_X;
---- End boilerplate code

end Behavioral;

