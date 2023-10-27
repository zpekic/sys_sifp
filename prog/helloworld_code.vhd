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

-- L0020@0001.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
1 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0021@0002.  data16 =  ' ';
--  data16 = 0000000000100000;
2 => X"0020",

-- L0022@0003.DeadLoop1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
3 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0023@0004.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
4 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0024@0005.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
5 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0025@0006.  data16 =  @VGATest - $;
--  data16 = 0000000100010010;
6 => X"0112",

-- L0026@0007.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
7 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0027@0008.  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
8 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0028@0009.  data16 =  1;
--  data16 = 0000000000000001;
9 => X"0001",

-- L0029@000A.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0030@000B.  data16 =  @DeadLoop1 - $;
--  data16 = 1111111111111000;
11 => X"FFF8",

-- L0032@000C.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
12 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0033@000D.  data16 =  0xE000;
--  data16 = 1110000000000000;
13 => X"E000",

-- L0034@000E.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
14 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0035@000F.  data16 =  3;
--  data16 = 0000000000000011;
15 => X"0003",

-- L0036@0010.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
16 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0037@0011.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
17 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0038@0012.  data16 =  0x10;
--  data16 = 0000000000010000;
18 => X"0010",

-- L0039@0013.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
19 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0041@0014.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
20 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0042@0015.  data16 =  @StrClear;
--  data16 = 0000000000011110;
21 => X"001E",

-- L0043@0016.DeadLoop:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
22 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0044@0017.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
23 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0045@0018.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
24 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0046@0019.  data16 =  @Str2UART - $;
--  data16 = 0000000000010110;
25 => X"0016",

-- L0047@001A.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
26 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0048@001B.  data16 =  @StrHWorld;
--  data16 = 0000000000100000;
27 => X"0020",

-- L0052@001C.  BRANCH,;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
28 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0053@001D.  data16 =  @DeadLoop - $;
--  data16 = 1111111111111001;
29 => X"FFF9",

-- L0055@001E.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
30 => X"0001",

-- L0056@001F.  data16 =  0;
--  data16 = 0000000000000000;
31 => X"0000",

-- L0058@0020.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
32 => X"0048",

-- L0059@0021.  data16 =  'e';
--  data16 = 0000000001100101;
33 => X"0065",

-- L0060@0022.  data16 =  'l';
--  data16 = 0000000001101100;
34 => X"006C",

-- L0061@0023.  data16 =  'l';
--  data16 = 0000000001101100;
35 => X"006C",

-- L0062@0024.  data16 =  'o';
--  data16 = 0000000001101111;
36 => X"006F",

-- L0063@0025.  data16 =  ' ';
--  data16 = 0000000000100000;
37 => X"0020",

-- L0064@0026.  data16 =  'W';
--  data16 = 0000000001010111;
38 => X"0057",

-- L0065@0027.  data16 =  'o';
--  data16 = 0000000001101111;
39 => X"006F",

-- L0066@0028.  data16 =  'r';
--  data16 = 0000000001110010;
40 => X"0072",

-- L0067@0029.  data16 =  'l';
--  data16 = 0000000001101100;
41 => X"006C",

-- L0068@002A.  data16 =  'd';
--  data16 = 0000000001100100;
42 => X"0064",

-- L0069@002B.  data16 =  '!';
--  data16 = 0000000000100001;
43 => X"0021",

-- L0070@002C.  data16 =  0xD;
--  data16 = 0000000000001101;
44 => X"000D",

-- L0071@002D.  data16 =  0xA;
--  data16 = 0000000000001010;
45 => X"000A",

-- L0072@002E.  data16 =  0;
--  data16 = 0000000000000000;
46 => X"0000",

-- L0076@002F.Str2UART:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
47 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0077@0030.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
48 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0078@0031.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
49 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0079@0032.  data16 =  0xE000;
--  data16 = 1110000000000000;
50 => X"E000",

-- L0080@0033.Str2ULoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
51 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0081@0034.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
52 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0082@0035.  data16 =  @Done - $;
--  data16 = 0000000000001100;
53 => X"000C",

-- L0083@0036.ChkTxdRdy:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
54 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0084@0037.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
55 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0085@0038.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
56 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0086@0039.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
57 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0087@003A.  data16 =  @Str2UOut - $;
--  data16 = 0000000000000011;
58 => X"0003",

