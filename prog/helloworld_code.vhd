--------------------------------------------------------
-- mcc V1.3.1029 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package helloworld_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 16;
constant CODE_ADDRESS_WIDTH: 	positive := 9;
constant CODE_ADDRESS_LAST: 	positive := 511;


type cpu_code_memory is array(0 to 511) of std_logic_vector(15 downto 0);

signal cpu_uinstruction: std_logic_vector(15 downto 0);

--cpu_uinstruction <= cpu_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.r_p: .valfield 4 values NOP, LDP|JMP|JUMP|GOTO, ADP|BRANCH, P2, P3, P4, P0, M[IMM], BAC|IF_AC|IF_A_GE, BAZ|IF_AZ|IF_A_EQ, BXC|IF_XC|IF_X_GE, BXZ|IF_XZ|IF_X_EQ, BYC|IF_YC|IF_Y_GE, BYZ|IF_YZ|IF_Y_EQ, BSC|IF_SC|IF_S_GE, BSZ|IF_SZ|IF_S_EQ default NOP;
--
alias cpu_r_p: 	std_logic_vector(3 downto 0) is cpu_uinstruction(15 downto 12);
constant r_p_NOP: 	std_logic_vector(3 downto 0) := X"0";
constant r_p_LDP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_JMP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_JUMP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_GOTO: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_ADP: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_BRANCH: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_P2: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_P3: 	std_logic_vector(3 downto 0) := X"4";
constant r_p_P4: 	std_logic_vector(3 downto 0) := X"5";
constant r_p_P0: 	std_logic_vector(3 downto 0) := X"6";
constant r_p_M_IMM: 	std_logic_vector(3 downto 0) := X"7";
constant r_p_BAC: 	std_logic_vector(3 downto 0) := X"8";
constant r_p_IF_AC: 	std_logic_vector(3 downto 0) := X"8";
constant r_p_IF_A_GE: 	std_logic_vector(3 downto 0) := X"8";
constant r_p_BAZ: 	std_logic_vector(3 downto 0) := X"9";
constant r_p_IF_AZ: 	std_logic_vector(3 downto 0) := X"9";
constant r_p_IF_A_EQ: 	std_logic_vector(3 downto 0) := X"9";
constant r_p_BXC: 	std_logic_vector(3 downto 0) := X"A";
constant r_p_IF_XC: 	std_logic_vector(3 downto 0) := X"A";
constant r_p_IF_X_GE: 	std_logic_vector(3 downto 0) := X"A";
constant r_p_BXZ: 	std_logic_vector(3 downto 0) := X"B";
constant r_p_IF_XZ: 	std_logic_vector(3 downto 0) := X"B";
constant r_p_IF_X_EQ: 	std_logic_vector(3 downto 0) := X"B";
constant r_p_BYC: 	std_logic_vector(3 downto 0) := X"C";
constant r_p_IF_YC: 	std_logic_vector(3 downto 0) := X"C";
constant r_p_IF_Y_GE: 	std_logic_vector(3 downto 0) := X"C";
constant r_p_BYZ: 	std_logic_vector(3 downto 0) := X"D";
constant r_p_IF_YZ: 	std_logic_vector(3 downto 0) := X"D";
constant r_p_IF_Y_EQ: 	std_logic_vector(3 downto 0) := X"D";
constant r_p_BSC: 	std_logic_vector(3 downto 0) := X"E";
constant r_p_IF_SC: 	std_logic_vector(3 downto 0) := X"E";
constant r_p_IF_S_GE: 	std_logic_vector(3 downto 0) := X"E";
constant r_p_BSZ: 	std_logic_vector(3 downto 0) := X"F";
constant r_p_IF_SZ: 	std_logic_vector(3 downto 0) := X"F";
constant r_p_IF_S_EQ: 	std_logic_vector(3 downto 0) := X"F";
---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_p select r_p <=
--      NOP when r_p_NOP, -- default value
--      LDP when r_p_LDP,
--      LDP when r_p_JMP,
--      LDP when r_p_JUMP,
--      LDP when r_p_GOTO,
--      ADP when r_p_ADP,
--      ADP when r_p_BRANCH,
--      P2 when r_p_P2,
--      P3 when r_p_P3,
--      P4 when r_p_P4,
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

