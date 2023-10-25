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

-- L0020@0001.Boot:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0021@0002.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0022@0003.  data16 =  @VGATest - $;
--  data16 = 0000000100000111;
3 => X"0107",

-- L0024@0004.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0025@0005.  data16 =  @StrClear;
--  data16 = 0000000000010000;
5 => X"0010",

-- L0026@0006.DeadLoop:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
6 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0027@0007.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
7 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0028@0008.  data16 =  @Str2UART - $;
--  data16 = 0000000000011001;
8 => X"0019",

-- L0029@0009.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
9 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0030@000A.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@000B.  data16 =  @Str2VGA - $;
--  data16 = 0000000001010100;
11 => X"0054",

-- L0032@000C.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
12 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0033@000D.  data16 =  @StrHWorld;
--  data16 = 0000000000010010;
13 => X"0012",

-- L0034@000E.  BRANCH,;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
14 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@000F.  data16 =  @DeadLoop - $;
--  data16 = 1111111111110111;
15 => X"FFF7",

-- L0037@0010.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
16 => X"0001",

-- L0038@0011.  data16 =  0;
--  data16 = 0000000000000000;
17 => X"0000",

-- L0040@0012.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
18 => X"0048",

-- L0041@0013.  data16 =  'e';
--  data16 = 0000000001100101;
19 => X"0065",

-- L0042@0014.  data16 =  'l';
--  data16 = 0000000001101100;
20 => X"006C",

-- L0043@0015.  data16 =  'l';
--  data16 = 0000000001101100;
21 => X"006C",

-- L0044@0016.  data16 =  'o';
--  data16 = 0000000001101111;
22 => X"006F",

-- L0045@0017.  data16 =  ' ';
--  data16 = 0000000000100000;
23 => X"0020",

-- L0046@0018.  data16 =  'W';
--  data16 = 0000000001010111;
24 => X"0057",

-- L0047@0019.  data16 =  'o';
--  data16 = 0000000001101111;
25 => X"006F",

-- L0048@001A.  data16 =  'r';
--  data16 = 0000000001110010;
26 => X"0072",

-- L0049@001B.  data16 =  'l';
--  data16 = 0000000001101100;
27 => X"006C",

-- L0050@001C.  data16 =  'd';
--  data16 = 0000000001100100;
28 => X"0064",

-- L0051@001D.  data16 =  '!';
--  data16 = 0000000000100001;
29 => X"0021",

-- L0052@001E.  data16 =  0xD;
--  data16 = 0000000000001101;
30 => X"000D",

-- L0053@001F.  data16 =  0xA;
--  data16 = 0000000000001010;
31 => X"000A",

-- L0054@0020.  data16 =  0;
--  data16 = 0000000000000000;
32 => X"0000",

-- L0058@0021.Str2UART:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0059@0022.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
34 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@0023.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
35 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0061@0024.  data16 =  0xE000;
--  data16 = 1110000000000000;
36 => X"E000",

-- L0062@0025.Str2ULoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
37 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0063@0026.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0064@0027.  data16 =  @Done - $;
--  data16 = 0000000000001100;
39 => X"000C",

-- L0065@0028.ChkTxdRdy:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
40 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0066@0029.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
41 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0067@002A.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
42 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0068@002B.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
43 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0069@002C.  data16 =  @Str2UOut - $;
--  data16 = 0000000000000011;
44 => X"0003",

-- L0070@002D.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
45 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0071@002E.  data16 =  @ChkTxdRdy - $;
--  data16 = 1111111111111010;
46 => X"FFFA",

-- L0072@002F.Str2UOut:  INY, LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 010, r_s = 000;
47 => X"0" & O"1" & O"6" & O"2" & O"0",

-- L0073@0030.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
48 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0074@0031.  DEY, INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 011, r_s = 000;
49 => X"2" & O"0" & O"2" & O"3" & O"0",

-- L0075@0032.  data16 =  @Str2ULoop - $;
--  data16 = 1111111111110011;
50 => X"FFF3",