-- L0088@003B.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0089@003C.  data16 =  @ChkTxdRdy - $;
--  data16 = 1111111111111010;
60 => X"FFFA",

-- L0090@003D.Str2UOut:  INY, LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 010, r_s = 000;
61 => X"0" & O"1" & O"6" & O"2" & O"0",

-- L0091@003E.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
62 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0092@003F.  DEY, INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 011, r_s = 000;
63 => X"2" & O"0" & O"2" & O"3" & O"0",

-- L0093@0040.  data16 =  @Str2ULoop - $;
--  data16 = 1111111111110011;
64 => X"FFF3",

-- L0094@0041.Done:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
65 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0095@0042.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
66 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0043.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
67 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0044.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
68 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0045.  data16 =  0;
--  data16 = 0000000000000000;
69 => X"0000",

-- L0006@0046.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
70 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@0047.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
71 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@0048.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
72 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@0049.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
73 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@004A.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
74 => X"FFFE",

-- L0013@004B.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
75 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@004C.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
76 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@004D.  data16 =  -1;
--  data16 = 1111111111111111;
77 => X"FFFF",

-- L0016@004E.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@004F.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
79 => X"FFF7",

-- L0021@0050.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
80 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0051.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
81 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0052.  data16 =  16;
--  data16 = 0000000000010000;
82 => X"0010",

-- L0024@0053.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
83 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0054.  data16 =  0;
--  data16 = 0000000000000000;
84 => X"0000",

-- L0027@0055.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
85 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0056.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
86 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@0057.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
87 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@0058.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
88 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@0059.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
89 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@005A.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
90 => X"0005",

-- L0033@005B.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
91 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@005C.  data16 =  0;
--  data16 = 0000000000000000;
92 => X"0000",

-- L0035@005D.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
93 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@005E.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
94 => X"0005",

-- L0037@005F.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
95 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0060.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
96 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0061.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
97 => X"FFE2",

-- L0040@0062.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
98 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0063.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
99 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0064.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
100 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0065.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
101 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@0066.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
102 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@0067.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
103 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@0068.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
104 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@0069.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
105 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@006A.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
106 => X"FFEB",

-- L0049@006B.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
107 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@006C.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
108 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@006D.Str2VGA:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
109 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0009@006E.  STY, M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
110 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0011@006F.Str2VGALoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
111 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0012@0070.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
112 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0013@0071.  data16 =  @Str2VGAExit - $;
--  data16 = 0000000010000101;
113 => X"0085",

-- L0014@0072.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
114 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0073.  data16 =  0xD;
--  data16 = 0000000000001101;
115 => X"000D",

-- L0016@0074.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@0075.  data16 =  @CarReturn - $;
--  data16 = 0000000001100001;
117 => X"0061",

-- L0019@0076.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
118 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0020@0077.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
119 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@0078.  data16 =  0xA;
--  data16 = 0000000000001010;
120 => X"000A",

-- L0022@0079.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
121 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@007A.  data16 =  @LineFeed - $;
--  data16 = 0000000001100011;
122 => X"0063",

-- L0025@007B.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
123 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0026@007C.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
124 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@007D.  data16 =  0x2;
--  data16 = 0000000000000010;
125 => X"0002",

-- L0028@007E.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@007F.  data16 =  @Cur2Home - $;
--  data16 = 0000000001110011;
127 => X"0073",

-- L0031@0080.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
128 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0032@0081.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
129 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0033@0082.  data16 =  0x1;
--  data16 = 0000000000000001;
130 => X"0001",

-- L0034@0083.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0035@0084.  data16 =  @ClrScreen - $;
--  data16 = 0000000001011110;
132 => X"005E",

-- L0038@0085.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
133 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0086.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
134 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0040@0087.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
135 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@0088.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111001;
136 => X"0079",

-- L0042@0089.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
137 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@008A.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
138 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@008B.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000000;
139 => X"0080",

-- L0045@008C.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
140 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0046@008D.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
141 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0047@008E.  data16 =  64;
--  data16 = 0000000001000000;
142 => X"0040",

