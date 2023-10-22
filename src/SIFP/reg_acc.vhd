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

entity reg_acc is
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
end reg_acc;

architecture Behavioral of reg_acc is

-- actual register value
signal r: std_logic_vector(15 downto 0);
-- helpers
signal y: std_logic_vector(17 downto 0);
signal y_z: std_logic;

begin

on_clk: process(clk, reset)
begin
	if (reset = '1') then
		r <= X"0000";
	else
		if (rising_edge(clk)) then
			case operation is
				when r_a_LDA | r_a_XOR | r_a_SLC | r_a_SRC | r_a_ADC | r_a_SBC =>
					r <= y(16 downto 1);
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

-- ALU is adder generating carry_out and zero flags
with operation select y <=
      '0' & din & '0' when r_a_LDA,
		'0' & (r xor din) & '0' when r_a_XOR,
      r & ci & '0' when r_a_SLC,
		'0' & ci & r when r_a_SRC,
      std_logic_vector(unsigned('0' & r & ci) + unsigned('0' & din & ci)) when r_a_ADC,
      std_logic_vector(unsigned('0' & r & ci) + unsigned('0' & (din xor X"FFFF") & ci)) when r_a_SBC,
		'0' & r & '0' when others;
		
y_z <= '1' when (y(15 downto 0) = X"0000") else '0';

-- zero flag output
with operation select zo <=
      y_z when r_a_LDA,
      y_z when r_a_XOR,
      y_z when r_a_SLC,
		y_z when r_a_SRC,
      y_z when r_a_ADC,
      y_z when r_a_SBC,
		zi when others;

-- carry flag output
with operation select co <=
      y(17) when r_a_ADC,
      y(17) when r_a_SBC,
      y(17) when r_a_SLC,
      y(0) when r_a_SRC,
		ci when others;

-- value
reg <= r;

-- projecting as data
reg_d <= '1' when (operation = r_a_STA) else '0';

-- projecting as address
reg_a <= '0';

---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_a select r_a <=
--      NOA when r_a_NOA, -- default value
--      LDA when r_a_LDA,
--      XOR when r_a_XOR,
--      SLC when r_a_SLC,
--      SRC when r_a_SRC,
--      ADC when r_a_ADC,
--      SBC when r_a_SBC,
--      STA when r_a_STA;
--      STA when r_a_A;
---- End boilerplate code

end Behavioral;

