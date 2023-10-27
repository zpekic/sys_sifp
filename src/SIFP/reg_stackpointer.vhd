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

entity reg_stackpointer is
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
           reg_a : out  STD_LOGIC;
			  active: out STD_LOGIC);
end reg_stackpointer;

architecture Behavioral of reg_stackpointer is

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
				when r_s_M_POP | r_s_M_PUSH | r_s_ADS | r_s_LDS =>
					r <= y(16 downto 1);
				when others =>
					null;
			end case;
		end if;
	end if;
end process;

-- ALU is adder generating carry_out and zero flags
with operation select y <=
      std_logic_vector(unsigned('0' & r & '1') + unsigned('0' & (din xor X"FFFF") & '1')) when r_s_CPS,
      std_logic_vector(unsigned('0' & r & '1') + unsigned('0' & (din and X"0000") & '1')) when r_s_M_POP,
      std_logic_vector(unsigned('0' & r & '0') + unsigned('0' & (din or  X"FFFF") & '0')) when r_s_M_PUSH,
      std_logic_vector(unsigned('0' & r & '0') + unsigned('0' & din & '0')) when r_s_ADS,
      '0' & din & '0' when r_s_LDS,
		'0' & r & '0' when others;
		
y_z <= '1' when (y(16 downto 1) = X"0000") else '0';

-- zero flag output
with operation select zo <=
      y_z when r_s_CPS,
      y_z when r_s_M_POP,
      y_z when r_s_M_PUSH,
		y_z when r_s_LDS,
      y_z when r_s_ADS,
		zi when others;

-- carry flag output
with operation select co <=
      y(17) when r_s_CPS,
      y(17) when r_s_M_POP,
      y(17) when r_s_M_PUSH,
      y(17) when r_s_ADS,
		ci when others;

-- value
reg <= y(16 downto 1) when (operation = r_s_M_PUSH) else r;

-- projecting as data
reg_d <= '1' when (operation = r_s_STS) else '0';

-- projecting as address
with operation select reg_a <= 
	'1' when r_s_M_POP,
	'1' when r_s_M_PUSH,
	'1' when r_s_M_S,
	'0' when others;

-- active when the operation is anything except NOS
active <= '0' when (operation = r_s_NOS) else '1';

---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_s select r_s <=
--      NOS when r_s_NOS, -- default value
--      CPS when r_s_CPS,
--      M[POP] when r_s_M[POP],
--      M[PUSH] when r_s_M[PUSH],
--      LDS when r_s_LDS,
--      ADS when r_s_ADS,
--      M[S] when r_s_M[S],
--      STS when r_s_STS;
--      STS when r_s_S;
---- End boilerplate code
end Behavioral;

