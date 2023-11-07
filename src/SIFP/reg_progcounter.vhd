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

entity reg_progcounter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           operation : in  STD_LOGIC_VECTOR(3 downto 0);
           din : in  STD_LOGIC_VECTOR(15 downto 0);
           cond : in  STD_LOGIC_VECTOR(7 downto 0);
           reg : out STD_LOGIC_VECTOR(15 downto 0);
           reg_d : out  STD_LOGIC;
           reg_a : out  STD_LOGIC;
			  active: out STD_LOGIC);
end reg_progcounter;

architecture Behavioral of reg_progcounter is

-- actual register value
signal r: std_logic_vector(15 downto 0);
signal cond_current: std_logic;
alias operation_is_conditional: std_logic is operation(3);

begin

on_clk: process(clk, reset)
begin
	if (reset = '1') then
		r <= X"0000";	-- start execution at location 0, i808x/CDP1802 style
	else
		if (rising_edge(clk)) then
			if (operation_is_conditional = '1') then
			-- conditional 
				if (cond_current = '1') then
					r <= std_logic_vector(unsigned(r) + unsigned(din)); 
				else
					r <= std_logic_vector(unsigned(r) + 1); 
				end if;
			else
			-- not conditional
				case operation is
					when r_p_JUMP =>
						r <= din;	-- din <= M[P]
					when r_p_LDP =>
						r <= din;	-- din <= any other reg/mem
					when r_p_BRANCH =>
						r <= std_logic_vector(unsigned(r) + unsigned(din)); 
					when r_p_M_IMM =>
						r <= std_logic_vector(unsigned(r) + 1); 
					when others =>
						null;
				end case;
			end if;
		end if;
	end if;
end process;

-- select condition from 8 incoming flags, based on operation
cond_current <= (not operation_is_conditional) or cond(to_integer(unsigned(operation(2 downto 0))));

-- value
with operation select reg <= 
		std_logic_vector(unsigned(r) + 2) when r_p_P2,
		std_logic_vector(unsigned(r) + 4) when r_p_P4,
		r when others;

-- projecting as data
with operation select reg_d <= 
		'1' when r_p_P0,
		'1' when r_p_P2,
		'1' when r_p_P4,
		'0' when others;

-- projecting as address
with operation select reg_a <= 
		'0' when r_p_NOP,
		'0' when r_p_LDP,
		'0' when r_p_P2,
		'0' when r_p_P4,
		'0' when r_p_P0,
		'1' when others;

-- active when the operation is anything except NOP
active <= '0' when (operation = r_p_NOP) else '1';

---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_p select r_p <=
--      NOP when r_p_NOP, -- default value
--      LDP when r_p_LDP,
--      BRANCH when r_p_BRANCH,
--      BRANCH when r_p_IF_TRUE,
--      JUMP when r_p_JUMP,
--      JUMP when r_p_GOTO,
--      P4 when r_p_P4,
--      P2 when r_p_P2,
--      P0 when r_p_P0,
--      M[IMM] when r_p_M[IMM],
--      BAC when r_p_BAC,
--      BAC when r_p_IF_AC,
--      BAC when r_p_IF_A_GE,
--      BAZ when r_p_BAZ,
--      BAZ when r_p_IF_AZ,
--      BAZ when r_p_IF_A_EQ,
--      BXC when r_p_BXC,
--      BXC when r_p_IF_XC,
--      BXC when r_p_IF_X_GE,
--      BXZ when r_p_BXZ,
--      BXZ when r_p_IF_XZ,
--      BXZ when r_p_IF_X_EQ,
--      BYC when r_p_BYC,
--      BYC when r_p_IF_YC,
--      BYC when r_p_IF_Y_GE,
--      BYZ when r_p_BYZ,
--      BYZ when r_p_IF_YZ,
--      BYZ when r_p_IF_Y_EQ,
--      BSC when r_p_BSC,
--      BSC when r_p_IF_SC,
--      BSC when r_p_IF_S_GE,
--      BSZ when r_p_BSZ;
--      BSZ when r_p_IF_SZ;
--      BSZ when r_p_IF_S_EQ;
---- End boilerplate code

end Behavioral;

