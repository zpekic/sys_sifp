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

-- L0024@0001.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
1 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0025@0002.  data16 =  0xE000;
--  data16 = 1110000000000000;
2 => X"E000",

-- L0026@0003.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
3 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0027@0004.  data16 =  3;
--  data16 = 0000000000000011;
4 => X"0003",

-- L0028@0005.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
5 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0029@0006.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
6 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0030@0007.  data16 =  0x10;
--  data16 = 0000000000010000;
7 => X"0010",

-- L0031@0008.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
8 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0033@0009.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
9 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0034@000A.  data16 =  @StrClear;
--  data16 = 0000000000010011;
10 => X"0013",

-- L0035@000B.DeadLoop:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
11 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0036@000C.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
12 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0037@000D.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@000E.  data16 =  @Str2UART - $;
--  data16 = 0000000000010110;
14 => X"0016",

-- L0039@000F.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
15 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0040@0010.  data16 =  @StrHWorld;
--  data16 = 0000000000010101;
16 => X"0015",

-- L0044@0011.  BRANCH,;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
17 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0012.  data16 =  @DeadLoop - $;
--  data16 = 1111111111111001;
18 => X"FFF9",

-- L0047@0013.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
19 => X"0001",

-- L0048@0014.  data16 =  0;
--  data16 = 0000000000000000;
20 => X"0000",

-- L0050@0015.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
21 => X"0048",

-- L0051@0016.  data16 =  'e';
--  data16 = 0000000001100101;
22 => X"0065",

-- L0052@0017.  data16 =  'l';
--  data16 = 0000000001101100;
23 => X"006C",

-- L0053@0018.  data16 =  'l';
--  data16 = 0000000001101100;
24 => X"006C",

-- L0054@0019.  data16 =  'o';
--  data16 = 0000000001101111;
25 => X"006F",

-- L0055@001A.  data16 =  ' ';
--  data16 = 0000000000100000;
26 => X"0020",

-- L0056@001B.  data16 =  'W';
--  data16 = 0000000001010111;
27 => X"0057",

-- L0057@001C.  data16 =  'o';
--  data16 = 0000000001101111;
28 => X"006F",

-- L0058@001D.  data16 =  'r';
--  data16 = 0000000001110010;
29 => X"0072",

-- L0059@001E.  data16 =  'l';
--  data16 = 0000000001101100;
30 => X"006C",

-- L0060@001F.  data16 =  'd';
--  data16 = 0000000001100100;
31 => X"0064",

-- L0061@0020.  data16 =  '!';
--  data16 = 0000000000100001;
32 => X"0021",

-- L0062@0021.  data16 =  0xD;
--  data16 = 0000000000001101;
33 => X"000D",

-- L0063@0022.  data16 =  0xA;
--  data16 = 0000000000001010;
34 => X"000A",

-- L0064@0023.  data16 =  0;
--  data16 = 0000000000000000;
35 => X"0000",

-- L0068@0024.Str2UART:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@0025.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
37 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0070@0026.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
38 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0071@0027.  data16 =  0xE000;
--  data16 = 1110000000000000;
39 => X"E000",

-- L0072@0028.Str2ULoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
40 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0073@0029.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0074@002A.  data16 =  @Done - $;
--  data16 = 0000000000001100;
42 => X"000C",

-- L0075@002B.ChkTxdRdy:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
43 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0076@002C.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
44 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0077@002D.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
45 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0078@002E.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
46 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0079@002F.  data16 =  @Str2UOut - $;
--  data16 = 0000000000000011;
47 => X"0003",

-- L0080@0030.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
48 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0081@0031.  data16 =  @ChkTxdRdy - $;
--  data16 = 1111111111111010;
49 => X"FFFA",

-- L0082@0032.Str2UOut:  INY, LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 010, r_s = 000;
50 => X"0" & O"1" & O"6" & O"2" & O"0",

-- L0083@0033.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
51 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0084@0034.  DEY, INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 011, r_s = 000;
52 => X"2" & O"0" & O"2" & O"3" & O"0",

