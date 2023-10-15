----------------------------------------------------------------------------------
-- Company: 	https://hackaday.io/projects/hacker/233652
-- Engineer:	zpekic@hotmail.com
---------------------------------------------------------------------------------- 
-- Create Date: 10/11/2023 11:13:02 PM
-- Design Name: FPGA implementation of Single Instruction Format Processor
-- Module Name: sys_sifp_mercury - Behavioral
-- Project Name: 
-- Target Devices: https://www.micro-nova.com/mercury/ + Baseboard
-- Input devices: 
--
-- Tool Versions: ISE 14.7 (nt)
-- Description:    
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.99 - Kinda works...
-- Additional Comments: 
-- https://hackaday.io/project/173996-sifp-single-instruction-format-processor
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use work.sifp_package.all;

entity sys_sifp_mercury is
    Port ( 
				-- 50MHz on the Mercury board
				CLK: in std_logic;
				
				-- 12MHz external clock
				EXT_CLK: in std_logic;
				
				-- Master reset button on Mercury board
				USR_BTN: in std_logic; 

				-- Switches on baseboard
				-- SW(0) -- BAUDRATE SEL 0
				-- SW(1) -- BAUDRATE SEL 1
				-- SW(2) -- BAUDRATE SEL 2
				-- SW(3) -- OFF: EXTERNAL ROM, ON: INTERNAL ROM
				-- SW(4) -- CPUCLK SEL 0
				-- SW(5) -- CPUCLK SEL 1
				-- SW(6) -- CPUCLK SEL 2
				-- SW(7)	-- OFF: STOP, ON: RUN

				SW: in std_logic_vector(7 downto 0); 

				-- Push buttons on baseboard
				-- BTN0 - single step (effective if SW(6 downto 4)) = "000"
				-- BTN1 - not used
				-- BTN2 - not used
				-- BTN3 - not used
				BTN: in std_logic_vector(3 downto 0); 

				-- Stereo audio output on baseboard
				--AUDIO_OUT_L, AUDIO_OUT_R: out std_logic;

				-- 7seg LED on baseboard 
				A_TO_G: out std_logic_vector(6 downto 0); 
				AN: out std_logic_vector(3 downto 0); 
				DOT: out std_logic; 
				-- 4 LEDs on Mercury board (3 and 2 are used by VGA VSYNC and HSYNC)
				LED: out std_logic_vector(1 downto 0);

				-- ADC interface
				-- channel	input
				-- 0			Audio Left
				-- 1 			Audio Right
				-- 2			Temperature
				-- 3			Light	
				-- 4			Pot
				-- 5			Channel 5 (free)
				-- 6			Channel 6 (free)
				-- 7			Channel 7 (free)
				--ADC_MISO: in std_logic;
				--ADC_MOSI: out std_logic;
				--ADC_SCK: out std_logic;
				--ADC_CSN: out std_logic;
				--PS2_DATA: in std_logic;
				--PS2_CLOCK: in std_logic;

				--VGA interface
				--register state is traced to VGA after each instruction if SW0 = on
				--640*480 50Hz mode is used, which give 80*60 character display
				--but to save memory, only 80*50 are used which fits into 4k video RAM
				HSYNC: out std_logic;
				VSYNC: out std_logic;
				RED: out std_logic_vector(2 downto 0);
				GRN: out std_logic_vector(2 downto 0);
				BLU: out std_logic_vector(1 downto 0);
				
				--PMOD interface
				PMOD: inout std_logic_vector(7 downto 0)
          );
end sys_sifp_mercury;

architecture Structural of sys_sifp_mercury is

signal RESET: std_logic;

-- Connect to PmodUSBUART 
-- https://digilent.com/reference/pmod/pmodusbuart/reference-manual
alias PMOD_RTS0: std_logic is PMOD(0);	
alias PMOD_RXD0: std_logic is PMOD(1);
alias PMOD_TXD0: std_logic is PMOD(2);
alias PMOD_CTS0: std_logic is PMOD(3);	
alias PMOD_RTS1: std_logic is PMOD(4);
alias PMOD_RXD1: std_logic is PMOD(5);
alias PMOD_TXD1: std_logic is PMOD(6);
alias PMOD_CTS1: std_logic is PMOD(7);
--
signal switch: std_logic_vector(7 downto 0);
--alias sw_run: std_logic is switch(7);
alias sw_cpuclk: std_logic_vector(2 downto 0) is switch(6 downto 4);
--alias sw_internalrom: std_logic is switch(3);
alias sw_baudrate: std_logic_vector(2 downto 0) is switch(2 downto 0);

--
signal button: std_logic_vector(3 downto 0);
alias btn_ss: std_logic is button(0);

--- frequency signals
signal vga_clk: std_logic;
signal debounce_clk: std_logic;
signal baudrate_x4, baudrate: std_logic;	
signal cpu_clk: std_logic;
signal freq100Hz, freq50Hz, freq1Hz: std_logic;

signal cnt: std_logic_vector(31 downto 0);