-- L0076@0033.Done:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
51 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0077@0034.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
52 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0035.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
53 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0036.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
54 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0037.  data16 =  0;
--  data16 = 0000000000000000;
55 => X"0000",

-- L0006@0038.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
56 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@0039.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
57 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@003A.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
58 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@003B.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@003C.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
60 => X"FFFE",

-- L0013@003D.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
61 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@003E.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
62 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@003F.  data16 =  -1;
--  data16 = 1111111111111111;
63 => X"FFFF",

-- L0016@0040.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
64 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0041.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
65 => X"FFF7",

-- L0021@0042.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
66 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0043.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
67 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0044.  data16 =  16;
--  data16 = 0000000000010000;
68 => X"0010",

-- L0024@0045.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
69 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0046.  data16 =  0;
--  data16 = 0000000000000000;
70 => X"0000",

-- L0027@0047.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
71 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0048.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
72 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@0049.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
73 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@004A.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
74 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@004B.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
75 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@004C.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
76 => X"0005",

-- L0033@004D.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
77 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@004E.  data16 =  0;
--  data16 = 0000000000000000;
78 => X"0000",

-- L0035@004F.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
79 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0050.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
80 => X"0005",

-- L0037@0051.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
81 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@0052.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0053.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
83 => X"FFE2",

-- L0040@0054.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
84 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0055.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
85 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0056.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
86 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0057.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
87 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@0058.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
88 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@0059.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
89 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@005A.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
90 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@005B.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@005C.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
92 => X"FFEB",

-- L0049@005D.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
93 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@005E.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
94 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@005F.Str2VGA:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
95 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0009@0060.  STY, M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
96 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0011@0061.Str2VGALoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
97 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0012@0062.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
98 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0013@0063.  data16 =  @Str2VGAExit - $;
--  data16 = 0000000010000101;
99 => X"0085",

-- L0014@0064.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
100 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0065.  data16 =  0xD;
--  data16 = 0000000000001101;
101 => X"000D",

-- L0016@0066.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
102 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@0067.  data16 =  @CarReturn - $;
--  data16 = 0000000001100001;
103 => X"0061",

-- L0019@0068.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
104 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0020@0069.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
105 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@006A.  data16 =  0xA;
--  data16 = 0000000000001010;
106 => X"000A",

-- L0022@006B.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
107 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@006C.  data16 =  @LineFeed - $;
--  data16 = 0000000001100011;
108 => X"0063",

-- L0025@006D.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
109 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0026@006E.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
110 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@006F.  data16 =  0x2;
--  data16 = 0000000000000010;
111 => X"0002",

-- L0028@0070.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
112 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@0071.  data16 =  @Cur2Home - $;
--  data16 = 0000000001110011;
113 => X"0073",

-- L0031@0072.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
114 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0032@0073.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
115 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0033@0074.  data16 =  0x1;
--  data16 = 0000000000000001;
116 => X"0001",

-- L0034@0075.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
117 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0035@0076.  data16 =  @ClrScreen - $;
--  data16 = 0000000001011110;
118 => X"005E",

-- L0038@0077.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
119 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0078.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
120 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0040@0079.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
121 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@007A.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111001;
122 => X"0079",

-- L0042@007B.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
123 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@007C.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@007D.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000000;
125 => X"0080",

-- L0045@007E.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
126 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0046@007F.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
127 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0047@0080.  data16 =  64;
--  data16 = 0000000001000000;
128 => X"0040",

-- L0048@0081.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0049@0082.  data16 =  @NextRow - $;
--  data16 = 0000000000000111;
130 => X"0007",

-- L0050@0083.NoScroll:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
131 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0051@0084.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
132 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@0085.  data16 =  @SetCursorXY - $;
--  data16 = 0000000001100101;
133 => X"0065",

-- L0054@0086.NextChar:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
134 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@0087.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
135 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0056@0088.  data16 =  @Str2VGALoop - $;
--  data16 = 1111111111011001;
136 => X"FFD9",

-- L0058@0089.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
137 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0059@008A.  data16 =  0;
--  data16 = 0000000000000000;
138 => X"0000",