-- L0085@0035.  data16 =  @Str2ULoop - $;
--  data16 = 1111111111110011;
53 => X"FFF3",

-- L0086@0036.Done:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
54 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0087@0037.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
55 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0038.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
56 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0039.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
57 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@003A.  data16 =  0;
--  data16 = 0000000000000000;
58 => X"0000",

-- L0006@003B.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
59 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@003C.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
60 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@003D.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
61 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@003E.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
62 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@003F.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
63 => X"FFFE",

-- L0013@0040.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
64 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0041.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
65 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@0042.  data16 =  -1;
--  data16 = 1111111111111111;
66 => X"FFFF",

-- L0016@0043.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
67 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0044.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
68 => X"FFF7",

-- L0021@0045.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
69 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0046.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
70 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0047.  data16 =  16;
--  data16 = 0000000000010000;
71 => X"0010",

-- L0024@0048.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
72 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0049.  data16 =  0;
--  data16 = 0000000000000000;
73 => X"0000",

-- L0027@004A.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
74 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@004B.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
75 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@004C.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
76 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@004D.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
77 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@004E.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@004F.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
79 => X"0005",

-- L0033@0050.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
80 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@0051.  data16 =  0;
--  data16 = 0000000000000000;
81 => X"0000",

-- L0035@0052.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0053.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
83 => X"0005",

-- L0037@0054.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
84 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0055.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
85 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0056.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
86 => X"FFE2",

-- L0040@0057.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
87 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0058.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
88 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0059.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
89 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@005A.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
90 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@005B.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
91 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@005C.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
92 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@005D.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
93 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@005E.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@005F.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
95 => X"FFEB",

-- L0049@0060.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
96 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@0061.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
97 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@0062.Str2VGA:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
98 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0009@0063.  STY, M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
99 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0011@0064.Str2VGALoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
100 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0012@0065.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
101 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0013@0066.  data16 =  @Str2VGAExit - $;
--  data16 = 0000000010000101;
102 => X"0085",

-- L0014@0067.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
103 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0068.  data16 =  0xD;
--  data16 = 0000000000001101;
104 => X"000D",

-- L0016@0069.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
105 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@006A.  data16 =  @CarReturn - $;
--  data16 = 0000000001100001;
106 => X"0061",

-- L0019@006B.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
107 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0020@006C.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
108 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@006D.  data16 =  0xA;
--  data16 = 0000000000001010;
109 => X"000A",

-- L0022@006E.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
110 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@006F.  data16 =  @LineFeed - $;
--  data16 = 0000000001100011;
111 => X"0063",

-- L0025@0070.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
112 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0026@0071.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
113 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@0072.  data16 =  0x2;
--  data16 = 0000000000000010;
114 => X"0002",

-- L0028@0073.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
115 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@0074.  data16 =  @Cur2Home - $;
--  data16 = 0000000001110011;
116 => X"0073",

-- L0031@0075.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
117 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0032@0076.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
118 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0033@0077.  data16 =  0x1;
--  data16 = 0000000000000001;
119 => X"0001",

-- L0034@0078.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
120 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0035@0079.  data16 =  @ClrScreen - $;
--  data16 = 0000000001011110;
121 => X"005E",

-- L0038@007A.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
122 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@007B.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
123 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0040@007C.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@007D.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111001;
125 => X"0079",

-- L0042@007E.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
126 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@007F.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
127 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@0080.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000000;
128 => X"0080",

-- L0045@0081.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
129 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0046@0082.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
130 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0047@0083.  data16 =  64;
--  data16 = 0000000001000000;
131 => X"0040",

-- L0048@0084.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
132 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0049@0085.  data16 =  @NextRow - $;
--  data16 = 0000000000000111;
133 => X"0007",

-- L0050@0086.NoScroll:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
134 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0051@0087.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
135 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@0088.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001100101;
136 => X"0065",

-- L0054@0089.NextChar:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
137 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@008A.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
138 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0056@008B.  data16 =  @Str2VGALoop - $;
--  data16 = 1111111111011001;
139 => X"FFD9",

