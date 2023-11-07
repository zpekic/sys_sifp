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
-- L0011.r_p: .valfield 4 values NOP, LDP, BRANCH|IF_TRUE, JUMP|GOTO, P4, P2, P0, M[IMM], BAC|IF_AC|IF_A_GE, BAZ|IF_AZ|IF_A_EQ, BXC|IF_XC|IF_X_GE, BXZ|IF_XZ|IF_X_EQ, BYC|IF_YC|IF_Y_GE, BYZ|IF_YZ|IF_Y_EQ, BSC|IF_SC|IF_S_GE, BSZ|IF_SZ|IF_S_EQ default NOP;
--
alias cpu_r_p: 	std_logic_vector(3 downto 0) is cpu_uinstruction(15 downto 12);
constant r_p_NOP: 	std_logic_vector(3 downto 0) := X"0";
constant r_p_LDP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_BRANCH: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_IF_TRUE: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_JUMP: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_GOTO: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_P4: 	std_logic_vector(3 downto 0) := X"4";
constant r_p_P2: 	std_logic_vector(3 downto 0) := X"5";
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

-- L0021@0001 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0022@0002 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@0003 004B.  data16 =  @UART_Init - $;
--  data16 = 0000000001001011;
3 => X"004B",

-- L0031@0004 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0032@0005 0003.  data16 =  3;
--  data16 = 0000000000000011;
5 => X"0003",

-- L0033@0006 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
6 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0034@0007 0007.  data16 =  7;
--  data16 = 0000000000000111;
7 => X"0007",

-- L0035@0008 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
8 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0036@0009 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
9 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@000A 00DD.  data16 =  @SetCursorXY - $;
--  data16 = 0000000011011101;
10 => X"00DD",

-- L0039@000B 5003.EchoLoop:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
11 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0040@000C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
12 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@000D 0009.  data16 =  @UART_GetChr - $;
--  data16 = 0000000000001001;
13 => X"0009",

-- L0042@000E 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
14 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0043@000F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
15 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@0010 0015.  data16 =  @UART_OutChr - $;
--  data16 = 0000000000010101;
16 => X"0015",

-- L0045@0011 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
17 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0046@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0047@0013 006E.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000001101110;
19 => X"006E",

-- L0048@0014 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
20 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0049@0015 000B.  data16 =  @EchoLoop;
--  data16 = 0000000000001011;
21 => X"000B",

-- L0051@0016 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
22 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0052@0017 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
23 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0053@0018 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
24 => X"E000",

-- L0054@0019 0230.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
25 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0055@001A 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
26 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0056@001B 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
27 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0057@001C 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
28 => X"0003",

-- L0058@001D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@001E FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
30 => X"FFFB",

-- L0060@001F 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
31 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@0020 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
32 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0062@0021 7C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0111, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
33 => X"7" & O"6" & O"0" & O"0" & O"0",

-- L0063@0022 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
34 => X"00FF",

-- L0064@0023 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
35 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0065@0024 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
36 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0067@0025 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
37 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0068@0026 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
38 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0069@0027 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
39 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@0028 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
40 => X"E000",

-- L0071@0029 0230.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
41 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0072@002A 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
42 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0073@002B 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
43 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0074@002C 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0075@002D 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
45 => X"0003",

-- L0076@002E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
46 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@002F FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
47 => X"FFFA",

-- L0078@0030 0212.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
48 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0079@0031 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0080@0032 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0081@0033 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
51 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0083@0034 0380.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
52 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0084@0035 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
53 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0085@0036 0006.  data16 =  @Done - $;
--  data16 = 0000000000000110;
54 => X"0006",

-- L0086@0037 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0087@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0088@0039 FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
57 => X"FFEC",

-- L0089@003A 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
58 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0090@003B FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
59 => X"FFF9",

-- L0091@003C 1002.Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
60 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0093@003D 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
61 => X"0001",

-- L0094@003E 0000.  data16 =  0;
--  data16 = 0000000000000000;
62 => X"0000",

-- L0096@003F 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
63 => X"0048",

-- L0097@0040 0065.  data16 =  'e';
--  data16 = 0000000001100101;
64 => X"0065",

-- L0098@0041 006C.  data16 =  'l';
--  data16 = 0000000001101100;
65 => X"006C",

-- L0099@0042 006C.  data16 =  'l';
--  data16 = 0000000001101100;
66 => X"006C",