--
-- L0031.r_a: .valfield 3 values NOA, LDA, XOR, SLC, SRC, ADC, AND, STA|A default NOA;
--
alias cpu_r_a: 	std_logic_vector(2 downto 0) is cpu_uinstruction(11 downto 9);
constant r_a_NOA: 	std_logic_vector(2 downto 0) := O"0";
constant r_a_LDA: 	std_logic_vector(2 downto 0) := O"1";
constant r_a_XOR: 	std_logic_vector(2 downto 0) := O"2";
constant r_a_SLC: 	std_logic_vector(2 downto 0) := O"3";
constant r_a_SRC: 	std_logic_vector(2 downto 0) := O"4";
constant r_a_ADC: 	std_logic_vector(2 downto 0) := O"5";
constant r_a_AND: 	std_logic_vector(2 downto 0) := O"6";
constant r_a_STA: 	std_logic_vector(2 downto 0) := O"7";
constant r_a_A: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_a select r_a <=
--      NOA when r_a_NOA, -- default value
--      LDA when r_a_LDA,
--      XOR when r_a_XOR,
--      SLC when r_a_SLC,
--      SRC when r_a_SRC,
--      ADC when r_a_ADC,
--      AND when r_a_AND,
--      STA when r_a_STA;
--      STA when r_a_A;
---- End boilerplate code

--
-- L0043.r_x: .valfield 3 values NOX, CPX, INX, DEX, LDX, ADX, M[X], STX|X default NOX;
--
alias cpu_r_x: 	std_logic_vector(2 downto 0) is cpu_uinstruction(8 downto 6);
constant r_x_NOX: 	std_logic_vector(2 downto 0) := O"0";
constant r_x_CPX: 	std_logic_vector(2 downto 0) := O"1";
constant r_x_INX: 	std_logic_vector(2 downto 0) := O"2";
constant r_x_DEX: 	std_logic_vector(2 downto 0) := O"3";
constant r_x_LDX: 	std_logic_vector(2 downto 0) := O"4";
constant r_x_ADX: 	std_logic_vector(2 downto 0) := O"5";
constant r_x_M_X: 	std_logic_vector(2 downto 0) := O"6";
constant r_x_STX: 	std_logic_vector(2 downto 0) := O"7";
constant r_x_X: 	std_logic_vector(2 downto 0) := O"7";
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

--
-- L0055.r_y: .valfield 3 values NOY, CPY, INY, DEY, LDY, ADY, M[Y], STY|Y default NOY;
--
alias cpu_r_y: 	std_logic_vector(2 downto 0) is cpu_uinstruction(5 downto 3);
constant r_y_NOY: 	std_logic_vector(2 downto 0) := O"0";
constant r_y_CPY: 	std_logic_vector(2 downto 0) := O"1";
constant r_y_INY: 	std_logic_vector(2 downto 0) := O"2";
constant r_y_DEY: 	std_logic_vector(2 downto 0) := O"3";
constant r_y_LDY: 	std_logic_vector(2 downto 0) := O"4";
constant r_y_ADY: 	std_logic_vector(2 downto 0) := O"5";
constant r_y_M_Y: 	std_logic_vector(2 downto 0) := O"6";
constant r_y_STY: 	std_logic_vector(2 downto 0) := O"7";
constant r_y_Y: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_y select r_y <=
--      NOY when r_y_NOY, -- default value
--      CPY when r_y_CPY,
--      INY when r_y_INY,
--      DEY when r_y_DEY,
--      LDY when r_y_LDY,
--      ADY when r_y_ADY,
--      M[Y] when r_y_M[Y],
--      STY when r_y_STY;
--      STY when r_y_Y;
---- End boilerplate code