-- L0058@008C.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
140 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0059@008D.  data16 =  0;
--  data16 = 0000000000000000;
141 => X"0000",

-- L0060@008E.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
142 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@008F.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
143 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0062@0090.  data16 =  32;
--  data16 = 0000000000100000;
144 => X"0020",

-- L0063@0091.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
145 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0064@0092.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
146 => X"0003",

-- L0065@0093.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
147 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@0094.  data16 =  @NoScroll - $;
--  data16 = 1111111111110010;
148 => X"FFF2",

-- L0068@0095.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
149 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@0096.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
150 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@0097.  data16 =  0;
--  data16 = 0000000000000000;
151 => X"0000",

-- L0071@0098.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
152 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@0099.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
153 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0073@009A.  data16 =  0;
--  data16 = 0000000000000000;
154 => X"0000",

-- L0074@009B.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
155 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@009C.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
156 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0076@009D.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
157 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@009E.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
158 => X"0025",

-- L0078@009F.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
159 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0079@00A0.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
160 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0080@00A1.  data16 =  32;
--  data16 = 0000000000100000;
161 => X"0020",

-- L0081@00A2.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
162 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0082@00A3.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
163 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0083@00A4.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
164 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0084@00A5.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
165 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0085@00A6.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
166 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0086@00A7.  data16 =  64;
--  data16 = 0000000001000000;
167 => X"0040",

-- L0087@00A8.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0088@00A9.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
169 => X"0003",

-- L0089@00AA.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
170 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00AB.  data16 =  @NxtCol;
--  data16 = 0000000010011011;
171 => X"009B",

-- L0091@00AC.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
172 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@00AD.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
173 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@00AE.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
174 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0094@00AF.  data16 =  32 - 1;
--  data16 = 0000000000011111;
175 => X"001F",

-- L0095@00B0.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
176 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0096@00B1.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
177 => X"0003",

-- L0097@00B2.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@00B3.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
179 => X"FFE5",

-- L0100@00B4.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
180 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0101@00B5.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
181 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00B6.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
182 => X"000D",

-- L0103@00B7.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
183 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0104@00B8.  data16 =  0;
--  data16 = 0000000000000000;
184 => X"0000",

-- L0105@00B9.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
185 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0106@00BA.  data16 =  ' ';
--  data16 = 0000000000100000;
186 => X"0020",

-- L0107@00BB.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
187 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00BC.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
188 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00BD.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
189 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00BE.  data16 =  64;
--  data16 = 0000000001000000;
190 => X"0040",

-- L0111@00BF.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
191 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00C0.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
192 => X"000A",

-- L0113@00C1.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
193 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@00C2.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
194 => X"FFF9",

-- L0117@00C3.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
195 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0118@00C4.  data16 =  64;
--  data16 = 0000000001000000;
196 => X"0040",

-- L0119@00C5.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
197 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0120@00C6.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
198 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00C7.  data16 =  @MulU - $;
--  data16 = 1111111101111110;
199 => X"FF7E",

-- L0122@00C8.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
200 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0123@00C9.  data16 =  0x1000;
--  data16 = 0001000000000000;
201 => X"1000",

-- L0124@00CA.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
202 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0126@00CB.CarReturn:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
203 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0127@00CC.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
204 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0128@00CD.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000101001;
205 => X"0029",

-- L0129@00CE.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
206 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0130@00CF.  data16 =  0;
--  data16 = 0000000000000000;
207 => X"0000",

-- L0131@00D0.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
208 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@00D1.  data16 =  @NoScroll - $;
--  data16 = 1111111110110101;
209 => X"FFB5",

-- L0134@00D2.LineFeed:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
210 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@00D3.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
211 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@00D4.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100010;
212 => X"0022",

-- L0137@00D5.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
213 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00D6.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111000;
214 => X"FFB8",

-- L0140@00D7.ClrScreen:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
215 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0141@00D8.  data16 =  64;
--  data16 = 0000000001000000;
216 => X"0040",