-- L0100@0043 006F.  data16 =  'o';
--  data16 = 0000000001101111;
67 => X"006F",

-- L0101@0044 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
68 => X"0020",

-- L0102@0045 0057.  data16 =  'W';
--  data16 = 0000000001010111;
69 => X"0057",

-- L0103@0046 006F.  data16 =  'o';
--  data16 = 0000000001101111;
70 => X"006F",

-- L0104@0047 0072.  data16 =  'r';
--  data16 = 0000000001110010;
71 => X"0072",

-- L0105@0048 006C.  data16 =  'l';
--  data16 = 0000000001101100;
72 => X"006C",

-- L0106@0049 0064.  data16 =  'd';
--  data16 = 0000000001100100;
73 => X"0064",

-- L0107@004A 0021.  data16 =  '!';
--  data16 = 0000000000100001;
74 => X"0021",

-- L0108@004B 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
75 => X"000D",

-- L0109@004C 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
76 => X"000A",

-- L0110@004D 0000.  data16 =  0;
--  data16 = 0000000000000000;
77 => X"0000",

-- L0113@004E 7020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
78 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0114@004F E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
79 => X"E000",

-- L0115@0050 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
80 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0116@0051 0003.  data16 =  3;
--  data16 = 0000000000000011;
81 => X"0003",

-- L0117@0052 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
82 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0118@0053 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
83 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0119@0054 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
84 => X"0010",

-- L0120@0055 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
85 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0121@0056 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
86 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0057 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
87 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0058 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
88 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0059 0000.  data16 =  0;
--  data16 = 0000000000000000;
89 => X"0000",

-- L0006@005A 0600.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
90 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@005B 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
91 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@005C 1002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
92 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@005D 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
93 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@005E FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
94 => X"FFFE",

-- L0013@005F 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
95 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0060 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
96 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@0061 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
97 => X"FFFF",

-- L0016@0062 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
98 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0063 FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
99 => X"FFF7",

-- L0021@0064 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
100 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0065 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
101 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0066 0010.  data16 =  16;
--  data16 = 0000000000010000;
102 => X"0010",

-- L0024@0067 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
103 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0068 0000.  data16 =  0;
--  data16 = 0000000000000000;
104 => X"0000",

-- L0027@0069 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
105 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@006A 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
106 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@006B 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
107 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@006C 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
108 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@006D 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
109 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@006E 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
110 => X"0005",

-- L0033@006F 7A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
111 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@0070 0000.  data16 =  0;
--  data16 = 0000000000000000;
112 => X"0000",

-- L0035@0071 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
113 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0072 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
114 => X"0005",

-- L0037@0073 5003.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
115 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0038@0074 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0075 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
117 => X"FFE2",

-- L0040@0076 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
118 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0077 0800.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
119 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0078 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
120 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0079 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
121 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@007A 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
122 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@007B 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
123 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@007C 02C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
124 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@007D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
125 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@007E FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
126 => X"FFEB",

-- L0049@007F 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
127 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@0080 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
128 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0007@0081 0E03.VGA_OutChr:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
129 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0008@0082 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
130 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0009@0083 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
131 => X"000D",

-- L0010@0084 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
132 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0011@0085 005C.  data16 =  @VGA_CR - $;
--  data16 = 0000000001011100;
133 => X"005C",

-- L0013@0086 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
134 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0014@0087 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
135 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0088 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
136 => X"000A",

-- L0016@0089 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
137 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@008A 0066.  data16 =  @VGA_LF - $;
--  data16 = 0000000001100110;
138 => X"0066",

-- L0019@008B 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
139 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0020@008C 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
140 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@008D 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
141 => X"0002",

-- L0022@008E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@008F 0081.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010000001;
143 => X"0081",

-- L0025@0090 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
144 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0026@0091 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
145 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@0092 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
146 => X"0001",

-- L0028@0093 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
147 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@0094 0062.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001100010;
148 => X"0062",

-- L0032@0095 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
149 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0033@0096 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@0097 007D.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111101;
151 => X"007D",

-- L0035@0098 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
152 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0036@0099 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
153 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@009A 0083.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000011;
154 => X"0083",

-- L0038@009B 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
155 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0039@009C 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
156 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0040@009D 0040.  data16 =  64;
--  data16 = 0000000001000000;
157 => X"0040",

-- L0041@009E A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0042@009F 0003.  data16 =  @NextRow - $;
--  data16 = 0000000000000011;
159 => X"0003",

