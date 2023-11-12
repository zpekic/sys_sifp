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

-- L0023@0003 00A2.  data16 =  @VGA_Init - $;
--  data16 = 0000000010100010;
3 => X"00A2",

-- L0025@0004 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0026@0005 0029.  data16 =  @StrHWorld;
--  data16 = 0000000000101001;
5 => X"0029",

-- L0027@0006 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
6 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0028@0007 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
7 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@0008 014F.  data16 =  @VGA_OutStr - $;
--  data16 = 0000000101001111;
8 => X"014F",

-- L0031@0009 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
9 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0032@000A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@000B 006A.  data16 =  @UART_Init - $;
--  data16 = 0000000001101010;
11 => X"006A",

-- L0035@000C 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
12 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0036@000D 0029.  data16 =  @StrHWorld;
--  data16 = 0000000000101001;
13 => X"0029",

-- L0037@000E 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
14 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0038@000F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
15 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0010 008C.  data16 =  @UART_OutStr - $;
--  data16 = 0000000010001100;
16 => X"008C",

-- L0041@0011 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
17 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0043@0012 5003.EchoLoop:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
18 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0044@0013 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
19 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0014 006A.  data16 =  @UART_GetChr - $;
--  data16 = 0000000001101010;
20 => X"006A",

-- L0046@0015 0E03.EchoOut:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
21 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0047@0016 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
22 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0048@0017 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
23 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0049@0018 0075.  data16 =  @UART_OutChr - $;
--  data16 = 0000000001110101;
24 => X"0075",

-- L0050@0019 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
25 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0051@001A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
26 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@001B 00A1.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010100001;
27 => X"00A1",

-- L0053@001C 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
28 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0054@001D 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
29 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0055@001E 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
30 => X"000D",

-- L0056@001F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0057@0020 0003.  data16 =  @EchoLF - $;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0058@0021 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0059@0022 0012.  data16 =  @EchoLoop;
--  data16 = 0000000000010010;
34 => X"0012",

-- L0060@0023 7200.EchoLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
35 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0061@0024 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
36 => X"000A",

-- L0062@0025 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
37 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0063@0026 0015.  data16 =  @EchoOut;
--  data16 = 0000000000010101;
38 => X"0015",

-- L0065@0027 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
39 => X"0001",

-- L0066@0028 0000.  data16 =  0;
--  data16 = 0000000000000000;
40 => X"0000",

-- L0068@0029 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
41 => X"0048",

-- L0069@002A 0065.  data16 =  'e';
--  data16 = 0000000001100101;
42 => X"0065",

-- L0070@002B 006C.  data16 =  'l';
--  data16 = 0000000001101100;
43 => X"006C",

-- L0071@002C 006C.  data16 =  'l';
--  data16 = 0000000001101100;
44 => X"006C",

-- L0072@002D 006F.  data16 =  'o';
--  data16 = 0000000001101111;
45 => X"006F",

-- L0073@002E 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
46 => X"0020",

-- L0074@002F 0057.  data16 =  'W';
--  data16 = 0000000001010111;
47 => X"0057",

-- L0075@0030 006F.  data16 =  'o';
--  data16 = 0000000001101111;
48 => X"006F",

-- L0076@0031 0072.  data16 =  'r';
--  data16 = 0000000001110010;
49 => X"0072",

-- L0077@0032 006C.  data16 =  'l';
--  data16 = 0000000001101100;
50 => X"006C",

-- L0078@0033 0064.  data16 =  'd';
--  data16 = 0000000001100100;
51 => X"0064",

-- L0079@0034 0021.  data16 =  '!';
--  data16 = 0000000000100001;
52 => X"0021",

-- L0080@0035 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
53 => X"000D",

-- L0081@0036 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
54 => X"000A",

-- L0082@0037 0000.  data16 =  0;
--  data16 = 0000000000000000;
55 => X"0000",

-- L0003@0038 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
56 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0039 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
57 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@003A 0000.  data16 =  0;
--  data16 = 0000000000000000;
58 => X"0000",

-- L0006@003B 0600.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
59 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@003C 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
60 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@003D 1002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
61 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@003E 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
62 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@003F FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
63 => X"FFFE",

-- L0013@0040 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
64 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0041 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
65 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@0042 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
66 => X"FFFF",

-- L0016@0043 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
67 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0044 FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
68 => X"FFF7",

-- L0021@0045 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
69 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0046 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
70 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0047 0010.  data16 =  16;
--  data16 = 0000000000010000;
71 => X"0010",