-- L0142@00D9.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
217 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0143@00DA.  data16 =  32;
--  data16 = 0000000000100000;
218 => X"0020",

-- L0144@00DB.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
219 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0145@00DC.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@00DD.  data16 =  @MulU - $;
--  data16 = 1111111101101000;
221 => X"FF68",

-- L0147@00DE.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
222 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@00DF.  data16 =  0x1000;
--  data16 = 0001000000000000;
223 => X"1000",

-- L0149@00E0.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
224 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0150@00E1.  data16 =  ' ';
--  data16 = 0000000000100000;
225 => X"0020",

-- L0151@00E2.ClrPos:  DEY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
226 => X"0" & O"0" & O"0" & O"3" & O"0",

-- L0152@00E3.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
227 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0153@00E4.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
228 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0154@00E5.  data16 =  @ClrPos - $;
--  data16 = 1111111111111101;
229 => X"FFFD",

-- L0155@00E6.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
230 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0156@00E7.Cur2Home:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
231 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0157@00E8.  data16 =  0;
--  data16 = 0000000000000000;
232 => X"0000",

-- L0158@00E9.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
233 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@00EA.  data16 =  @NoScroll - $;
--  data16 = 1111111110011100;
234 => X"FF9C",

-- L0161@00EB.Str2VGAExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
235 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0162@00EC.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
236 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0164@00ED.SetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
237 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0165@00EE.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
238 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@00EF.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
239 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0167@00F0.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
240 => X"FF00",

-- L0168@00F1.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
241 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0169@00F2.  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
242 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0170@00F3.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
243 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0171@00F4.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
244 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0172@00F5.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
245 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0174@00F6.GetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
246 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0175@00F7.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
247 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0176@00F8.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
248 => X"FF00",

-- L0177@00F9.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
249 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0178@00FA.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
250 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0179@00FB.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
251 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0180@00FC.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
252 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0181@00FD.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
253 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0182@00FE.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
254 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0183@00FF.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
255 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0185@0100.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
256 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0186@0101.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
257 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0187@0102.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
258 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0188@0103.  data16 =  64;
--  data16 = 0000000001000000;
259 => X"0040",

-- L0189@0104.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
260 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0190@0105.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
261 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0106.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
262 => X"FF3F",

-- L0192@0107.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
263 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0193@0108.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
264 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0194@0109.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
265 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0195@010A.  data16 =  0x1000;
--  data16 = 0001000000000000;
266 => X"1000",

-- L0196@010B.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
267 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0197@010C.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
268 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0199@010D.VGATest:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
269 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0200@010E.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
270 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0201@010F.  data16 =  0x1000;
--  data16 = 0001000000000000;
271 => X"1000",

-- L0202@0110.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
272 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0203@0111.  data16 =  0;
--  data16 = 0000000000000000;
273 => X"0000",

-- L0204@0112.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
274 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0205@0113.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
275 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0206@0114.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
276 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0207@0115.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
277 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0208@0116.  data16 =  64 * 32;
--  data16 = 0000100000000000;
278 => X"0800",

-- L0209@0117.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
279 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0210@0118.  data16 =  @Str2VGAExit - $;
--  data16 = 1111111111010011;
280 => X"FFD3",

-- L0211@0119.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
281 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0212@011A.  data16 =  @VGATLoop - $;
--  data16 = 1111111111111000;
282 => X"FFF8",

-- L0215@011B.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
283 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0216@011C.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
284 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0217@011D.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
285 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0218@011E.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
286 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0219@011F.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
287 => X"0002",

-- L0220@0120.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
288 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0221@0121.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
289 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0222@0122.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
290 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0223@0123.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
291 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0224@0124.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
292 => X"0002",

-- L0225@0125.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
293 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0226@0126.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
294 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0227@0127.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
295 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0228@0128.  data16 =  0;
--  data16 = 0000000000000000;
296 => X"0000",

-- L0229@0129.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
297 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0230@012A.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
298 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0231@012B.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
299 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0232@012C.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
300 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0233@012D.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
301 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 210 location(s) in following ranges will be filled with default value
-- 012E .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