-- L0043@00A0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
160 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@00A1 0046.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001000110;
161 => X"0046",

-- L0046@00A2 7100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
162 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0047@00A3 0000.  data16 =  0;
--  data16 = 0000000000000000;
163 => X"0000",

-- L0048@00A4 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
164 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0049@00A5 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
165 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0050@00A6 0020.  data16 =  32;
--  data16 = 0000000000100000;
166 => X"0020",

-- L0051@00A7 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
167 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0052@00A8 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
168 => X"0003",

-- L0053@00A9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
169 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0054@00AA 003D.  data16 =  @SetCursorXY - $;
--  data16 = 0000000000111101;
170 => X"003D",

-- L0056@00AB 0000.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
171 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0057@00AC 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
172 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0058@00AD 0000.  data16 =  0;
--  data16 = 0000000000000000;
173 => X"0000",

-- L0059@00AE 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
174 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@00AF 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
175 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0061@00B0 0000.  data16 =  0;
--  data16 = 0000000000000000;
176 => X"0000",

-- L0062@00B1 01C3.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
177 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0063@00B2 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
178 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0064@00B3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
179 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0065@00B4 0025.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
180 => X"0025",

-- L0066@00B5 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
181 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0067@00B6 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
182 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0068@00B7 0020.  data16 =  32;
--  data16 = 0000000000100000;
183 => X"0020",

-- L0069@00B8 03B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
184 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0070@00B9 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
185 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0071@00BA 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
186 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0072@00BB 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
187 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0073@00BC 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
188 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0074@00BD 0040.  data16 =  64;
--  data16 = 0000000001000000;
189 => X"0040",

-- L0075@00BE A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0076@00BF 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
191 => X"0003",

-- L0077@00C0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
192 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0078@00C1 00B1.  data16 =  @NxtCol;
--  data16 = 0000000010110001;
193 => X"00B1",

-- L0079@00C2 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
194 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0080@00C3 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
195 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0081@00C4 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
196 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0082@00C5 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
197 => X"001F",

-- L0083@00C6 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
198 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0084@00C7 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
199 => X"0003",

-- L0085@00C8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
200 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0086@00C9 FFE5.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
201 => X"FFE5",

-- L0088@00CA 5003.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
202 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0089@00CB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
203 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00CC 000D.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
204 => X"000D",

-- L0091@00CD 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
205 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0092@00CE 0000.  data16 =  0;
--  data16 = 0000000000000000;
206 => X"0000",

-- L0093@00CF 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
207 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0094@00D0 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
208 => X"0020",

-- L0095@00D1 0FB0.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
209 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0096@00D2 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
210 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0097@00D3 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
211 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0098@00D4 0040.  data16 =  64;
--  data16 = 0000000001000000;
212 => X"0040",

-- L0099@00D5 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
213 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0100@00D6 000A.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
214 => X"000A",

-- L0101@00D7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
215 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00D8 FFF9.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
216 => X"FFF9",

-- L0105@00D9 7100.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
217 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0106@00DA 0040.  data16 =  64;
--  data16 = 0000000001000000;
218 => X"0040",

-- L0107@00DB 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
219 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0108@00DC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0109@00DD FF87.  data16 =  @MulU - $;
--  data16 = 1111111110000111;
221 => X"FF87",

-- L0110@00DE 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
222 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0111@00DF 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
223 => X"1000",

-- L0112@00E0 1002.ScrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
224 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0114@00E1 0202.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
225 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0115@00E2 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
226 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0116@00E3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
227 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0117@00E4 0030.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000110000;
228 => X"0030",

-- L0118@00E5 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
229 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0119@00E6 0000.  data16 =  0;
--  data16 = 0000000000000000;
230 => X"0000",

-- L0120@00E7 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
231 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0121@00E8 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
232 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0122@00E9 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
233 => X"FF00",

-- L0123@00EA 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
234 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0124@00EB 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
235 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0125@00EC FF01.  data16 =  0xFF00 + 1;
--  data16 = 1111111100000001;
236 => X"FF01",

-- L0126@00ED 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
237 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0127@00EE 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
238 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0128@00EF 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
239 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0131@00F0 0202.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
240 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0132@00F1 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
241 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0133@00F2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
242 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0134@00F3 0021.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100001;
243 => X"0021",

