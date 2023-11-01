--------------------------------------------------------
-- mcc V1.3.1030 - Custom microcode compiler (c)2020-... 
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
-- L0067.r_s: .valfield 3 values NOS, CPS, M[POP], M[PUSH], LDS, ADS, M[S], STS|S default NOS;
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
-- L0087.data16: .valfield r_p .. r_s values * default 0;
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

-- L0023@0003 0049.  data16 =  @UART_Init - $;
--  data16 = 0000000001001001;
3 => X"0049",

-- L0025@0004 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0026@0005 003D.  data16 =  @StrHWorld;
--  data16 = 0000000000111101;
5 => X"003D",

-- L0027@0006 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
6 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0028@0007 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
7 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@0008 002A.  data16 =  @UART_OutStr - $;
--  data16 = 0000000000101010;
8 => X"002A",

-- L0031@0009 3003.EchoLoop:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
9 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0032@000A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@000B 0009.  data16 =  @UART_GetChr - $;
--  data16 = 0000000000001001;
11 => X"0009",

-- L0034@000C 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
12 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0035@000D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@000E 0015.  data16 =  @UART_OutChr - $;
--  data16 = 0000000000010101;
14 => X"0015",

-- L0037@000F 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
15 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0010 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
16 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0011 006E.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000001101110;
17 => X"006E",

-- L0040@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@0013 FFF6.  data16 =  @EchoLoop - $;
--  data16 = 1111111111110110;
19 => X"FFF6",

-- L0043@0014 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
20 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0044@0015 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
21 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0045@0016 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
22 => X"E000",

-- L0046@0017 0230.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
23 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0047@0018 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
24 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0048@0019 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0049@001A 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
26 => X"0003",

-- L0050@001B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
27 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@001C FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
28 => X"FFFB",

-- L0052@001D 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
29 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0053@001E 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
30 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0054@001F 7C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0111, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
31 => X"7" & O"6" & O"0" & O"0" & O"0",

-- L0055@0020 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
32 => X"00FF",

-- L0056@0021 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
33 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0057@0022 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
34 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0059@0023 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
35 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@0024 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
36 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0061@0025 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
37 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0062@0026 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
38 => X"E000",

-- L0063@0027 0230.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
39 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0064@0028 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
40 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0065@0029 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
41 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0066@002A 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
42 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0067@002B 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
43 => X"0003",

-- L0068@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0069@002D FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
45 => X"FFFA",

-- L0070@002E 0212.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
46 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0071@002F 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
47 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0072@0030 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
48 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0073@0031 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
49 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0075@0032 0380.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
50 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0076@0033 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
51 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0077@0034 0006.  data16 =  @Done - $;
--  data16 = 0000000000000110;
52 => X"0006",

-- L0078@0035 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
53 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0079@0036 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
54 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0080@0037 FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
55 => X"FFEC",

-- L0081@0038 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0082@0039 FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
57 => X"FFF9",

-- L0083@003A 1002.Done:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
58 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0085@003B 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
59 => X"0001",

-- L0086@003C 0000.  data16 =  0;
--  data16 = 0000000000000000;
60 => X"0000",

-- L0088@003D 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
61 => X"0048",

-- L0089@003E 0065.  data16 =  'e';
--  data16 = 0000000001100101;
62 => X"0065",

-- L0090@003F 006C.  data16 =  'l';
--  data16 = 0000000001101100;
63 => X"006C",

-- L0091@0040 006C.  data16 =  'l';
--  data16 = 0000000001101100;
64 => X"006C",

-- L0092@0041 006F.  data16 =  'o';
--  data16 = 0000000001101111;
65 => X"006F",

-- L0093@0042 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
66 => X"0020",

-- L0094@0043 0057.  data16 =  'W';
--  data16 = 0000000001010111;
67 => X"0057",

-- L0095@0044 006F.  data16 =  'o';
--  data16 = 0000000001101111;
68 => X"006F",

-- L0096@0045 0072.  data16 =  'r';
--  data16 = 0000000001110010;
69 => X"0072",

-- L0097@0046 006C.  data16 =  'l';
--  data16 = 0000000001101100;
70 => X"006C",

