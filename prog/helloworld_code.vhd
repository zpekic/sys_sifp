--------------------------------------------------------
-- mcc V1.3.1017 - Custom microcode compiler (c)2020-... 
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
-- L0031.r_a: .valfield 3 values NOA, LDA, XOR, SLC, SRC, ADC, SBC, STA|A default NOA;
--
alias cpu_r_a: 	std_logic_vector(2 downto 0) is cpu_uinstruction(11 downto 9);
constant r_a_NOA: 	std_logic_vector(2 downto 0) := O"0";
constant r_a_LDA: 	std_logic_vector(2 downto 0) := O"1";
constant r_a_XOR: 	std_logic_vector(2 downto 0) := O"2";
constant r_a_SLC: 	std_logic_vector(2 downto 0) := O"3";
constant r_a_SRC: 	std_logic_vector(2 downto 0) := O"4";
constant r_a_ADC: 	std_logic_vector(2 downto 0) := O"5";
constant r_a_SBC: 	std_logic_vector(2 downto 0) := O"6";
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
--      SBC when r_a_SBC,
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

-- L0019@0000.  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
0 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0022@0001.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0023@0002.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
2 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0024@0003.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
3 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0025@0004.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
4 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0026@0005.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
5 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0027@0006.  data16 =  0;
--  data16 = 0000000000000000;
6 => X"0000",

-- L0028@0007.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
7 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0029@0008.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
8 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0030@0009.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
9 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0031@000A.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
10 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0032@000B.  data16 =  @Boot;
--  data16 = 0000000000001111;
11 => X"000F",

-- L0033@000C.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
12 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0034@000D.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
13 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0035@000E.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
14 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0037@000F.Boot:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
15 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0010.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
16 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0011.  data16 =  @QTest - $;
--  data16 = 0000000100001000;
17 => X"0108",

-- L0040@0012.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
18 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0041@0013.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
19 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0042@0014.  data16 =  @StrClear;
--  data16 = 0000000000011111;
20 => X"001F",

-- L0043@0015.DeadLoop:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
21 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0044@0016.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
22 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0017.  data16 =  @Str2UART - $;
--  data16 = 0000000000011001;
23 => X"0019",

-- L0046@0018.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0047@0019.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@001A.  data16 =  @Str2VGA - $;
--  data16 = 0000000001010100;
26 => X"0054",

-- L0049@001B.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
27 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0050@001C.  data16 =  @StrHWorld;
--  data16 = 0000000000100001;
28 => X"0021",

-- L0051@001D.  BRANCH,;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@001E.  data16 =  @DeadLoop - $;
--  data16 = 1111111111110111;
30 => X"FFF7",

-- L0054@001F.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
31 => X"0001",

-- L0055@0020.  data16 =  0;
--  data16 = 0000000000000000;
32 => X"0000",

-- L0057@0021.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
33 => X"0048",

-- L0058@0022.  data16 =  'e';
--  data16 = 0000000001100101;
34 => X"0065",

-- L0059@0023.  data16 =  'l';
--  data16 = 0000000001101100;
35 => X"006C",

-- L0060@0024.  data16 =  'l';
--  data16 = 0000000001101100;
36 => X"006C",

-- L0061@0025.  data16 =  'o';
--  data16 = 0000000001101111;
37 => X"006F",

-- L0062@0026.  data16 =  ' ';
--  data16 = 0000000000100000;
38 => X"0020",

-- L0063@0027.  data16 =  'W';
--  data16 = 0000000001010111;
39 => X"0057",

-- L0064@0028.  data16 =  'o';
--  data16 = 0000000001101111;
40 => X"006F",

-- L0065@0029.  data16 =  'r';
--  data16 = 0000000001110010;
41 => X"0072",

-- L0066@002A.  data16 =  'l';
--  data16 = 0000000001101100;
42 => X"006C",

-- L0067@002B.  data16 =  'd';
--  data16 = 0000000001100100;
43 => X"0064",

-- L0068@002C.  data16 =  '!';
--  data16 = 0000000000100001;
44 => X"0021",

-- L0069@002D.  data16 =  0xD;
--  data16 = 0000000000001101;
45 => X"000D",

-- L0070@002E.  data16 =  0xA;
--  data16 = 0000000000001010;
46 => X"000A",

