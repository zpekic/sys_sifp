----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:23:43 11/11/2022 
-- Design Name: 
-- Module Name:    clockgen - Behavioral 
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

entity clockgen is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           baudrate_sel : in  STD_LOGIC_VECTOR (2 downto 0);
           cpuclk_sel : in  STD_LOGIC_VECTOR (2 downto 0);
			  ss_start: in STD_LOGIC;	-- falling edge triggered
			  ss_end: in STD_LOGIC;		-- falling edge triggered
           cpu_clk : out  STD_LOGIC;
           debounce_clk : out  STD_LOGIC;
           vga_clk : out  STD_LOGIC;
           baudrate_x4 : out  STD_LOGIC;
           baudrate : out  STD_LOGIC;
           freq50Hz : out  STD_LOGIC;
			  freq100Hz: out STD_LOGIC;
			  freq1Hz: out STD_LOGIC);
end clockgen;

architecture Behavioral of clockgen is

constant clk_board: integer := 50000000;	-- 50MHz

type prescale_lookup is array (0 to 7) of integer range 0 to 65535;
constant prescale_value: prescale_lookup := (
		(clk_board / (16 * 600)),
		(clk_board / (16 * 1200)),
		(clk_board / (16 * 2400)),
		(clk_board / (16 * 4800)),
		(clk_board / (16 * 9600)),
		(clk_board / (16 * 19200)),
		(clk_board / (16 * 38400)),
		(clk_board / (16 * 57600))
	);
	
signal freq_25M, freq_2048, freq_1600: std_logic_vector(11 downto 0);

signal baudrate_x8: std_logic;	
signal freq4096, freq3200: std_logic;
signal prescale_baud, prescale_4096, prescale_3200: integer range 0 to 65535;
	
signal ss_clk, ss_q: std_logic := '0';

begin

-- connect to outputs
with cpuclk_sel select cpu_clk <=
	(ss_q and freq_2048(8)) when "000",	-- single step
	freq_2048(8)	when "001",	-- 8Hz
	freq_2048(6)	when "010",	-- 32Hz
	freq_2048(4)	when "011",	-- 128Hz
	freq_25M(6)		when "100",	-- 390.625kHz
	freq_25M(4)		when "101",	-- 1.5625MHz
	freq_25M(2)		when "110",	-- 6.25MHz
	freq_25M(0)		when others;	-- 25MHz  
--	CLK				when others;	-- 50MHz  
	
-- single step lets through clock cycles between falling edges of ss_start and ss_stop signals
-- it is assumed that ss_end is triggered by some "end of machine cycle" signal
ss_clk <= ss_end when (ss_q = '1') else ss_start;
on_ss_clk: process(RESET, ss_clk, ss_q)
begin
	if (RESET = '1') then
		ss_q <= '1';
	else
		if (falling_edge(ss_clk)) then
			ss_q <= not ss_q;
		end if;
	end if;
end process;
-------------------------------------------------------
	
debounce_clk <= freq_25M(8);	-- 25MHz/256 = 97.65625 kHz
vga_clk <= freq_25M(0);			-- 25MHz/1 = 25MHz
freq50Hz <= freq_1600(5);		-- 1600/32 = 50Hz
freq100Hz <= freq_1600(4);		-- 1600/16 = 100Hz
freq1Hz <= freq_2048(11);		-- 2048/2048 = 1Hz
	
prescale: process(CLK, baudrate_x8, freq4096, freq3200, baudrate_sel)
begin
	if (rising_edge(CLK)) then
		if (prescale_baud = 0) then
			baudrate_x8 <= not baudrate_x8;
			prescale_baud <= prescale_value(to_integer(unsigned(baudrate_sel)));
		else
			prescale_baud <= prescale_baud - 1;
		end if;
		if (prescale_4096 = 0) then
			freq4096 <= not freq4096;
			prescale_4096 <= (clk_board / (2 * 4096));
		else
			prescale_4096 <= prescale_4096 - 1;
			--key_delayed <= key;
		end if;
		if (prescale_3200 = 0) then
			freq3200 <= not freq3200;
			prescale_3200 <= (clk_board / (2 * 3200));
		else
			prescale_3200 <= prescale_3200 - 1;
			--key_delayed <= key;
		end if;
	end if;
end process; 	

baudgen: entity work.sn74hc4040 port map (
			clock => baudrate_x8,
			reset => RESET,
			q(0) => baudrate_x4, 
			q(1) => open,
			q(2) => baudrate,
			q(11 downto 3) => open		
		);	

clockgen: entity work.sn74hc4040 port map (
			clock => CLK,	-- 50MHz crystal on Anvyl board
			reset => RESET,
			q => freq_25M
		);

powergen: entity work.sn74hc4040 port map (
			clock => freq4096,
			reset => RESET,
			q => freq_2048
		);
		
mainsgen: entity work.sn74hc4040 port map (
			clock => freq3200,
			reset => RESET,
			q => freq_1600
		);

end Behavioral;