--
-- L0066.r_s: .valfield 3 values NOS, CPS, M[POP], M[PUSH], LDS, ADS, M[S], STS|S default NOS;
--
alias cpu_r_s: 	std_logic_vector(2 downto 0) is cpu_uinstruction(2 downto 0);
constant r_s_NOS: 	std_logic_vector(2 downto 0) := O"0";
constant r_s_CPS: 	std_logic_vector(2 downto 0) := O"1";
constant r_s_M_POP: 	std_logic_vector(2 downto 0) := O"2";
constant r_s_M_PUSH: 	std_logic_vector(2 downto 0) := O"3";
constant r_s_LDS: 	std_logic_vector(2 downto 0) := O"4";
constant r_s_ADS: 	std_logic_vector(2 downto 0) := O"5";
constant r_s_M_S: 	std_logic_vector(2 downto 0) := O"6";
constant r_s_STS: 	std_logic_vector(2 downto 0) := O"7";
constant r_s_S: 	std_logic_vector(2 downto 0) := O"7";
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

--
-- L0086.data16: .valfield r_p .. r_s values * default 0;
--
alias cpu_data16: 	std_logic_vector(15 downto 0) is cpu_uinstruction(15 downto 0);
-- Values from X"0000" to X"FFFF" allowed
---- Start boilerplate code (use with utmost caution!)
--  data16 <= cpu_data16;
---- End boilerplate code