-- L0098@0047 0064.  data16 =  'd';
--  data16 = 0000000001100100;
71 => X"0064",

-- L0099@0048 0021.  data16 =  '!';
--  data16 = 0000000000100001;
72 => X"0021",

-- L0100@0049 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
73 => X"000D",

-- L0101@004A 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
74 => X"000A",

-- L0102@004B 0000.  data16 =  0;
--  data16 = 0000000000000000;
75 => X"0000",

-- L0105@004C 7020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
76 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0106@004D E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
77 => X"E000",

-- L0107@004E 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
78 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0108@004F 0003.  data16 =  3;
--  data16 = 0000000000000011;
79 => X"0003",

-- L0109@0050 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
80 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0110@0051 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
81 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0111@0052 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
82 => X"0010",

-- L0112@0053 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
83 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0113@0054 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
84 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0055 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
85 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0056 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
86 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0057 0000.  data16 =  0;
--  data16 = 0000000000000000;
87 => X"0000",

-- L0006@0058 0600.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
88 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@0059 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
89 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@005A 1002.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
90 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@005B 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@005C FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
92 => X"FFFE",

-- L0013@005D 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
93 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@005E 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
94 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@005F FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
95 => X"FFFF",

-- L0016@0060 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
96 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0061 FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
97 => X"FFF7",

-- L0021@0062 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
98 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0063 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
99 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0064 0010.  data16 =  16;
--  data16 = 0000000000010000;
100 => X"0010",

-- L0024@0065 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
101 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0066 0000.  data16 =  0;
--  data16 = 0000000000000000;
102 => X"0000",

-- L0027@0067 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
103 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0068 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
104 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@0069 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
105 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@006A 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
106 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@006B 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
107 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@006C 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
108 => X"0005",

-- L0033@006D 7A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
109 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@006E 0000.  data16 =  0;
--  data16 = 0000000000000000;
110 => X"0000",

-- L0035@006F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
111 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0070 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
112 => X"0005",

-- L0037@0071 3003.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
113 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0072 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
114 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0073 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
115 => X"FFE2",

-- L0040@0074 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
116 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0075 0800.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
117 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0076 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
118 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0077 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
119 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@0078 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
120 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@0079 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
121 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@007A 02C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
122 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@007B B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
123 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@007C FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
124 => X"FFEB",

-- L0049@007D 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
125 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@007E 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
126 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0007@007F 0E03.VGA_OutChr:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
127 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0008@0080 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
128 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0009@0081 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
129 => X"000D",

-- L0010@0082 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
130 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0011@0083 005C.  data16 =  @VGA_CR - $;
--  data16 = 0000000001011100;
131 => X"005C",

-- L0013@0084 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
132 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0014@0085 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
133 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0086 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
134 => X"000A",

-- L0016@0087 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
135 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@0088 0068.  data16 =  @VGA_LF - $;
--  data16 = 0000000001101000;
136 => X"0068",

-- L0019@0089 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
137 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0020@008A 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
138 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@008B 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
139 => X"0002",

-- L0022@008C 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
140 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@008D 0083.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010000011;
141 => X"0083",

-- L0025@008E 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
142 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0026@008F 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
143 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@0090 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
144 => X"0001",

-- L0028@0091 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
145 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@0092 0064.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001100100;
146 => X"0064",

-- L0032@0093 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
147 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0033@0094 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@0095 007F.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111111;
149 => X"007F",

-- L0035@0096 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
150 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0036@0097 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
151 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@0098 0085.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000101;
152 => X"0085",

-- L0038@0099 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
153 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0039@009A 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
154 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0040@009B 0040.  data16 =  64;
--  data16 = 0000000001000000;
155 => X"0040",

-- L0041@009C A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0042@009D 0003.  data16 =  @NextRow - $;
--  data16 = 0000000000000011;
157 => X"0003",

-- L0043@009E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@009F 0046.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001000110;
159 => X"0046",

-- L0046@00A0 7100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
160 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0047@00A1 0000.  data16 =  0;
--  data16 = 0000000000000000;
161 => X"0000",

-- L0048@00A2 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
162 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0049@00A3 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
163 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0050@00A4 0020.  data16 =  32;
--  data16 = 0000000000100000;
164 => X"0020",