-- VGA signals
signal hactive, vactive: std_logic;
signal win_x, win_y, win: std_logic;
signal char_x, char_y: std_logic_vector(7 downto 0);
signal vga_x, vga_y: std_logic_vector(7 downto 0);

-- loopback
signal rx_char, tx_char: std_logic_vector(7 downto 0);
signal rx_ready, tx_send, tx_ready, tty_sent: std_logic;

-- 7seg LED
signal blank: std_logic;

-- CPU bus
signal ABUS: std_logic_vector(15 downto 0);
signal DBUS: std_logic_vector(15 downto 0);
signal VMA, VRA, HALT, RnW, PnD: std_logic;

begin   

-- master reset
RESET <= USR_BTN;

-- debug!
counter: process(EXT_CLK)
begin
	if (RESET = '1') then
		cnt <= X"00000000";
	else
		if (rising_edge(EXT_CLK)) then
			cnt <= std_logic_vector(unsigned(cnt) + 1);
		end if;
	end if;
end process;

-- 1k words of ROM contains the "helloworld" program
appware: entity work.rom1k generic map(
		filename => "..\prog\helloworld_code.hex",
		default_value => X"7FFF"	-- HALT
	)	
	port map(
		D => DBUS,
		A => ABUS(9 downto 0),
		CS => button(3), -- TODO
		OE => '1' -- TODO
	);

-- CPU!

-- generate various frequencies
clocks: entity work.clockgen Port map ( 
		CLK => CLK, 	-- 50MHz on Mercury board
		RESET => RESET,
		baudrate_sel => sw_baudrate,
		cpuclk_sel =>	 sw_cpuclk,
		pulse => btn_ss,
		cpu_clk => cpu_clk,
		debounce_clk => debounce_clk,
		vga_clk => vga_clk,
		baudrate_x4 => baudrate_x4,
		baudrate => baudrate,
		freq100Hz => freq100Hz,
		freq50Hz => freq50Hz,
		freq1Hz => freq1Hz
		);

-- video
vga: entity work.mwvga Port map ( 
		reset => RESET,
		clk => vga_clk,
		border_char => c(' '),
		win_char => DBUS(7 downto 0),
		win => win,
		win_color => switch(0),
		hactive => hactive,
		vactive => vactive,
		x => vga_x,
		y => vga_y,
		cursor_enable => '0',
		cursor_type => '0',
		-- VGA connections
		color(11) => open,
		color(10 downto 8) => RED,
		color(7) => open,
		color(6 downto 4) => GRN,
		color(3 downto 2) => open,
		color(1 downto 0) => BLU,
		hsync => HSYNC,
		vsync => VSYNC
		);

-- 2k video RAM is only sufficient for 32*64 text window positioned at center screen
char_x <= std_logic_vector(unsigned(vga_x) - ((80 - 64)/2));
char_y <= std_logic_vector(unsigned(vga_y) - ((60 - 32)/2));
win_x <= '1' when (unsigned(char_x) < 64) else '0';
win_y <= '1' when (unsigned(char_y) < 32) else '0';
win <= win_x and win_y;

ABUS <= "00000" & char_y(4 downto 0) & char_x(5 downto 0);

vram: entity work.simpleram 
generic map(
	address_size => 11,
	default_value => X"2B"
	)	
port map(
	  clk => cpu_clk,
	  D => DBUS(7 downto 0), 
	  A => ABUS(10 downto 0),
	  RnW => '1',
	  CS => not (button(3))
);
		
acia0: entity work.uart Port map (
			reset => Reset,
			clk => cpu_clk,
			clk_txd => baudrate,		-- 38400
			clk_rxd => baudrate_x4,	-- 115200
			CS => '0',
			RnW => '1',
			RS => ABUS(0),
			D => DBUS(7 downto 0),
			debug => open,
			TXD => PMOD_RXD0,
			RXD => PMOD_TXD0
		);
		
		
-- LEDs
LED(0) <= freq1Hz; 
LED(1) <= cnt(31);
--LED <= cnt(31 downto 28);
	
-- 7segment LED 
led4x7: entity work.fourdigitsevensegled port map ( 
	  -- inputs
	  data => cnt(31 downto 16),
	  digsel(1) => freq50Hz,
	  digsel(0) => freq100Hz,
	  showdigit => "1111",
	  showdot => button,
	  showsegments => '1',
	  -- outputs
	  anode => AN,
	  segment(6 downto 0) => A_TO_G(6 downto 0),
	  segment(7) => DOT
	 );
			 
-- generate 4 debouncers for buttons and 8 for switches to clean input signals
debouncer_generate: for i in 0 to 7 generate
begin
	dbc: if (i < 4) generate
		db_btn: entity work.debouncer port map 
		(
			clock => debounce_clk,
			reset => RESET,
			signal_in => BTN(i),
			signal_out => button(i)
		);
	end generate;
	
	db_sw: entity work.debouncer port map 
	(
		clock => debounce_clk,
		reset => RESET,
		signal_in => SW(i),
		signal_out => switch(i)
	);
end generate;
		
end;