-- L0135@00F4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
244 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@00F5 FFAF.  data16 =  @NextRow1 - $;
--  data16 = 1111111110101111;
245 => X"FFAF",

-- L0138@00F6 0202.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
246 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0139@00F7 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
247 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0140@00F8 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
248 => X"0020",

-- L0141@00F9 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
249 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0142@00FA 0000.  data16 =  0;
--  data16 = 0000000000000000;
250 => X"0000",

-- L0143@00FB 003B.RowLoop:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
251 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0144@00FC 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
252 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0145@00FD 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
253 => X"1000",

-- L0146@00FE 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
254 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0147@00FF 0000.  data16 =  0;
--  data16 = 0000000000000000;
255 => X"0000",

-- L0148@0100 0FB0.ColLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
256 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0149@0101 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
257 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0150@0102 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
258 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0151@0103 0040.  data16 =  64;
--  data16 = 0000000001000000;
259 => X"0040",

-- L0152@0104 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
260 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0153@0105 0003.  data16 =  @NxtRow0 - $;
--  data16 = 0000000000000011;
261 => X"0003",

-- L0154@0106 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0155@0107 FFF9.  data16 =  @ColLoop - $;
--  data16 = 1111111111111001;
263 => X"FFF9",

-- L0156@0108 0022.NxtRow0:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
264 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0157@0109 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
265 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0158@010A 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
266 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0159@010B 0020.  data16 =  32;
--  data16 = 0000000000100000;
267 => X"0020",

-- L0160@010C C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0161@010D 0003.  data16 =  @VGA_HOME - $;
--  data16 = 0000000000000011;
269 => X"0003",

-- L0162@010E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
270 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0163@010F FFEC.  data16 =  @RowLoop - $;
--  data16 = 1111111111101100;
271 => X"FFEC",

-- L0164@0110 7120.VGA_HOME:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
272 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0165@0111 0000.  data16 =  0;
--  data16 = 0000000000000000;
273 => X"0000",

-- L0166@0112 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
274 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0167@0113 FFD4.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111010100;
275 => X"FFD4",

-- L0170@0114 7020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
276 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0171@0115 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
277 => X"FF00",

-- L0172@0116 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
278 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0173@0117 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
279 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0174@0118 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
280 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0175@0119 FF01.  data16 =  0xFF00 + 1;
--  data16 = 1111111100000001;
281 => X"FF01",

-- L0176@011A 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
282 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0177@011B 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
283 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0178@011C 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
284 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0180@011D 01C3.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
285 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0181@011E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
286 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0182@011F 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
287 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0183@0120 0040.  data16 =  64;
--  data16 = 0000000001000000;
288 => X"0040",

-- L0184@0121 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
289 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0185@0122 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0186@0123 FF41.  data16 =  @MulU - $;
--  data16 = 1111111101000001;
291 => X"FF41",

-- L0187@0124 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
292 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0188@0125 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
293 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0189@0126 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
294 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0190@0127 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
295 => X"1000",

-- L0191@0128 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
296 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0192@0129 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
297 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0194@012A 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
298 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0195@012B 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
299 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0196@012C 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
300 => X"1000",

-- L0197@012D 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
301 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0198@012E 0000.  data16 =  0;
--  data16 = 0000000000000000;
302 => X"0000",

-- L0199@012F 03C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
303 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0200@0130 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
304 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0201@0131 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
305 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0202@0132 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
306 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0203@0133 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
307 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0204@0134 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
308 => X"0800",

-- L0205@0135 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
309 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0206@0136 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
310 => X"0003",

-- L0207@0137 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
311 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0208@0138 FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
312 => X"FFF7",

-- L0209@0139 0202.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
313 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0210@013A 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
314 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0213@013B 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
315 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0214@013C 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
316 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0215@013D 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
317 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0216@013E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0217@013F 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
319 => X"0002",

-- L0218@0140 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
320 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0219@0141 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
321 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0220@0142 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
322 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0221@0143 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
323 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0222@0144 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
324 => X"0002",

-- L0223@0145 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
325 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0224@0146 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
326 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0225@0147 7320.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
327 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0226@0148 0000.  data16 =  0;
--  data16 = 0000000000000000;
328 => X"0000",

-- L0227@0149 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
329 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0228@014A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
330 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0229@014B 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
331 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0230@014C 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
332 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0231@014D 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
333 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 178 location(s) in following ranges will be filled with default value
-- 014E .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