-- L0051@00A5 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
165 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0052@00A6 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
166 => X"0003",

-- L0053@00A7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
167 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0054@00A8 003D.  data16 =  @SetCursorXY - $;
--  data16 = 0000000000111101;
168 => X"003D",

-- L0056@00A9 0000.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
169 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0057@00AA 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
170 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0058@00AB 0000.  data16 =  0;
--  data16 = 0000000000000000;
171 => X"0000",

-- L0059@00AC 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
172 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@00AD 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
173 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0061@00AE 0000.  data16 =  0;
--  data16 = 0000000000000000;
174 => X"0000",

-- L0062@00AF 01C3.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
175 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0063@00B0 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
176 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0064@00B1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
177 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0065@00B2 0025.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
178 => X"0025",

-- L0066@00B3 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
179 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0067@00B4 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
180 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0068@00B5 0020.  data16 =  32;
--  data16 = 0000000000100000;
181 => X"0020",

-- L0069@00B6 03B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
182 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0070@00B7 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
183 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0071@00B8 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
184 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0072@00B9 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
185 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0073@00BA 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
186 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0074@00BB 0040.  data16 =  64;
--  data16 = 0000000001000000;
187 => X"0040",

-- L0075@00BC A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0076@00BD 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
189 => X"0003",

-- L0077@00BE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0078@00BF 00AF.  data16 =  @NxtCol;
--  data16 = 0000000010101111;
191 => X"00AF",

-- L0079@00C0 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
192 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0080@00C1 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
193 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0081@00C2 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
194 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0082@00C3 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
195 => X"001F",

-- L0083@00C4 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
196 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0084@00C5 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
197 => X"0003",

-- L0085@00C6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
198 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0086@00C7 FFE5.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
199 => X"FFE5",

-- L0088@00C8 3003.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
200 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0089@00C9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
201 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00CA 000D.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
202 => X"000D",

-- L0091@00CB 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
203 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0092@00CC 0000.  data16 =  0;
--  data16 = 0000000000000000;
204 => X"0000",

-- L0093@00CD 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
205 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0094@00CE 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
206 => X"0020",

-- L0095@00CF 0FB0.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
207 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0096@00D0 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
208 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0097@00D1 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
209 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0098@00D2 0040.  data16 =  64;
--  data16 = 0000000001000000;
210 => X"0040",

-- L0099@00D3 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
211 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0100@00D4 000A.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
212 => X"000A",

-- L0101@00D5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
213 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00D6 FFF9.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
214 => X"FFF9",

-- L0105@00D7 7100.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
215 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0106@00D8 0040.  data16 =  64;
--  data16 = 0000000001000000;
216 => X"0040",

-- L0107@00D9 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
217 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0108@00DA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
218 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0109@00DB FF87.  data16 =  @MulU - $;
--  data16 = 1111111110000111;
219 => X"FF87",

-- L0110@00DC 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
220 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0111@00DD 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
221 => X"1000",

-- L0112@00DE 1002.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
222 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0114@00DF 0202.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
223 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0115@00E0 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
224 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0116@00E1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
225 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0117@00E2 0032.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000110010;
226 => X"0032",

-- L0118@00E3 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
227 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0119@00E4 0000.  data16 =  0;
--  data16 = 0000000000000000;
228 => X"0000",

-- L0120@00E5 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
229 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0121@00E6 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
230 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0122@00E7 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
231 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0123@00E8 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
232 => X"FF00",

-- L0124@00E9 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
233 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0125@00EA 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
234 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0126@00EB FF01.  data16 =  0xFF00 + 1;
--  data16 = 1111111100000001;
235 => X"FF01",

-- L0127@00EC 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
236 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0128@00ED 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
237 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0129@00EE 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
238 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0130@00EF 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
239 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0133@00F0 0202.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
240 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0134@00F1 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
241 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@00F2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
242 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@00F3 0021.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100001;
243 => X"0021",

-- L0137@00F4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
244 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00F5 FFAD.  data16 =  @NextRow1 - $;
--  data16 = 1111111110101101;
245 => X"FFAD",