-- L0024@0048 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
72 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0049 0000.  data16 =  0;
--  data16 = 0000000000000000;
73 => X"0000",

-- L0027@004A 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
74 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@004B 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
75 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@004C 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
76 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@004D 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
77 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@004E 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@004F 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
79 => X"0005",

-- L0033@0050 7A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
80 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@0051 0000.  data16 =  0;
--  data16 = 0000000000000000;
81 => X"0000",

-- L0035@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0053 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
83 => X"0005",

-- L0037@0054 5003.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
84 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0038@0055 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
85 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0056 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
86 => X"FFE2",

-- L0040@0057 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
87 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0058 0800.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
88 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0059 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
89 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@005A 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
90 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@005B 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
91 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@005C 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
92 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@005D 02C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
93 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@005E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@005F FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
95 => X"FFEB",

-- L0049@0060 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
96 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@0061 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
97 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0053@0062 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
98 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0054@0063 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
99 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0055@0064 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
100 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0056@0065 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
101 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0057@0066 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
102 => X"0002",

-- L0058@0067 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
103 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0059@0068 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
104 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@0069 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
105 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0061@006A D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
106 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0062@006B 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
107 => X"0002",

-- L0063@006C 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
108 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0064@006D 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
109 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0065@006E 7320.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
110 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0066@006F 0000.  data16 =  0;
--  data16 = 0000000000000000;
111 => X"0000",

-- L0067@0070 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
112 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0068@0071 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
113 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0069@0072 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
114 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0070@0073 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
115 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0071@0074 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
116 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0002@0075 7020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
117 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0003@0076 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
118 => X"E000",

-- L0004@0077 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
119 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0078 0003.  data16 =  3;
--  data16 = 0000000000000011;
120 => X"0003",

-- L0006@0079 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
121 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@007A 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
122 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0008@007B 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
123 => X"0010",

-- L0009@007C 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
124 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@007D 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
125 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0012@007E 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
126 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@007F 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
127 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0014@0080 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
128 => X"E000",

-- L0015@0081 0230.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
129 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0016@0082 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
130 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0017@0083 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0018@0084 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
132 => X"0003",

-- L0019@0085 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
133 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@0086 FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
134 => X"FFFB",

-- L0021@0087 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
135 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0022@0088 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
136 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0023@0089 7C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0111, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
137 => X"7" & O"6" & O"0" & O"0" & O"0",

-- L0024@008A 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
138 => X"00FF",

-- L0025@008B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
139 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0026@008C 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
140 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0028@008D 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
141 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0029@008E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
142 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0030@008F 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
143 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0031@0090 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
144 => X"E000",

-- L0032@0091 0230.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
145 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0033@0092 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
146 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0034@0093 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
147 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0035@0094 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0036@0095 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
149 => X"0003",

-- L0037@0096 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@0097 FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
151 => X"FFFA",

-- L0039@0098 0212.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
152 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0040@0099 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
153 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0041@009A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
154 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0042@009B 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
155 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0044@009C 0380.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
156 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0045@009D 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
157 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0046@009E 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
158 => X"0006",

-- L0047@009F 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
159 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0048@00A0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
160 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0049@00A1 FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
161 => X"FFEC",

-- L0050@00A2 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
162 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0051@00A3 FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
163 => X"FFF9",

-- L0052@00A4 1002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
164 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@00A5 5003.VGA_Init:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
165 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0009@00A6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
166 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@00A7 FF91.  data16 =  @CLC - $;
--  data16 = 1111111110010001;
167 => X"FF91",

-- L0011@00A8 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
168 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0012@00A9 0040.  data16 =  64;
--  data16 = 0000000001000000;
169 => X"0040",

-- L0013@00AA 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
170 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00AB 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
171 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@00AC 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
172 => X"1000",

-- L0016@00AD 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
173 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0017@00AE 0020.  data16 =  32;
--  data16 = 0000000000100000;
174 => X"0020",

-- L0018@00AF 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
175 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0019@00B0 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
176 => X"FF00",

-- L0020@00B1 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
177 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0021@00B2 0230.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
178 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0022@00B3 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
179 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0023@00B4 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
180 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0024@00B5 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
181 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0025@00B6 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
182 => X"0003",

-- L0026@00B7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0027@00B8 FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
184 => X"FFFA",

-- L0028@00B9 0202.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
185 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0029@00BA 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
186 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0030@00BB 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
187 => X"0002",

-- L0036@00BC 0E03.VGA_OutChr:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
188 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0038@00BD 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
189 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0039@00BE 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
190 => X"0002",