-- L0060@008B.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
139 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@008C.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
140 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0062@008D.  data16 =  32;
--  data16 = 0000000000100000;
141 => X"0020",

-- L0063@008E.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0064@008F.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
143 => X"0003",

-- L0065@0090.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
144 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@0091.  data16 =  @NoScroll - $;
--  data16 = 1111111111110010;
145 => X"FFF2",

-- L0068@0092.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
146 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@0093.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
147 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@0094.  data16 =  0;
--  data16 = 0000000000000000;
148 => X"0000",

-- L0071@0095.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
149 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@0096.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
150 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0073@0097.  data16 =  0;
--  data16 = 0000000000000000;
151 => X"0000",

-- L0074@0098.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
152 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@0099.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
153 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0076@009A.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
154 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@009B.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
155 => X"0025",

-- L0078@009C.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
156 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0079@009D.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
157 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0080@009E.  data16 =  32;
--  data16 = 0000000000100000;
158 => X"0020",

-- L0081@009F.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
159 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0082@00A0.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
160 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0083@00A1.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
161 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0084@00A2.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
162 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0085@00A3.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
163 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0086@00A4.  data16 =  64;
--  data16 = 0000000001000000;
164 => X"0040",

-- L0087@00A5.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
165 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0088@00A6.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
166 => X"0003",

-- L0089@00A7.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
167 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00A8.  data16 =  @NxtCol;
--  data16 = 0000000010011000;
168 => X"0098",

-- L0091@00A9.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
169 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@00AA.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
170 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@00AB.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
171 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0094@00AC.  data16 =  32 - 1;
--  data16 = 0000000000011111;
172 => X"001F",

-- L0095@00AD.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0096@00AE.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
174 => X"0003",

-- L0097@00AF.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
175 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@00B0.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
176 => X"FFE5",

-- L0100@00B1.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
177 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0101@00B2.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00B3.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
179 => X"000D",

-- L0103@00B4.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
180 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0104@00B5.  data16 =  0;
--  data16 = 0000000000000000;
181 => X"0000",

-- L0105@00B6.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
182 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0106@00B7.  data16 =  ' ';
--  data16 = 0000000000100000;
183 => X"0020",

-- L0107@00B8.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
184 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00B9.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
185 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00BA.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
186 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00BB.  data16 =  64;
--  data16 = 0000000001000000;
187 => X"0040",

-- L0111@00BC.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00BD.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
189 => X"000A",

-- L0113@00BE.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@00BF.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
191 => X"FFF9",

-- L0117@00C0.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
192 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0118@00C1.  data16 =  64;
--  data16 = 0000000001000000;
193 => X"0040",

-- L0119@00C2.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
194 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0120@00C3.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
195 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00C4.  data16 =  @MulU - $;
--  data16 = 1111111101111110;
196 => X"FF7E",

-- L0122@00C5.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
197 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0123@00C6.  data16 =  0x1000;
--  data16 = 0001000000000000;
198 => X"1000",

-- L0124@00C7.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
199 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0126@00C8.CarReturn:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
200 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0127@00C9.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
201 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0128@00CA.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000101001;
202 => X"0029",

-- L0129@00CB.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
203 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0130@00CC.  data16 =  0;
--  data16 = 0000000000000000;
204 => X"0000",

-- L0131@00CD.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
205 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@00CE.  data16 =  @NoScroll - $;
--  data16 = 1111111110110101;
206 => X"FFB5",

-- L0134@00CF.LineFeed:  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
207 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@00D0.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
208 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@00D1.  data16 =  @GetCursorXY - $;
--  data16 = 0000000000100010;
209 => X"0022",

-- L0137@00D2.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
210 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00D3.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111000;
211 => X"FFB8",

-- L0140@00D4.ClrScreen:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
212 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0141@00D5.  data16 =  64;
--  data16 = 0000000001000000;
213 => X"0040",

-- L0142@00D6.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
214 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0143@00D7.  data16 =  32;
--  data16 = 0000000000100000;
215 => X"0020",