-- L0140@00F6 0202.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
246 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0141@00F7 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
247 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0142@00F8 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
248 => X"0020",

-- L0143@00F9 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
249 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0144@00FA 0000.  data16 =  0;
--  data16 = 0000000000000000;
250 => X"0000",

-- L0145@00FB 003B.RowLoop:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
251 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0146@00FC 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
252 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0147@00FD 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
253 => X"1000",

-- L0148@00FE 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
254 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0149@00FF 0000.  data16 =  0;
--  data16 = 0000000000000000;
255 => X"0000",

-- L0150@0100 0FB0.ColLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
256 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0151@0101 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
257 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0152@0102 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
258 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0153@0103 0040.  data16 =  64;
--  data16 = 0000000001000000;
259 => X"0040",

-- L0154@0104 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
260 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0155@0105 0003.  data16 =  @NxtRow0 - $;
--  data16 = 0000000000000011;
261 => X"0003",

-- L0156@0106 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0157@0107 FFF9.  data16 =  @ColLoop - $;
--  data16 = 1111111111111001;
263 => X"FFF9",

-- L0158@0108 0022.NxtRow0:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
264 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0159@0109 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
265 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0160@010A 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
266 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0161@010B 0020.  data16 =  32;
--  data16 = 0000000000100000;
267 => X"0020",

-- L0162@010C C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0163@010D 0003.  data16 =  @VGA_HOME - $;
--  data16 = 0000000000000011;
269 => X"0003",

-- L0164@010E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
270 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@010F FFEC.  data16 =  @RowLoop - $;
--  data16 = 1111111111101100;
271 => X"FFEC",

-- L0166@0110 7120.VGA_HOME:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
272 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0167@0111 0000.  data16 =  0;
--  data16 = 0000000000000000;
273 => X"0000",

-- L0168@0112 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
274 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0169@0113 FFD2.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111010010;
275 => X"FFD2",

-- L0172@0114 7020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
276 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0173@0115 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
277 => X"FF00",

-- L0174@0116 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
278 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0175@0117 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
279 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0176@0118 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
280 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0177@0119 FF01.  data16 =  0xFF00 + 1;
--  data16 = 1111111100000001;
281 => X"FF01",

-- L0178@011A 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
282 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0179@011B 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
283 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0180@011C 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
284 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0182@011D 01C3.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
285 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0183@011E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
286 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0184@011F 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
287 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0185@0120 0040.  data16 =  64;
--  data16 = 0000000001000000;
288 => X"0040",

-- L0186@0121 3003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
289 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0187@0122 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0188@0123 FF3F.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
291 => X"FF3F",

-- L0189@0124 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
292 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0190@0125 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
293 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0191@0126 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
294 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0192@0127 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
295 => X"1000",

-- L0193@0128 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
296 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0194@0129 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
297 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0196@012A 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
298 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0197@012B 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
299 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0198@012C 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
300 => X"1000",

-- L0199@012D 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
301 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0200@012E 0000.  data16 =  0;
--  data16 = 0000000000000000;
302 => X"0000",

-- L0201@012F 03C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
303 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0202@0130 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
304 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0203@0131 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
305 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0204@0132 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
306 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0205@0133 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
307 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0206@0134 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
308 => X"0800",

-- L0207@0135 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
309 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0208@0136 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
310 => X"0003",

-- L0209@0137 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
311 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0210@0138 FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
312 => X"FFF7",

-- L0211@0139 0202.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
313 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0212@013A 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
314 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0215@013B 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
315 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0216@013C 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
316 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0217@013D 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
317 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0218@013E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0219@013F 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
319 => X"0002",

-- L0220@0140 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
320 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0221@0141 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
321 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0222@0142 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
322 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0223@0143 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
323 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0224@0144 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
324 => X"0002",

-- L0225@0145 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
325 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0226@0146 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
326 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0227@0147 7320.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
327 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0228@0148 0000.  data16 =  0;
--  data16 = 0000000000000000;
328 => X"0000",

-- L0229@0149 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
329 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0230@014A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
330 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0231@014B 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
331 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0232@014C 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
332 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0233@014D 1002.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
333 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 178 location(s) in following ranges will be filled with default value
-- 014E .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