-- L0048@008F.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
143 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0049@0090.  data16 =  @NextRow - $;
--  data16 = 0000000000000111;
144 => X"0007",

-- L0050@0091.NoScroll:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
145 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0051@0092.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
146 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@0093.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001100101;
147 => X"0065",

-- L0054@0094.NextChar:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
148 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@0095.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
149 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0056@0096.  data16 =  @Str2VGALoop - $;
--  data16 = 1111111111011001;
150 => X"FFD9",

-- L0058@0097.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
151 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0059@0098.  data16 =  0;
--  data16 = 0000000000000000;
152 => X"0000",

-- L0060@0099.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
153 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@009A.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
154 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0062@009B.  data16 =  32;
--  data16 = 0000000000100000;
155 => X"0020",

-- L0063@009C.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0064@009D.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
157 => X"0003",

-- L0065@009E.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@009F.  data16 =  @NoScroll - $;
--  data16 = 1111111111110010;
159 => X"FFF2",

-- L0068@00A0.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
160 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@00A1.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
161 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@00A2.  data16 =  0;
--  data16 = 0000000000000000;
162 => X"0000",

-- L0071@00A3.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
163 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@00A4.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
164 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0073@00A5.  data16 =  0;
--  data16 = 0000000000000000;
165 => X"0000",

-- L0074@00A6.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
166 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@00A7.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
167 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0076@00A8.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@00A9.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
169 => X"0025",

-- L0078@00AA.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
170 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0079@00AB.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
171 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0080@00AC.  data16 =  32;
--  data16 = 0000000000100000;
172 => X"0020",

-- L0081@00AD.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
173 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0082@00AE.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
174 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0083@00AF.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
175 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0084@00B0.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
176 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0085@00B1.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
177 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0086@00B2.  data16 =  64;
--  data16 = 0000000001000000;
178 => X"0040",

-- L0087@00B3.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
179 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0088@00B4.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
180 => X"0003",

-- L0089@00B5.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
181 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00B6.  data16 =  @NxtCol;
--  data16 = 0000000010100110;
182 => X"00A6",

-- L0091@00B7.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
183 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@00B8.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
184 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@00B9.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
185 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0094@00BA.  data16 =  32 - 1;
--  data16 = 0000000000011111;
186 => X"001F",

-- L0095@00BB.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
187 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0096@00BC.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
188 => X"0003",

-- L0097@00BD.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
189 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@00BE.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
190 => X"FFE5",

-- L0100@00BF.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
191 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0101@00C0.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
192 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00C1.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
193 => X"000D",

-- L0103@00C2.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
194 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0104@00C3.  data16 =  0;
--  data16 = 0000000000000000;
195 => X"0000",

-- L0105@00C4.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
196 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0106@00C5.  data16 =  ' ';
--  data16 = 0000000000100000;
197 => X"0020",

-- L0107@00C6.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
198 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00C7.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
199 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00C8.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
200 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00C9.  data16 =  64;
--  data16 = 0000000001000000;
201 => X"0040",

-- L0111@00CA.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
202 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00CB.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
203 => X"000A",

-- L0113@00CC.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
204 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@00CD.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
205 => X"FFF9",

-- L0117@00CE.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
206 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0118@00CF.  data16 =  64;
--  data16 = 0000000001000000;
207 => X"0040",

-- L0119@00D0.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
208 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0120@00D1.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
209 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00D2.  data16 =  @MulU - $;
--  data16 = 1111111101111110;
210 => X"FF7E",

-- L0122@00D3.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
211 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0123@00D4.  data16 =  0x1000;
--  data16 = 0001000000000000;
212 => X"1000",

-- L0124@00D5.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
213 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0126@00D6.CarReturn:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
214 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0127@00D7.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
215 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0128@00D8.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000101001;
216 => X"0029",

-- L0129@00D9.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
217 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0130@00DA.  data16 =  0;
--  data16 = 0000000000000000;
218 => X"0000",

-- L0131@00DB.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
219 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@00DC.  data16 =  @NoScroll - $;
--  data16 = 1111111110110101;
220 => X"FFB5",

-- L0134@00DD.LineFeed:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
221 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@00DE.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
222 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@00DF.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100010;
223 => X"0022",