-- L0144@00D8.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
216 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0145@00D9.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@00DA.  data16 =  @MulU - $;
--  data16 = 1111111101101000;
218 => X"FF68",

-- L0147@00DB.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
219 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@00DC.  data16 =  0x1000;
--  data16 = 0001000000000000;
220 => X"1000",

-- L0149@00DD.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
221 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0150@00DE.  data16 =  ' ';
--  data16 = 0000000000100000;
222 => X"0020",

-- L0151@00DF.ClrPos:  DEY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
223 => X"0" & O"0" & O"0" & O"3" & O"0",

-- L0152@00E0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
224 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0153@00E1.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
225 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0154@00E2.  data16 =  @ClrPos - $;
--  data16 = 1111111111111101;
226 => X"FFFD",

-- L0155@00E3.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
227 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0156@00E4.Cur2Home:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
228 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0157@00E5.  data16 =  0;
--  data16 = 0000000000000000;
229 => X"0000",

-- L0158@00E6.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@00E7.  data16 =  @NoScroll - $;
--  data16 = 1111111110011100;
231 => X"FF9C",

-- L0161@00E8.Str2VGAExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
232 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0162@00E9.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
233 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0164@00EA.SetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
234 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0165@00EB.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
235 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@00EC.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
236 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0167@00ED.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
237 => X"FF00",

-- L0168@00EE.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
238 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0169@00EF.  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
239 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0170@00F0.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
240 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0171@00F1.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
241 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0172@00F2.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
242 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0174@00F3.GetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
243 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0175@00F4.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
244 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0176@00F5.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
245 => X"FF00",

-- L0177@00F6.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
246 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0178@00F7.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
247 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0179@00F8.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
248 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0180@00F9.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
249 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0181@00FA.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
250 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0182@00FB.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
251 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0183@00FC.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
252 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0185@00FD.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
253 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0186@00FE.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
254 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0187@00FF.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
255 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0188@0100.  data16 =  64;
--  data16 = 0000000001000000;
256 => X"0040",

-- L0189@0101.  r_p = P2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
257 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0190@0102.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
258 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0103.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
259 => X"FF3F",

-- L0192@0104.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
260 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0193@0105.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
261 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0194@0106.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
262 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0195@0107.  data16 =  0x1000;
--  data16 = 0001000000000000;
263 => X"1000",

-- L0196@0108.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
264 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0197@0109.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
265 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0199@010A.VGATest:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
266 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0200@010B.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
267 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0201@010C.  data16 =  0x1000;
--  data16 = 0001000000000000;
268 => X"1000",

-- L0202@010D.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
269 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0203@010E.  data16 =  0;
--  data16 = 0000000000000000;
270 => X"0000",

-- L0204@010F.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
271 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0205@0110.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
272 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0206@0111.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
273 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0207@0112.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
274 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0208@0113.  data16 =  64 * 32;
--  data16 = 0000100000000000;
275 => X"0800",

-- L0209@0114.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
276 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0210@0115.  data16 =  @Str2VGAExit - $;
--  data16 = 1111111111010011;
277 => X"FFD3",

-- L0211@0116.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
278 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0212@0117.  data16 =  @VGATLoop - $;
--  data16 = 1111111111111000;
279 => X"FFF8",

-- L0215@0118.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
280 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0216@0119.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
281 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0217@011A.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
282 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0218@011B.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
283 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0219@011C.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
284 => X"0002",

-- L0220@011D.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
285 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0221@011E.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
286 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0222@011F.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
287 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0223@0120.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
288 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0224@0121.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
289 => X"0002",

-- L0225@0122.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
290 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0226@0123.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
291 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0227@0124.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
292 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0228@0125.  data16 =  0;
--  data16 = 0000000000000000;
293 => X"0000",

-- L0229@0126.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
294 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0230@0127.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
295 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0231@0128.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
296 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0232@0129.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
297 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0233@012A.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
298 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 213 location(s) in following ranges will be filled with default value
-- 012B .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