-- L0071@002F.  data16 =  0;
--  data16 = 0000000000000000;
47 => X"0000",

-- L0075@0030.Str2UART:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
48 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0076@0031.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
49 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0077@0032.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
50 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0078@0033.  data16 =  0xE000;
--  data16 = 1110000000000000;
51 => X"E000",

-- L0079@0034.Str2ULoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
52 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0080@0035.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
53 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0081@0036.  data16 =  @Done - $;
--  data16 = 0000000000001100;
54 => X"000C",

-- L0082@0037.ChkTxdRdy:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
55 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0083@0038.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
56 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0084@0039.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
57 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0085@003A.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
58 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0086@003B.  data16 =  @Str2UOut - $;
--  data16 = 0000000000000011;
59 => X"0003",

-- L0087@003C.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
60 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0088@003D.  data16 =  @ChkTxdRdy - $;
--  data16 = 1111111111111010;
61 => X"FFFA",

-- L0089@003E.Str2UOut:  INY, LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 010, r_s = 000;
62 => X"0" & O"1" & O"6" & O"2" & O"0",

-- L0090@003F.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
63 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0091@0040.  DEY, INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 011, r_s = 000;
64 => X"2" & O"0" & O"2" & O"3" & O"0",

-- L0092@0041.  data16 =  @Str2ULoop - $;
--  data16 = 1111111111110011;
65 => X"FFF3",

-- L0093@0042.Done:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
66 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0094@0043.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
67 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0044.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0045.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
69 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0046.  data16 =  0;
--  data16 = 0000000000000000;
70 => X"0000",

-- L0006@0047.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
71 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@0048.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
72 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@0049.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
73 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@004A.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
74 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@004B.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
75 => X"FFFE",

-- L0013@004C.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
76 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@004D.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
77 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@004E.  data16 =  -1;
--  data16 = 1111111111111111;
78 => X"FFFF",

-- L0016@004F.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
79 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0050.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
80 => X"FFF7",

-- L0021@0051.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
81 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0052.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
82 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0053.  data16 =  16;
--  data16 = 0000000000010000;
83 => X"0010",

-- L0024@0054.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
84 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0055.  data16 =  0;
--  data16 = 0000000000000000;
85 => X"0000",

-- L0027@0056.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
86 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0057.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
87 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@0058.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
88 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@0059.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
89 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@005A.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
90 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@005B.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
91 => X"0005",

-- L0033@005C.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
92 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@005D.  data16 =  0;
--  data16 = 0000000000000000;
93 => X"0000",

-- L0035@005E.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@005F.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
95 => X"0005",

-- L0037@0060.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
96 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0061.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
97 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0062.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
98 => X"FFE2",

-- L0040@0063.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
99 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0064.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
100 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0065.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
101 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0066.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
102 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@0067.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
103 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@0068.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
104 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@0069.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
105 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@006A.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
106 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@006B.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
107 => X"FFEB",

-- L0049@006C.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
108 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@006D.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
109 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@006E.Str2VGA:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
110 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0009@006F.  STY, M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
111 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0011@0070.Str2VGALoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
112 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0012@0071.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
113 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0013@0072.  data16 =  @Str2VGAExit - $;
--  data16 = 0000000010000101;
114 => X"0085",

-- L0014@0073.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
115 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0074.  data16 =  0xD;
--  data16 = 0000000000001101;
116 => X"000D",

-- L0016@0075.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
117 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@0076.  data16 =  @CarReturn - $;
--  data16 = 0000000001100001;
118 => X"0061",

-- L0019@0077.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
119 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0020@0078.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
120 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@0079.  data16 =  0xA;
--  data16 = 0000000000001010;
121 => X"000A",

-- L0022@007A.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@007B.  data16 =  @LineFeed - $;
--  data16 = 0000000001100011;
123 => X"0063",

-- L0025@007C.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
124 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0026@007D.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
125 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@007E.  data16 =  0x2;
--  data16 = 0000000000000010;
126 => X"0002",

-- L0028@007F.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
127 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@0080.  data16 =  @Cur2Home - $;
--  data16 = 0000000001110011;
128 => X"0073",

-- L0031@0081.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
129 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0032@0082.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
130 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0033@0083.  data16 =  0x1;
--  data16 = 0000000000000001;
131 => X"0001",