-- L0040@00BF 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
191 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0041@00C0 0082.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010000010;
192 => X"0082",

-- L0043@00C1 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
193 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0044@00C2 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
194 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0045@00C3 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
195 => X"0001",

-- L0046@00C4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
196 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0047@00C5 0062.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001100010;
197 => X"0062",

-- L0049@00C6 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
198 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0050@00C7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
199 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@00C8 007F.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111111;
200 => X"007F",

-- L0053@00C9 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
201 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0054@00CA 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
202 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0055@00CB 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
203 => X"000D",

-- L0056@00CC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
204 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0057@00CD 004B.  data16 =  @VGA_CR - $;
--  data16 = 0000000001001011;
205 => X"004B",

-- L0059@00CE 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
206 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0060@00CF 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
207 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0061@00D0 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
208 => X"000A",

-- L0062@00D1 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
209 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0063@00D2 0052.  data16 =  @VGA_LF - $;
--  data16 = 0000000001010010;
210 => X"0052",

-- L0066@00D3 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
211 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0068@00D4 5FFF.DisplayAt:  r_p = P2,  r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0101, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
212 => X"5" & O"7" & O"7" & O"7" & O"7",

-- L0069@00D5 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
213 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0070@00D6 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
214 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0071@00D7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
215 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0072@00D8 0078.  data16 =  @GetRowBase - $;
--  data16 = 0000000001111000;
216 => X"0078",

-- L0073@00D9 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
217 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0074@00DA 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
218 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0075@00DB 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
219 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0076@00DC 0040.  data16 =  64;
--  data16 = 0000000001000000;
220 => X"0040",

-- L0077@00DD A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
221 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0078@00DE 0003.  data16 =  @NextRow - $;
--  data16 = 0000000000000011;
222 => X"0003",

-- L0079@00DF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
223 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0080@00E0 003B.  data16 =  @SetCursorXY - $;
--  data16 = 0000000000111011;
224 => X"003B",

-- L0082@00E1 7100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
225 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0083@00E2 0000.  data16 =  0;
--  data16 = 0000000000000000;
226 => X"0000",

-- L0084@00E3 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
227 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0085@00E4 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
228 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0086@00E5 0020.  data16 =  32;
--  data16 = 0000000000100000;
229 => X"0020",

-- L0087@00E6 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0088@00E7 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
231 => X"0003",

-- L0089@00E8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
232 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00E9 0032.  data16 =  @SetCursorXY - $;
--  data16 = 0000000000110010;
233 => X"0032",

-- L0092@00EA 0000.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
234 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0093@00EB 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
235 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0094@00EC 0000.  data16 =  0;
--  data16 = 0000000000000000;
236 => X"0000",

-- L0095@00ED 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
237 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0096@00EE 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
238 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0097@00EF 0000.  data16 =  0;
--  data16 = 0000000000000000;
239 => X"0000",

-- L0098@00F0 01C3.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
240 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0099@00F1 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
241 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0100@00F2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
242 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0101@00F3 005D.  data16 =  @GetRowBase - $;
--  data16 = 0000000001011101;
243 => X"005D",

-- L0102@00F4 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
244 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0103@00F5 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
245 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0104@00F6 0020.  data16 =  32;
--  data16 = 0000000000100000;
246 => X"0020",

-- L0105@00F7 03B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
247 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0106@00F8 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
248 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0107@00F9 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
249 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00FA 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
250 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00FB 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
251 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00FC 0040.  data16 =  64;
--  data16 = 0000000001000000;
252 => X"0040",

-- L0111@00FD A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
253 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00FE 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
254 => X"0003",

-- L0113@00FF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
255 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@0100 00F0.  data16 =  @NxtCol;
--  data16 = 0000000011110000;
256 => X"00F0",

-- L0115@0101 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
257 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0116@0102 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
258 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0117@0103 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
259 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0118@0104 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
260 => X"001F",

-- L0119@0105 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
261 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0120@0106 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
262 => X"0003",

-- L0121@0107 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
263 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0122@0108 FFE5.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
264 => X"FFE5",

-- L0124@0109 5003.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
265 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0125@010A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
266 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0126@010B 0045.  data16 =  @GetRowBase - $;
--  data16 = 0000000001000101;
267 => X"0045",

-- L0127@010C 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
268 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0128@010D 0000.  data16 =  0;
--  data16 = 0000000000000000;
269 => X"0000",

-- L0129@010E 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
270 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0130@010F 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
271 => X"0020",

