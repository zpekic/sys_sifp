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
				
				-- 96MHz external clock
				EXT_CLK: in std_logic;
				
				-- Master reset button on Mercury board
				USR_BTN: in std_logic; 

				-- Switches on baseboard
				-- SW(0) -- TRACE on MEM READ
				-- SW(1) -- TRACE on MEM WRITE
				-- SW(2) -- TRACE on INSTR FETCH
				-- SW(3) -- TRACE on REG WRITE
				-- SW(4) -- CPUCLK SEL 0
				-- SW(5) -- CPUCLK SEL 1
				-- SW(6) -- CPUCLK SEL 2
				-- SW(7)	-- TRACE

				SW: in std_logic_vector(7 downto 0); 

				-- Push buttons on baseboard
				-- BTN0 - single step (effective if SW(7 downto 4)) = "X000"
				-- BTN1 - not used
				-- BTN2 - display operations per second, not instructions per second *10000
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
signal rts0_pulse, rts0_delay: std_logic;

--
signal switch: std_logic_vector(7 downto 0);
alias sw_tracesel: std_logic_vector(3 downto 0) is switch(3 downto 0);
alias sw_cpuclk: std_logic_vector(2 downto 0) is switch(6 downto 4);
alias sw_trace: std_logic is switch(7);

--
signal button: std_logic_vector(3 downto 0);
alias btn_traceload: std_logic is button(0);
alias btn_continue: std_logic is button(1);
alias btn_ledsel: std_logic is button(2);
alias btn_clk: std_logic is button(3);

--- frequency signals
signal clkgen_vga: std_logic;	-- should be 25MHz
signal clkgen_debounce: std_logic;
signal clkgen_baudrate4, clkgen_baudrate: std_logic;	
signal clkgen_cpu: std_logic;
signal freq100Hz, freq50Hz, freq1Hz: std_logic;

signal continue, MemRead, MemWrite, RegWrite: std_logic;

-- VGA signals
--signal hactive, vactive: std_logic;
signal win_x, win_y, win: std_logic;
signal char_x, char_y: std_logic_vector(7 downto 0);
signal vga_x, vga_y: std_logic_vector(7 downto 0);
signal vram_douta, vram_doutb: std_logic_vector(7 downto 0);
signal vram_wea, vram_web: std_logic_vector(0 downto 0);	-- wacky but it works

-- select devices
signal cs_rom: std_logic := '0';
signal cs_vram: std_logic := '0';
signal cs_acia0: std_logic := '0';
signal cs_ram: std_logic := '0';

-- CPU bus output
signal ABUS: std_logic_vector(15 downto 0);
signal VMA: std_logic;		-- valid memory address
signal FETCH: std_logic;	-- fetching instruction (PnD is also 1)
signal DONE: std_logic;		-- sync'd with READY
signal HALT: std_logic;		-- CPU has halted 
signal OPCNT: std_logic_vector(3 downto 0);	-- operations per current instruction (0 to 5)
signal RnW: std_logic;		-- Read 1, Write 0
signal PnD: std_logic;		-- Program 1, Data 0 (can double address space for Harvard architecture)
-- CPU bus in/out
signal DBUS: std_logic_vector(15 downto 0);

-- other
signal tracer_ready, tracer_continue, ss_start: std_logic;
signal led_data: std_logic_vector(15 downto 0);
signal perfcnt_value: std_logic_vector(31 downto 0);
signal bus_valid: std_logic;
signal in_or_op: std_logic_vector(3 downto 0);

begin   

-- master reset
RESET <= USR_BTN;

-- CPU!
cpu: entity work.SIFP16 Port map (
		CLK => clkgen_cpu,
		RESET => RESET,
		READY => tracer_ready,
		TRACE => sw_trace,
		ABUS => ABUS,
		DBUS => DBUS,
		RnW => RnW,
		VMA => VMA,
		PnD => PnD,
		HALT => HALT,
		DONE => DONE,
		OPCNT => OPCNT,
		FETCH => FETCH
	);