-- L0034@0084.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
132 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0035@0085.  data16 =  @ClrScreen - $;
--  data16 = 0000000001011110;
133 => X"005E",

-- L0038@0086.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
134 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0087.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
135 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0040@0088.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
136 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@0089.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111001;
137 => X"0079",

-- L0042@008A.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
138 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@008B.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
139 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@008C.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000000;
140 => X"0080",

-- L0045@008D.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
141 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0046@008E.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
142 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0047@008F.  data16 =  64;
--  data16 = 0000000001000000;
143 => X"0040",

-- L0048@0090.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
144 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0049@0091.  data16 =  @NextRow - $;
--  data16 = 0000000000000111;
145 => X"0007",

-- L0050@0092.NoScroll:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
146 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0051@0093.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
147 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@0094.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001100101;
148 => X"0065",

-- L0054@0095.NextChar:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
149 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@0096.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
150 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0056@0097.  data16 =  @Str2VGALoop - $;
--  data16 = 1111111111011001;
151 => X"FFD9",

-- L0058@0098.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
152 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0059@0099.  data16 =  0;
--  data16 = 0000000000000000;
153 => X"0000",

-- L0060@009A.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
154 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@009B.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
155 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0062@009C.  data16 =  32;
--  data16 = 0000000000100000;
156 => X"0020",

-- L0063@009D.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
157 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0064@009E.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
158 => X"0003",

-- L0065@009F.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@00A0.  data16 =  @NoScroll - $;
--  data16 = 1111111111110010;
160 => X"FFF2",

-- L0068@00A1.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
161 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@00A2.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
162 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@00A3.  data16 =  0;
--  data16 = 0000000000000000;
163 => X"0000",

-- L0071@00A4.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
164 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@00A5.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
165 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0073@00A6.  data16 =  0;
--  data16 = 0000000000000000;
166 => X"0000",

-- L0074@00A7.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
167 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@00A8.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
168 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0076@00A9.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
169 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@00AA.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
170 => X"0025",

-- L0078@00AB.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
171 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0079@00AC.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
172 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0080@00AD.  data16 =  32;
--  data16 = 0000000000100000;
173 => X"0020",

-- L0081@00AE.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
174 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0082@00AF.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
175 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0083@00B0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
176 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0084@00B1.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
177 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0085@00B2.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
178 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0086@00B3.  data16 =  64;
--  data16 = 0000000001000000;
179 => X"0040",

-- L0087@00B4.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
180 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0088@00B5.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
181 => X"0003",

-- L0089@00B6.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
182 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00B7.  data16 =  @NxtCol;
--  data16 = 0000000010100111;
183 => X"00A7",

-- L0091@00B8.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
184 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@00B9.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
185 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@00BA.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
186 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0094@00BB.  data16 =  32 - 1;
--  data16 = 0000000000011111;
187 => X"001F",

-- L0095@00BC.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0096@00BD.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
189 => X"0003",

-- L0097@00BE.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@00BF.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
191 => X"FFE5",

-- L0100@00C0.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
192 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0101@00C1.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
193 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00C2.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
194 => X"000D",

-- L0103@00C3.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
195 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0104@00C4.  data16 =  0;
--  data16 = 0000000000000000;
196 => X"0000",

-- L0105@00C5.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
197 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0106@00C6.  data16 =  ' ';
--  data16 = 0000000000100000;
198 => X"0020",

-- L0107@00C7.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
199 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00C8.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
200 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00C9.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
201 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00CA.  data16 =  64;
--  data16 = 0000000001000000;
202 => X"0040",

-- L0111@00CB.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
203 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00CC.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
204 => X"000A",

-- L0113@00CD.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
205 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@00CE.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
206 => X"FFF9",

-- L0117@00CF.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
207 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0118@00D0.  data16 =  64;
--  data16 = 0000000001000000;
208 => X"0040",

-- L0119@00D1.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
209 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0120@00D2.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
210 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00D3.  data16 =  @MulU - $;
--  data16 = 1111111101111110;
211 => X"FF7E",

-- L0122@00D4.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
212 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0123@00D5.  data16 =  0x1000;
--  data16 = 0001000000000000;
213 => X"1000",