-- L0137@00E0.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
224 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00E1.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111000;
225 => X"FFB8",

-- L0140@00E2.ClrScreen:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
226 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0141@00E3.  data16 =  64;
--  data16 = 0000000001000000;
227 => X"0040",

-- L0142@00E4.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
228 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0143@00E5.  data16 =  32;
--  data16 = 0000000000100000;
229 => X"0020",

-- L0144@00E6.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
230 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0145@00E7.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
231 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@00E8.  data16 =  @MulU - $;
--  data16 = 1111111101101000;
232 => X"FF68",

-- L0147@00E9.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
233 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@00EA.  data16 =  0x1000;
--  data16 = 0001000000000000;
234 => X"1000",

-- L0149@00EB.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
235 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0150@00EC.  data16 =  ' ';
--  data16 = 0000000000100000;
236 => X"0020",

-- L0151@00ED.ClrPos:  DEY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
237 => X"0" & O"0" & O"0" & O"3" & O"0",

-- L0152@00EE.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
238 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0153@00EF.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
239 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0154@00F0.  data16 =  @ClrPos - $;
--  data16 = 1111111111111101;
240 => X"FFFD",

-- L0155@00F1.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
241 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0156@00F2.Cur2Home:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
242 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0157@00F3.  data16 =  0;
--  data16 = 0000000000000000;
243 => X"0000",

-- L0158@00F4.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
244 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@00F5.  data16 =  @NoScroll - $;
--  data16 = 1111111110011100;
245 => X"FF9C",

-- L0161@00F6.Str2VGAExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
246 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0162@00F7.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
247 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0164@00F8.SetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
248 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0165@00F9.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
249 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@00FA.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
250 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0167@00FB.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
251 => X"FF00",

-- L0168@00FC.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
252 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0169@00FD.  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
253 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0170@00FE.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
254 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0171@00FF.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
255 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0172@0100.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
256 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0174@0101.GetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
257 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0175@0102.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
258 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0176@0103.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
259 => X"FF00",

-- L0177@0104.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
260 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0178@0105.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
261 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0179@0106.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
262 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0180@0107.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
263 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0181@0108.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
264 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0182@0109.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
265 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0183@010A.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
266 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0185@010B.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
267 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0186@010C.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
268 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0187@010D.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
269 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0188@010E.  data16 =  64;
--  data16 = 0000000001000000;
270 => X"0040",

-- L0189@010F.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
271 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0190@0110.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
272 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0111.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
273 => X"FF3F",

-- L0192@0112.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
274 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0193@0113.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
275 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0194@0114.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
276 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0195@0115.  data16 =  0x1000;
--  data16 = 0001000000000000;
277 => X"1000",

-- L0196@0116.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
278 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0197@0117.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
279 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0199@0118.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
280 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0200@0119.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
281 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0201@011A.  data16 =  0x1000;
--  data16 = 0001000000000000;
282 => X"1000",

-- L0202@011B.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
283 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0203@011C.  data16 =  0;
--  data16 = 0000000000000000;
284 => X"0000",

-- L0204@011D.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
285 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0205@011E.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
286 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0206@011F.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
287 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0207@0120.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
288 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0208@0121.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
289 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0209@0122.  data16 =  64 * 32;
--  data16 = 0000100000000000;
290 => X"0800",

-- L0210@0123.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
291 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0211@0124.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
292 => X"0003",

-- L0212@0125.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
293 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0213@0126.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
294 => X"FFF7",

-- L0214@0127.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
295 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0215@0128.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
296 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0218@0129.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
297 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0219@012A.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
298 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0220@012B.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
299 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0221@012C.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
300 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0222@012D.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
301 => X"0002",

-- L0223@012E.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
302 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0224@012F.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
303 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0225@0130.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
304 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0226@0131.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
305 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0227@0132.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
306 => X"0002",

-- L0228@0133.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
307 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0229@0134.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
308 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0230@0135.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
309 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0231@0136.  data16 =  0;
--  data16 = 0000000000000000;
310 => X"0000",

-- L0232@0137.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
311 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0233@0138.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
312 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0234@0139.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
313 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0235@013A.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
314 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0236@013B.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
315 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 196 location(s) in following ranges will be filled with default value
-- 013C .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