-- Tracer watches system bus activity and if signal match is detected, freezes the CPU in 
-- the cycle by asserting low READY signal, and outputing the trace record to serial port
-- After that, cycle will continue if continue signal is high, or stop there.	 
	tracer: entity work.debugtracer Port map(
			reset => reset,
			cpu_clk => clkgen_cpu,
			txd_clk => clkgen_baudrate,
			continue => continue,  
			ready => tracer_ready,			-- freezes CPU when low
			txd => PMOD_RXD0,					-- output trace (to any TTY of special tracer running on the host
			load => btn_traceload,			-- load mask register if high
			sel(3 downto 0) => sw_tracesel,		-- set mask register
			REGW => RegWrite,
			FETCH => FETCH,
			MEMW => MemWrite,
			MEMR => MemRead,
			ABUS => ABUS,
			DBUS => DBUS
	);

MemRead <= VMA and RnW;
MemWrite <= VMA and (not RnW);
RegWrite <= (not VMA) and (not RnW);
	 
-- Tracer works best when it is paired with tracer.exe running on the host!
-- In addition, host is able to flip RTS pin to start/stop tracing 
-- See https://github.com/zpekic/sys9080/blob/master/Tracer/Tracer/Program.cs
rts0_pulse <= PMOD_RTS0 xor rts0_delay;

on_rts0_pulse: process(reset, rts0_pulse)
begin
	if ((RESET = '1') or (sw_cpuclk = "000")) then
		continue <= '0';
	else
		if (rising_edge(rts0_pulse)) then
			continue <= not continue;
		end if;
	end if;
end process;

on_clk: process(CLK)
begin
	if (rising_edge(CLK)) then
		rts0_delay <= PMOD_RTS0;
	end if;
end process;

ss_start <= not (btn_clk or rts0_delay);
-- generate various frequencies
clkgen: entity work.clockgen Port map ( 
		CLK => CLK, 	-- 50MHz on Mercury board
		RESET => RESET,
		baudrate_sel => "111",	-- 38400
		cpuclk_sel => sw_cpuclk,
		ss_start => ss_start,
		ss_end => DONE,
		cpu_clk => clkgen_cpu,
		debounce_clk => clkgen_debounce,
		vga_clk => clkgen_vga,
		baudrate_x4 => clkgen_baudrate4,
		baudrate => clkgen_baudrate,
		freq100Hz => freq100Hz,
		freq50Hz => freq50Hz,
		freq1Hz => freq1Hz
		);

-- VIDEO
-- 640*480 VGA, only 512*256 centered window is used
vga: entity work.mwvga Port map ( 
		reset => RESET,
		clk => clkgen_vga,
		border_char => c(' '),
		win_char => vram_doutb,
		win => win,
		win_color => sw_trace,	-- change color based on run/trace mode
		hactive => open, --hactive,
		vactive => open, --vactive,
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

-- 2k byte dual video RAM is sufficient for 32*64 text window positioned at center screen
-- each byte is ASCII code of char to display
-- read/write side is connected to CPU bus, LSB only
-- read only side is connected to VGA controller 
char_x <= std_logic_vector(unsigned(vga_x) - ((80 - 64)/2));
char_y <= std_logic_vector(unsigned(vga_y) - ((60 - 32)/2));
win_x <= '1' when (unsigned(char_x) < 64) else '0';
win_y <= '1' when (unsigned(char_y) < 32) else '0';
win <= win_x and win_y;

-- 0x1XXX (repeats twice)		
cs_vram <= VMA when (ABUS(15 downto 12) = X"1") else '0';

vram: entity work.ram2k8dual port map (
			-- connected to CPU bus
			clka => clkgen_cpu,
			ena => cs_vram,
			wea => vram_wea,
			addra => ABUS(10 DOWNTO 0),
			dina => DBUS(7 downto 0),
			douta => vram_douta,
			-- connected to VGA controller
			clkb => clkgen_vga,
			enb => '1',
			web => vram_web,
			addrb(10 downto 6) => char_y(4 downto 0),	-- 32 rows
			addrb(5 downto 0) => char_x(5 downto 0),	-- 64 columns
			dinb => X"00", -- not used
			doutb => vram_doutb
		);
		
DBUS(7 downto 0) <= vram_douta when ((RnW and cs_vram) = '1') else "ZZZZZZZZ";
vram_wea <= "" & (not RnW);
vram_web <= "" & '0';

-- SYSTEM ROM (1k words of ROM contains the "helloworld" program) 
-- 0x0XXX (repeats twice)
cs_rom <= VMA when (ABUS(15 downto 12) = X"0") else '0';

bootrom: entity work.rom1k generic map(
		filename => "..\prog\helloworld_code.hex",
		default_value => X"7FFF"	-- HALT
	)	
	port map(
		D => DBUS,
		A => ABUS(9 downto 0),
		CS => cs_rom, 
		OE => RnW
	);

-- SYSTEM RAM (2k words)
-- 0xFXXX (repeats twice)
cs_ram <= VMA when (ABUS(15 downto 12) = X"F") else '0';

ram_lo: entity work.simpleram 
generic map(
	address_size => 11,
	default_value => X"FF"	-- HALT (LSB)
	)	
port map(
	  clk => clkgen_cpu,
	  D => DBUS(7 downto 0), 
	  A => ABUS(10 downto 0),
	  RnW => RnW,
	  CS => cs_ram
);

ram_hi: entity work.simpleram 
generic map(
	address_size => 11,
	default_value => X"7F"	-- HALT (MSB)
	)	
port map(
	  clk => clkgen_cpu,
	  D => DBUS(15 downto 8), 
	  A => ABUS(10 downto 0),
	  RnW => RnW,
	  CS => cs_ram
);
		
-- UART/ACIA (simplified MC6850, connected to lower byte)		
-- 0xEXXX (repeats 1024 times)
cs_acia0 <= VMA when (ABUS(15 downto 12) = X"E") else '0';
		
acia0: entity work.uart Port map (
			reset => Reset,
			clk => clkgen_cpu,
			clk_txd => clkgen_baudrate,	-- 38400
			clk_rxd => clkgen_baudrate4,	-- 115200
			CS => cs_acia0,
			RnW => RnW,
			RS => ABUS(0),
			D => DBUS(7 downto 0),
			debug => open,
			TXD => PMOD_RXD1,
			RXD => PMOD_TXD1
		);

-- LEDs
LED(0) <= continue; --DONE; 
LED(1) <= PMOD_RTS0; --HALT;
	
-- 7segment LED 
led4x7: entity work.fourdigitsevensegled port map ( 
	  -- inputs
	  data => led_data,
	  digsel(1) => freq50Hz,
	  digsel(0) => freq100Hz,
	  showdigit => "1111",
	  showdot(3) => VMA,
	  showdot(2) => PnD,
	  showdot(1) => FETCH,
	  showdot(0) => RnW,
	  showsegments => bus_valid,
	  -- outputs
	  anode => AN,
	  segment(6 downto 0) => A_TO_G(6 downto 0),
	  segment(7) => DOT
	 );
			 
led_data <= ABUS when (btn_ledsel = '1') else DBUS;
--led_data <= perfcnt_value(31 downto 16);-- when (btn_ledsel = '1') else perfcnt_value(15 downto 0);
bus_valid <= VMA or (not RnW);	-- bus signals defined if valid memory address, or register debug output
			 
-- generate debouncers for 4 buttons and 8 for switches to clean input signals
debouncer_generate: for i in 0 to 7 generate
begin
	dbc: if (i < 4) generate
		db_btn: entity work.debouncer port map 
		(
			clock => clkgen_debounce,
			reset => RESET,
			signal_in => BTN(i),
			signal_out => button(i)
		);
	end generate;
	
	db_sw: entity work.debouncer port map 
	(
		clock => clkgen_debounce,
		reset => RESET,
		signal_in => SW(i),
		signal_out => switch(i)
	);
end generate;
		
-- count instructions or operations per 1 second
perfcnt: entity work.freqcounter Port map ( 
		reset => RESET,
      clk => freq1Hz,
      freq => OPCNT(3),
		bcd => '1',
		add(31 downto 4) => X"0000000",
		add(3 downto 0) => in_or_op,
		cin => '0',
		cout => open,
      value => perfcnt_value
	);
	
in_or_op <= X"2" when (btn_ledsel = '0') else OPCNT(2 downto 0) & '0'; -- double both because base period is 0.5s
	
end;