constant cpu_microcode: cpu_code_memory := (

-- L0019@0000 0000.  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
0 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0021@0001 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0022@0002 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@0003 005D.  data16 =  @UART_Init - $;
--  data16 = 0000000001011101;
3 => X"005D",

-- L0025@0004 7100.EchoLoop:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0026@0005 FF00.  data16 =  0xFF00;
--  data16 = 1111111100000000;
5 => X"FF00",

-- L0027@0006 7020.ReadStatus:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
6 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0028@0007 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
7 => X"E000",

-- L0029@0008 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
8 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0030@0009 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
9 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0031@000A 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@000B 0003.  data16 =  @ReadChar - $;
--  data16 = 0000000000000011;
11 => X"0003",

-- L0033@000C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
12 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@000D FFF9.  data16 =  @ReadStatus - $;
--  data16 = 1111111111111001;
13 => X"FFF9",

-- L0035@000E 0010.ReadChar:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
14 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0036@000F 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
15 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0037@0010 7C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0111, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
16 => X"7" & O"6" & O"0" & O"0" & O"0",

-- L0038@0011 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
17 => X"00FF",

-- L0039@0012 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
18 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0040@0013 7400.  XOR, M[IMM];
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
19 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0041@0014 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
20 => X"000D",

-- L0042@0015 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
21 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0043@0016 0008.  data16 =  @PrintBuff - $;
--  data16 = 0000000000001000;
22 => X"0008",

-- L0044@0017 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
23 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0045@0018 0F80.  STA, M[X];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 000;
24 => X"0" & O"7" & O"6" & O"0" & O"0",

-- L0046@0019 7280.  INX, LDA, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 010, r_y = 000, r_s = 000;
25 => X"7" & O"1" & O"2" & O"0" & O"0",

-- L0047@001A 0000.  data16 =  0;
--  data16 = 0000000000000000;
26 => X"0000",

-- L0048@001B 0F80.  STA, M[X];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 000;
27 => X"0" & O"7" & O"6" & O"0" & O"0",

-- L0049@001C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
28 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0050@001D FFE9.  data16 =  @ReadStatus - $;
--  data16 = 1111111111101001;
29 => X"FFE9",

-- L0052@001E 0202.PrintBuff:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
30 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0053@001F 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
31 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0054@0020 FF00.  data16 =  0xFF00;
--  data16 = 1111111100000000;
32 => X"FF00",

-- L0055@0021 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
33 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0056@0022 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
34 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0057@0023 0029.  data16 =  @Str2UART - $;
--  data16 = 0000000000101001;
35 => X"0029",

-- L0058@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@0025 FFDF.  data16 =  @EchoLoop - $;
--  data16 = 1111111111011111;
37 => X"FFDF",

-- L0063@0026 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
38 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0064@0027 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
39 => X"0020",

-- L0065@0028 0E03.DeadLoop1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
40 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0066@0029 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
41 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0067@002A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
42 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0068@002B 0113.  data16 =  @VGATest - $;
--  data16 = 0000000100010011;
43 => X"0113",

-- L0069@002C 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
44 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0070@002D 7A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
45 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0071@002E 0001.  data16 =  1;
--  data16 = 0000000000000001;
46 => X"0001",

-- L0072@002F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
47 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0073@0030 FFF8.  data16 =  @DeadLoop1 - $;
--  data16 = 1111111111111000;
48 => X"FFF8",

-- L0077@0031 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
49 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0078@0032 003B.  data16 =  @StrClear;
--  data16 = 0000000000111011;
50 => X"003B",

-- L0079@0033 0000.DeadLoop:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
51 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0080@0034 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
52 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0081@0035 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
53 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0082@0036 0016.  data16 =  @Str2UART - $;
--  data16 = 0000000000010110;
54 => X"0016",

-- L0083@0037 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
55 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0084@0038 003D.  data16 =  @StrHWorld;
--  data16 = 0000000000111101;
56 => X"003D",

-- L0088@0039 2000.  BRANCH,;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
57 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0089@003A FFF9.  data16 =  @DeadLoop - $;
--  data16 = 1111111111111001;
58 => X"FFF9",

-- L0091@003B 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
59 => X"0001",

-- L0092@003C 0000.  data16 =  0;
--  data16 = 0000000000000000;
60 => X"0000",

-- L0094@003D 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
61 => X"0048",

-- L0095@003E 0065.  data16 =  'e';
--  data16 = 0000000001100101;
62 => X"0065",

-- L0096@003F 006C.  data16 =  'l';
--  data16 = 0000000001101100;
63 => X"006C",

-- L0097@0040 006C.  data16 =  'l';
--  data16 = 0000000001101100;
64 => X"006C",

-- L0098@0041 006F.  data16 =  'o';
--  data16 = 0000000001101111;
65 => X"006F",

-- L0099@0042 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
66 => X"0020",

-- L0100@0043 0057.  data16 =  'W';
--  data16 = 0000000001010111;
67 => X"0057",

-- L0101@0044 006F.  data16 =  'o';
--  data16 = 0000000001101111;
68 => X"006F",

-- L0102@0045 0072.  data16 =  'r';
--  data16 = 0000000001110010;
69 => X"0072",

-- L0103@0046 006C.  data16 =  'l';
--  data16 = 0000000001101100;
70 => X"006C",

-- L0104@0047 0064.  data16 =  'd';
--  data16 = 0000000001100100;
71 => X"0064",

-- L0105@0048 0021.  data16 =  '!';
--  data16 = 0000000000100001;
72 => X"0021",

-- L0106@0049 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
73 => X"000D",

-- L0107@004A 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
74 => X"000A",

-- L0108@004B 0000.  data16 =  0;
--  data16 = 0000000000000000;
75 => X"0000",

-- L0112@004C 0000.Str2UART:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0113@004D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
77 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0114@004E 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
78 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0115@004F E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
79 => X"E000",

-- L0116@0050 0380.Str2ULoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
80 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0117@0051 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
81 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0118@0052 000C.  data16 =  @Done - $;
--  data16 = 0000000000001100;
82 => X"000C",

-- L0119@0053 0230.ChkTxdRdy:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
83 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0120@0054 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
84 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0121@0055 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
85 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0122@0056 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
86 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0123@0057 0003.  data16 =  @Str2UOut - $;
--  data16 = 0000000000000011;
87 => X"0003",

-- L0124@0058 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0125@0059 FFFA.  data16 =  @ChkTxdRdy - $;
--  data16 = 1111111111111010;
89 => X"FFFA",

-- L0126@005A 0390.Str2UOut:  INY, LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 010, r_s = 000;
90 => X"0" & O"1" & O"6" & O"2" & O"0",

-- L0127@005B 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
91 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0128@005C 2098.  DEY, INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 011, r_s = 000;
92 => X"2" & O"0" & O"2" & O"3" & O"0",

-- L0129@005D FFF3.  data16 =  @Str2ULoop - $;
--  data16 = 1111111111110011;
93 => X"FFF3",

-- L0130@005E 0022.Done:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
94 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0131@005F 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
95 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0133@0060 7020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
96 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0134@0061 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
97 => X"E000",

-- L0135@0062 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
98 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0136@0063 0003.  data16 =  3;
--  data16 = 0000000000000011;
99 => X"0003",

-- L0137@0064 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
100 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0138@0065 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
101 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0139@0066 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
102 => X"0010",

-- L0140@0067 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
103 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0141@0068 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
104 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0069 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
105 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@006A 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
106 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@006B 0000.  data16 =  0;
--  data16 = 0000000000000000;
107 => X"0000",

-- L0006@006C 0600.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
108 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@006D 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
109 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@006E 1002.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
110 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@006F 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
111 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@0070 FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
112 => X"FFFE",

-- L0013@0071 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
113 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0072 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
114 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@0073 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
115 => X"FFFF",

-- L0016@0074 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0075 FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
117 => X"FFF7",

-- L0021@0076 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
118 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0077 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
119 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0078 0010.  data16 =  16;
--  data16 = 0000000000010000;
120 => X"0010",

-- L0024@0079 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
121 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@007A 0000.  data16 =  0;
--  data16 = 0000000000000000;
122 => X"0000",

-- L0027@007B 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
123 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@007C 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
124 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@007D 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
125 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@007E 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
126 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@007F 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
127 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@0080 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
128 => X"0005",

-- L0033@0081 7A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
129 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@0082 0000.  data16 =  0;
--  data16 = 0000000000000000;
130 => X"0000",

-- L0035@0083 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0084 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
132 => X"0005",

-- L0037@0085 3003.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
133 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0086 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
134 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0087 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
135 => X"FFE2",

-- L0040@0088 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
136 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0089 0800.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
137 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@008A 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
138 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@008B 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
139 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@008C 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
140 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@008D 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
141 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@008E 02C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
142 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@008F B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
143 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@0090 FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
144 => X"FFEB",

-- L0049@0091 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
145 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@0092 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
146 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@0093 0000.Str2VGA:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
147 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0009@0094 003B.  STY, M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
148 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0011@0095 0380.Str2VGALoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
149 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0012@0096 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0013@0097 0085.  data16 =  @Str2VGAExit - $;
--  data16 = 0000000010000101;
151 => X"0085",

-- L0014@0098 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
152 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0099 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
153 => X"000D",

-- L0016@009A 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
154 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@009B 0061.  data16 =  @CarReturn - $;
--  data16 = 0000000001100001;
155 => X"0061",

-- L0019@009C 0380.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
156 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0020@009D 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
157 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@009E 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
158 => X"000A",

-- L0022@009F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@00A0 0063.  data16 =  @LineFeed - $;
--  data16 = 0000000001100011;
160 => X"0063",

-- L0025@00A1 0380.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
161 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0026@00A2 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
162 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@00A3 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
163 => X"0002",

-- L0028@00A4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
164 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@00A5 0073.  data16 =  @Cur2Home - $;
--  data16 = 0000000001110011;
165 => X"0073",

-- L0031@00A6 0380.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
166 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0032@00A7 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
167 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0033@00A8 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
168 => X"0001",

-- L0034@00A9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
169 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0035@00AA 005E.  data16 =  @ClrScreen - $;
--  data16 = 0000000001011110;
170 => X"005E",

-- L0038@00AB 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
171 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@00AC 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
172 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0040@00AD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@00AE 0079.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111001;
174 => X"0079",

-- L0042@00AF 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
175 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@00B0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
176 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@00B1 0080.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000000;
177 => X"0080",

-- L0045@00B2 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
178 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0046@00B3 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
179 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0047@00B4 0040.  data16 =  64;
--  data16 = 0000000001000000;
180 => X"0040",

-- L0048@00B5 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
181 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0049@00B6 0007.  data16 =  @NextRow - $;
--  data16 = 0000000000000111;
182 => X"0007",

-- L0050@00B7 3003.NoScroll:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
183 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0051@00B8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
184 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@00B9 0065.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001100101;
185 => X"0065",

-- L0054@00BA 0102.NextChar:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
186 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@00BB 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
187 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0056@00BC FFD9.  data16 =  @Str2VGALoop - $;
--  data16 = 1111111111011001;
188 => X"FFD9",

-- L0058@00BD 7100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
189 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0059@00BE 0000.  data16 =  0;
--  data16 = 0000000000000000;
190 => X"0000",

-- L0060@00BF 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
191 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@00C0 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
192 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0062@00C1 0020.  data16 =  32;
--  data16 = 0000000000100000;
193 => X"0020",

-- L0063@00C2 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
194 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0064@00C3 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
195 => X"0003",

-- L0065@00C4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
196 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@00C5 FFF2.  data16 =  @NoScroll - $;
--  data16 = 1111111111110010;
197 => X"FFF2",

-- L0068@00C6 0000.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
198 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@00C7 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
199 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@00C8 0000.  data16 =  0;
--  data16 = 0000000000000000;
200 => X"0000",

-- L0071@00C9 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
201 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@00CA 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
202 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0073@00CB 0000.  data16 =  0;
--  data16 = 0000000000000000;
203 => X"0000",

-- L0074@00CC 01C3.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
204 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@00CD 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
205 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0076@00CE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
206 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@00CF 0025.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
207 => X"0025",

-- L0078@00D0 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
208 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0079@00D1 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
209 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0080@00D2 0020.  data16 =  32;
--  data16 = 0000000000100000;
210 => X"0020",

-- L0081@00D3 03B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
211 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0082@00D4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
212 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0083@00D5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
213 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0084@00D6 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
214 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0085@00D7 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
215 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0086@00D8 0040.  data16 =  64;
--  data16 = 0000000001000000;
216 => X"0040",

-- L0087@00D9 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0088@00DA 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
218 => X"0003",

-- L0089@00DB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
219 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00DC 00CC.  data16 =  @NxtCol;
--  data16 = 0000000011001100;
220 => X"00CC",

-- L0091@00DD 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
221 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@00DE 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
222 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@00DF 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
223 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0094@00E0 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
224 => X"001F",

-- L0095@00E1 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
225 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0096@00E2 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
226 => X"0003",

-- L0097@00E3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
227 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@00E4 FFE5.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
228 => X"FFE5",

-- L0100@00E5 3003.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
229 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0101@00E6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00E7 000D.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
231 => X"000D",

-- L0103@00E8 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
232 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0104@00E9 0000.  data16 =  0;
--  data16 = 0000000000000000;
233 => X"0000",

-- L0105@00EA 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
234 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0106@00EB 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
235 => X"0020",

-- L0107@00EC 0FB0.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
236 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00ED 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
237 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00EE 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
238 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00EF 0040.  data16 =  64;
--  data16 = 0000000001000000;
239 => X"0040",

-- L0111@00F0 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
240 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00F1 000A.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
241 => X"000A",

-- L0113@00F2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
242 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@00F3 FFF9.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
243 => X"FFF9",

-- L0117@00F4 7100.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
244 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0118@00F5 0040.  data16 =  64;
--  data16 = 0000000001000000;
245 => X"0040",

-- L0119@00F6 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
246 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0120@00F7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
247 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00F8 FF7E.  data16 =  @MulU - $;
--  data16 = 1111111101111110;
248 => X"FF7E",

-- L0122@00F9 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
249 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0123@00FA 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
250 => X"1000",

-- L0124@00FB 1002.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
251 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0126@00FC 3003.CarReturn:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
252 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0127@00FD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
253 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0128@00FE 0029.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000101001;
254 => X"0029",

-- L0129@00FF 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
255 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0130@0100 0000.  data16 =  0;
--  data16 = 0000000000000000;
256 => X"0000",

-- L0131@0101 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
257 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@0102 FFB5.  data16 =  @NoScroll - $;
--  data16 = 1111111110110101;
258 => X"FFB5",

-- L0134@0103 3003.LineFeed:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
259 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@0104 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
260 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@0105 0022.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100010;
261 => X"0022",

-- L0137@0106 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@0107 FFB8.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111000;
263 => X"FFB8",

-- L0140@0108 7100.ClrScreen:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
264 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0141@0109 0040.  data16 =  64;
--  data16 = 0000000001000000;
265 => X"0040",

-- L0142@010A 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
266 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0143@010B 0020.  data16 =  32;
--  data16 = 0000000000100000;
267 => X"0020",

-- L0144@010C 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
268 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0145@010D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
269 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@010E FF68.  data16 =  @MulU - $;
--  data16 = 1111111101101000;
270 => X"FF68",

-- L0147@010F 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
271 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@0110 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
272 => X"1000",

-- L0149@0111 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
273 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0150@0112 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
274 => X"0020",

-- L0151@0113 0018.ClrPos:  DEY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
275 => X"0" & O"0" & O"0" & O"3" & O"0",

-- L0152@0114 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
276 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0153@0115 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
277 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0154@0116 FFFD.  data16 =  @ClrPos - $;
--  data16 = 1111111111111101;
278 => X"FFFD",

-- L0155@0117 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
279 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0156@0118 7120.Cur2Home:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
280 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0157@0119 0000.  data16 =  0;
--  data16 = 0000000000000000;
281 => X"0000",

-- L0158@011A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
282 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@011B FF9C.  data16 =  @NoScroll - $;
--  data16 = 1111111110011100;
283 => X"FF9C",

-- L0161@011C 0022.Str2VGAExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
284 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0162@011D 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
285 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0164@011E 0E03.SetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
286 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0165@011F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
287 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@0120 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
288 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0167@0121 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
289 => X"FF00",

-- L0168@0122 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
290 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0169@0123 0212.  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
291 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0170@0124 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
292 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0171@0125 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
293 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0172@0126 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
294 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0174@0127 0E03.GetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
295 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0175@0128 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
296 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0176@0129 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
297 => X"FF00",

-- L0177@012A 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
298 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0178@012B 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
299 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0179@012C 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
300 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0180@012D 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
301 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0181@012E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
302 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0182@012F 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
303 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0183@0130 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
304 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0185@0131 01C3.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
305 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0186@0132 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
306 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0187@0133 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
307 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0188@0134 0040.  data16 =  64;
--  data16 = 0000000001000000;
308 => X"0040",

-- L0189@0135 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
309 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0190@0136 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
310 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0137 FF3F.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
311 => X"FF3F",

-- L0192@0138 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
312 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0193@0139 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
313 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0194@013A 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
314 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0195@013B 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
315 => X"1000",

-- L0196@013C 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
316 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0197@013D 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
317 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0199@013E 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
318 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0200@013F 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
319 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0201@0140 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
320 => X"1000",

-- L0202@0141 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
321 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0203@0142 0000.  data16 =  0;
--  data16 = 0000000000000000;
322 => X"0000",

-- L0204@0143 03C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
323 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0205@0144 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
324 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0206@0145 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
325 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0207@0146 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
326 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0208@0147 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
327 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0209@0148 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
328 => X"0800",

-- L0210@0149 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
329 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0211@014A 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
330 => X"0003",

-- L0212@014B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
331 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0213@014C FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
332 => X"FFF7",

-- L0214@014D 0202.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
333 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0215@014E 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
334 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0218@014F 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
335 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0219@0150 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
336 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0220@0151 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
337 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0221@0152 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
338 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0222@0153 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
339 => X"0002",

-- L0223@0154 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
340 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0224@0155 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
341 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0225@0156 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
342 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0226@0157 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
343 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0227@0158 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
344 => X"0002",

-- L0228@0159 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
345 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0229@015A 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
346 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0230@015B 7320.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
347 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0231@015C 0000.  data16 =  0;
--  data16 = 0000000000000000;
348 => X"0000",

-- L0232@015D 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
349 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0233@015E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
350 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0234@015F 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
351 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0235@0160 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
352 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0236@0161 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
353 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 158 location(s) in following ranges will be filled with default value
-- 0162 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