-- L0124@00D6.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
214 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0126@00D7.CarReturn:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
215 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0127@00D8.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
216 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0128@00D9.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000101001;
217 => X"0029",

-- L0129@00DA.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
218 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0130@00DB.  data16 =  0;
--  data16 = 0000000000000000;
219 => X"0000",

-- L0131@00DC.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@00DD.  data16 =  @NoScroll - $;
--  data16 = 1111111110110101;
221 => X"FFB5",

-- L0134@00DE.LineFeed:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
222 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@00DF.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
223 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@00E0.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100010;
224 => X"0022",

-- L0137@00E1.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
225 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00E2.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111000;
226 => X"FFB8",

-- L0140@00E3.ClrScreen:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
227 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0141@00E4.  data16 =  64;
--  data16 = 0000000001000000;
228 => X"0040",

-- L0142@00E5.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
229 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0143@00E6.  data16 =  32;
--  data16 = 0000000000100000;
230 => X"0020",

-- L0144@00E7.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
231 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0145@00E8.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
232 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@00E9.  data16 =  @MulU - $;
--  data16 = 1111111101101000;
233 => X"FF68",

-- L0147@00EA.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
234 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@00EB.  data16 =  0x1000;
--  data16 = 0001000000000000;
235 => X"1000",

-- L0149@00EC.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
236 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0150@00ED.  data16 =  ' ';
--  data16 = 0000000000100000;
237 => X"0020",

-- L0151@00EE.ClrPos:  DEY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
238 => X"0" & O"0" & O"0" & O"3" & O"0",

-- L0152@00EF.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
239 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0153@00F0.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
240 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0154@00F1.  data16 =  @ClrPos - $;
--  data16 = 1111111111111101;
241 => X"FFFD",

-- L0155@00F2.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
242 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0156@00F3.Cur2Home:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
243 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0157@00F4.  data16 =  0;
--  data16 = 0000000000000000;
244 => X"0000",

-- L0158@00F5.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
245 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@00F6.  data16 =  @NoScroll - $;
--  data16 = 1111111110011100;
246 => X"FF9C",

-- L0161@00F7.Str2VGAExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
247 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0162@00F8.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
248 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0164@00F9.SetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
249 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0165@00FA.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
250 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@00FB.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
251 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0167@00FC.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
252 => X"FF00",

-- L0168@00FD.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
253 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0169@00FE.  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
254 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0170@00FF.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
255 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0171@0100.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
256 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0172@0101.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
257 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0174@0102.GetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
258 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0175@0103.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
259 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0176@0104.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
260 => X"FF00",

-- L0177@0105.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
261 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0178@0106.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
262 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0179@0107.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
263 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0180@0108.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
264 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0181@0109.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
265 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0182@010A.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
266 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0183@010B.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
267 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0185@010C.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
268 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0186@010D.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
269 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0187@010E.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
270 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0188@010F.  data16 =  64;
--  data16 = 0000000001000000;
271 => X"0040",

-- L0189@0110.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
272 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0190@0111.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
273 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0112.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
274 => X"FF3F",

-- L0192@0113.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
275 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0193@0114.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
276 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0194@0115.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
277 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0195@0116.  data16 =  0x1000;
--  data16 = 0001000000000000;
278 => X"1000",

-- L0196@0117.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
279 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0197@0118.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
280 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0199@0119.QTest:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
281 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0200@011A.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
282 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0201@011B.  data16 =  0x1000;
--  data16 = 0001000000000000;
283 => X"1000",

-- L0202@011C.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
284 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0203@011D.  data16 =  0;
--  data16 = 0000000000000000;
285 => X"0000",

-- L0204@011E.QTestLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
286 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0205@011F.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
287 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0206@0120.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
288 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0207@0121.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
289 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0208@0122.  data16 =  64 * 32;
--  data16 = 0000100000000000;
290 => X"0800",

-- L0209@0123.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
291 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0210@0124.  data16 =  @Str2VGAExit - $;
--  data16 = 1111111111010011;
292 => X"FFD3",

-- L0211@0125.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
293 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0212@0126.  data16 =  @QTestLoop - $;
--  data16 = 1111111111111000;
294 => X"FFF8",

-- 217 location(s) in following ranges will be filled with default value
-- 0127 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