-- L0131@0110 0FB0.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
272 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0132@0111 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
273 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0133@0112 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
274 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0134@0113 0040.  data16 =  64;
--  data16 = 0000000001000000;
275 => X"0040",

-- L0135@0114 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
276 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0136@0115 004A.  data16 =  @VGA_Done - $;
--  data16 = 0000000001001010;
277 => X"004A",

-- L0137@0116 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
278 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@0117 FFF9.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
279 => X"FFF9",

-- L0140@0118 0202.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
280 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0141@0119 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
281 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0142@011A 0000.  data16 =  0;
--  data16 = 0000000000000000;
282 => X"0000",

-- L0143@011B 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
283 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0144@011C 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
284 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0145@011D FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
285 => X"FF3E",

-- L0146@011E 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
286 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0147@011F 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
287 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@0120 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
288 => X"FF3F",

-- L0149@0121 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
289 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0150@0122 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
290 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0151@0123 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
291 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0153@0124 0202.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
292 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0154@0125 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
293 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0155@0126 FFBD.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111101;
294 => X"FFBD",

-- L0157@0127 0202.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
295 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0158@0128 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
296 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0159@0129 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
297 => X"0020",

-- L0160@012A 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
298 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0161@012B 0000.  data16 =  0;
--  data16 = 0000000000000000;
299 => X"0000",

-- L0162@012C 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
300 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0163@012D 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
301 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0164@012E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
302 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@012F 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
303 => X"0009",

-- L0166@0130 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
304 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0167@0131 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
305 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0168@0132 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
306 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0169@0133 0020.  data16 =  32;
--  data16 = 0000000000100000;
307 => X"0020",

-- L0170@0134 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
308 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0171@0135 000D.  data16 =  @VGA_HOME - $;
--  data16 = 0000000000001101;
309 => X"000D",

-- L0172@0136 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
310 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0173@0137 FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
311 => X"FFF5",

-- L0175@0138 5003.ClearRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
312 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0176@0139 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
313 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0177@013A 0016.  data16 =  @GetRowBase - $;
--  data16 = 0000000000010110;
314 => X"0016",

-- L0178@013B 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
315 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0179@013C 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
316 => X"003F",

-- L0180@013D 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
317 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0181@013E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0182@013F 0020.  data16 =  @VGA_Done - $;
--  data16 = 0000000000100000;
319 => X"0020",

-- L0183@0140 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
320 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0184@0141 FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
321 => X"FFFC",

-- L0186@0142 0202.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
322 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0187@0143 7120.  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
323 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0188@0144 0000.  data16 =  0;
--  data16 = 0000000000000000;
324 => X"0000",

-- L0189@0145 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
325 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0190@0146 FFD5.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111010101;
326 => X"FFD5",

-- L0192@0147 7020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
327 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0193@0148 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
328 => X"FF3E",

-- L0194@0149 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
329 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0195@014A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
330 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0196@014B 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
331 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0197@014C FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
332 => X"FF3F",

-- L0198@014D 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
333 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0199@014E 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
334 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0200@014F 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
335 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0202@0150 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
336 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0203@0151 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
337 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0204@0152 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
338 => X"FF00",

-- L0205@0153 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
339 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0206@0154 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
340 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0207@0155 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
341 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0208@0156 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
342 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0210@0157 0380.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
343 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0211@0158 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
344 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0212@0159 0006.  data16 =  @VGA_Done - $;
--  data16 = 0000000000000110;
345 => X"0006",

-- L0213@015A 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
346 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0214@015B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
347 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0215@015C FF60.  data16 =  @VGA_OutChr - $;
--  data16 = 1111111101100000;
348 => X"FF60",

-- L0216@015D 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
349 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0217@015E FFF9.  data16 =  @VGA_OutStr - $;
--  data16 = 1111111111111001;
350 => X"FFF9",

-- L0218@015F 1002.VGA_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
351 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0220@0160 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
352 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0221@0161 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
353 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0222@0162 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
354 => X"1000",

-- L0223@0163 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
355 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0224@0164 0000.  data16 =  0;
--  data16 = 0000000000000000;
356 => X"0000",

-- L0225@0165 03C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
357 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0226@0166 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
358 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0227@0167 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
359 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0228@0168 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
360 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0229@0169 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
361 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0230@016A 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
362 => X"0800",

-- L0231@016B A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
363 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0232@016C 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
364 => X"0003",

-- L0233@016D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
365 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0234@016E FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
366 => X"FFF7",

-- L0235@016F 0202.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
367 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0236@0170 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
368 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 143 location(s) in following ranges will be filled with default value
-- 0171 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

