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
-- L0011.r_p: .valfield 4 values NOP, M[IMM], BRANCH|IF_TRUE, JUMP|GOTO, LDP, STP4, STP2, STP, BAC|IF_AC|IF_A_GE, BAZ|IF_AZ|IF_A_EQ, BXC|IF_XC|IF_X_GE, BXZ|IF_XZ|IF_X_EQ, BYC|IF_YC|IF_Y_GE, BYZ|IF_YZ|IF_Y_EQ, BSC|IF_SC|IF_S_GE, BSZ|IF_SZ|IF_S_EQ default NOP;
--
alias cpu_r_p: 	std_logic_vector(3 downto 0) is cpu_uinstruction(15 downto 12);
constant r_p_NOP: 	std_logic_vector(3 downto 0) := X"0";
constant r_p_M_IMM: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_BRANCH: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_IF_TRUE: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_JUMP: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_GOTO: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_LDP: 	std_logic_vector(3 downto 0) := X"4";
constant r_p_STP4: 	std_logic_vector(3 downto 0) := X"5";
constant r_p_STP2: 	std_logic_vector(3 downto 0) := X"6";
constant r_p_STP: 	std_logic_vector(3 downto 0) := X"7";
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
--      M[IMM] when r_p_M[IMM],
--      BRANCH when r_p_BRANCH,
--      BRANCH when r_p_IF_TRUE,
--      JUMP when r_p_JUMP,
--      JUMP when r_p_GOTO,
--      LDP when r_p_LDP,
--      STP4 when r_p_STP4,
--      STP2 when r_p_STP2,
--      STP when r_p_STP,
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
-- L0031.r_a: .valfield 3 values NOA, XOR, SLC, SRC, LDA, ADC, AND, STA|A default NOA;
--
alias cpu_r_a: 	std_logic_vector(2 downto 0) is cpu_uinstruction(11 downto 9);
constant r_a_NOA: 	std_logic_vector(2 downto 0) := O"0";
constant r_a_XOR: 	std_logic_vector(2 downto 0) := O"1";
constant r_a_SLC: 	std_logic_vector(2 downto 0) := O"2";
constant r_a_SRC: 	std_logic_vector(2 downto 0) := O"3";
constant r_a_LDA: 	std_logic_vector(2 downto 0) := O"4";
constant r_a_ADC: 	std_logic_vector(2 downto 0) := O"5";
constant r_a_AND: 	std_logic_vector(2 downto 0) := O"6";
constant r_a_STA: 	std_logic_vector(2 downto 0) := O"7";
constant r_a_A: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_a select r_a <=
--      NOA when r_a_NOA, -- default value
--      XOR when r_a_XOR,
--      SLC when r_a_SLC,
--      SRC when r_a_SRC,
--      LDA when r_a_LDA,
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

-- L0021@0001 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0022@0002 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@0003 00A4.  data16 =  @VGA_Init - $;
--  data16 = 0000000010100100;
3 => X"00A4",

-- L0025@0004 1100.Loop:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0026@0005 002B.  data16 =  @StrHWorld;
--  data16 = 0000000000101011;
5 => X"002B",

-- L0027@0006 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
6 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0028@0007 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
7 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@0008 014F.  data16 =  @VGA_OutStr - $;
--  data16 = 0000000101001111;
8 => X"014F",

-- L0030@0009 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
9 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0031@000A 0004.  data16 =  @Loop;
--  data16 = 0000000000000100;
10 => X"0004",

-- L0033@000B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
11 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@000C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
12 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@000D 006A.  data16 =  @UART_Init - $;
--  data16 = 0000000001101010;
13 => X"006A",

-- L0037@000E 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
14 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0038@000F 002B.  data16 =  @StrHWorld;
--  data16 = 0000000000101011;
15 => X"002B",

-- L0039@0010 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
16 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0040@0011 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
17 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@0012 008C.  data16 =  @UART_OutStr - $;
--  data16 = 0000000010001100;
18 => X"008C",

-- L0043@0013 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
19 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0045@0014 6003.EchoLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
20 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0046@0015 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
21 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0047@0016 006A.  data16 =  @UART_GetChr - $;
--  data16 = 0000000001101010;
22 => X"006A",

-- L0048@0017 0E03.EchoOut:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
23 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0049@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0050@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@001A 0075.  data16 =  @UART_OutChr - $;
--  data16 = 0000000001110101;
26 => X"0075",

-- L0052@001B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
27 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0053@001C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
28 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0054@001D 00A1.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010100001;
29 => X"00A1",

-- L0055@001E 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
30 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0056@001F 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
31 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0057@0020 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
32 => X"000D",

-- L0058@0021 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0059@0022 0003.  data16 =  @EchoLF - $;
--  data16 = 0000000000000011;
34 => X"0003",

-- L0060@0023 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
35 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0061@0024 0014.  data16 =  @EchoLoop;
--  data16 = 0000000000010100;
36 => X"0014",

-- L0062@0025 1800.EchoLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
37 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0063@0026 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
38 => X"000A",

-- L0064@0027 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
39 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0065@0028 0017.  data16 =  @EchoOut;
--  data16 = 0000000000010111;
40 => X"0017",

-- L0067@0029 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
41 => X"0001",

-- L0068@002A 0000.  data16 =  0;
--  data16 = 0000000000000000;
42 => X"0000",

-- L0070@002B 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
43 => X"0048",

-- L0071@002C 0065.  data16 =  'e';
--  data16 = 0000000001100101;
44 => X"0065",

-- L0072@002D 006C.  data16 =  'l';
--  data16 = 0000000001101100;
45 => X"006C",

-- L0073@002E 006C.  data16 =  'l';
--  data16 = 0000000001101100;
46 => X"006C",

-- L0074@002F 006F.  data16 =  'o';
--  data16 = 0000000001101111;
47 => X"006F",

-- L0075@0030 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
48 => X"0020",

-- L0076@0031 0057.  data16 =  'W';
--  data16 = 0000000001010111;
49 => X"0057",

-- L0077@0032 006F.  data16 =  'o';
--  data16 = 0000000001101111;
50 => X"006F",

-- L0078@0033 0072.  data16 =  'r';
--  data16 = 0000000001110010;
51 => X"0072",

-- L0079@0034 006C.  data16 =  'l';
--  data16 = 0000000001101100;
52 => X"006C",

-- L0080@0035 0064.  data16 =  'd';
--  data16 = 0000000001100100;
53 => X"0064",

-- L0081@0036 0021.  data16 =  '!';
--  data16 = 0000000000100001;
54 => X"0021",

-- L0082@0037 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
55 => X"000D",

-- L0083@0038 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
56 => X"000A",

-- L0084@0039 0000.  data16 =  0;
--  data16 = 0000000000000000;
57 => X"0000",

-- L0003@003A 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
58 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@003B 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
59 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@003C 0000.  data16 =  0;
--  data16 = 0000000000000000;
60 => X"0000",

-- L0006@003D 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
61 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@003E 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
62 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@003F 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
63 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@0040 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
64 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@0041 FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
65 => X"FFFE",

-- L0013@0042 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
66 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0043 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
67 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@0044 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
68 => X"FFFF",

-- L0016@0045 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
69 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0046 FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
70 => X"FFF7",

-- L0021@0047 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
71 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0048 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
72 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0023@0049 0010.  data16 =  16;
--  data16 = 0000000000010000;
73 => X"0010",

-- L0024@004A 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0025@004B 0000.  data16 =  0;
--  data16 = 0000000000000000;
75 => X"0000",

-- L0027@004C 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
76 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@004D 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
77 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0029@004E 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
78 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0030@004F 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
79 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@0050 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
80 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@0051 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
81 => X"0005",

-- L0033@0052 1A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
82 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0034@0053 0000.  data16 =  0;
--  data16 = 0000000000000000;
83 => X"0000",

-- L0035@0054 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
84 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0055 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
85 => X"0005",

-- L0037@0056 6003.Y01:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
86 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0038@0057 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
87 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0058 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
88 => X"FFE2",

-- L0040@0059 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
89 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@005A 0600.Nextbit:  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
90 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0042@005B 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
91 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@005C 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
92 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0044@005D 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
93 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0045@005E 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
94 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@005F 08C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 011, r_y = 000, r_s = 010;
95 => X"0" & O"4" & O"3" & O"0" & O"2",

-- L0047@0060 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
96 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@0061 FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
97 => X"FFEB",

-- L0049@0062 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
98 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@0063 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
99 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0053@0064 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
100 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0054@0065 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
101 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0055@0066 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
102 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0056@0067 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
103 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0057@0068 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
104 => X"0002",

-- L0058@0069 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
105 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0059@006A 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
106 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@006B 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
107 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0061@006C D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
108 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0062@006D 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
109 => X"0002",

-- L0063@006E 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
110 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0064@006F 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
111 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0065@0070 1920.  LDA, LDY, LDX, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 100, r_s = 000;
112 => X"1" & O"4" & O"4" & O"4" & O"0",

-- L0066@0071 0000.  data16 =  0;
--  data16 = 0000000000000000;
113 => X"0000",

-- L0067@0072 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
114 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0068@0073 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
115 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0069@0074 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
116 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0070@0075 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
117 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0071@0076 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
118 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0077 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
119 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0078 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
120 => X"E000",

-- L0004@0079 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
121 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@007A 0003.  data16 =  3;
--  data16 = 0000000000000011;
122 => X"0003",

-- L0006@007B 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
123 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@007C 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
124 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@007D 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
125 => X"0010",

-- L0009@007E 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
126 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@007F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
127 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@0080 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
128 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@0081 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
129 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0014@0082 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
130 => X"E000",

-- L0015@0083 0830.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
131 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0016@0084 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
132 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0017@0085 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
133 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0018@0086 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
134 => X"0003",

-- L0019@0087 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
135 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@0088 FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
136 => X"FFFB",

-- L0021@0089 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
137 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0022@008A 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
138 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0023@008B 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
139 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0024@008C 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
140 => X"00FF",

-- L0025@008D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
141 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0026@008E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
142 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@008F 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
143 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0029@0090 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
144 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0030@0091 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
145 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0031@0092 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
146 => X"E000",

-- L0032@0093 0830.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
147 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0033@0094 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
148 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0034@0095 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
149 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0035@0096 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0036@0097 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
151 => X"0003",

-- L0037@0098 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
152 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@0099 FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
153 => X"FFFA",

-- L0039@009A 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
154 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0040@009B 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
155 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0041@009C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
156 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0042@009D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
157 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0044@009E 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
158 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0045@009F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0046@00A0 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
160 => X"0006",

-- L0047@00A1 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
161 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0048@00A2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
162 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0049@00A3 FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
163 => X"FFEC",

-- L0050@00A4 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
164 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0051@00A5 FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
165 => X"FFF9",

-- L0052@00A6 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
166 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0008@00A7 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
167 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0009@00A8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@00A9 FF91.  data16 =  @CLC - $;
--  data16 = 1111111110010001;
169 => X"FF91",

-- L0011@00AA 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
170 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0012@00AB 0040.  data16 =  64;
--  data16 = 0000000001000000;
171 => X"0040",

-- L0013@00AC 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
172 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00AD 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
173 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@00AE 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
174 => X"1000",

-- L0016@00AF 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
175 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0017@00B0 0020.  data16 =  32;
--  data16 = 0000000000100000;
176 => X"0020",

-- L0018@00B1 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
177 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0019@00B2 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
178 => X"FF00",

-- L0020@00B3 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
179 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0021@00B4 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
180 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0022@00B5 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
181 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0023@00B6 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
182 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0024@00B7 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0025@00B8 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
184 => X"0003",

-- L0026@00B9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
185 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0027@00BA FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
186 => X"FFFA",

-- L0028@00BB 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
187 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0029@00BC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
188 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0030@00BD 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
189 => X"0002",

-- L0036@00BE 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
190 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0037@00BF 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
191 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0038@00C0 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
192 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0040@00C1 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
193 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0041@00C2 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
194 => X"0002",

-- L0042@00C3 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
195 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0043@00C4 007E.  data16 =  @VGA_HOME - $;
--  data16 = 0000000001111110;
196 => X"007E",

-- L0045@00C5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
197 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0046@00C6 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
198 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0047@00C7 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
199 => X"0001",

-- L0048@00C8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
200 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0049@00C9 005D.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001011101;
201 => X"005D",

-- L0051@00CA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
202 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0052@00CB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
203 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0053@00CC 007B.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111011;
204 => X"007B",

-- L0055@00CD 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
205 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0056@00CE 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
206 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0057@00CF 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
207 => X"000D",

-- L0058@00D0 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
208 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0059@00D1 004D.  data16 =  @VGA_CR - $;
--  data16 = 0000000001001101;
209 => X"004D",

-- L0061@00D2 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
210 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0062@00D3 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
211 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0063@00D4 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
212 => X"000A",

-- L0064@00D5 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
213 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0065@00D6 004D.  data16 =  @VGA_LF - $;
--  data16 = 0000000001001101;
214 => X"004D",

-- L0068@00D7 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
215 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0070@00D8 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
216 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0071@00D9 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
217 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@00DA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
218 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0073@00DB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
219 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0074@00DC 0074.  data16 =  @GetRowBase - $;
--  data16 = 0000000001110100;
220 => X"0074",

-- L0075@00DD 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
221 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0076@00DE 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
222 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0077@00DF 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
223 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0078@00E0 0040.  data16 =  64;
--  data16 = 0000000001000000;
224 => X"0040",

-- L0079@00E1 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
225 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0080@00E2 000C.  data16 =  @NextRow - $;
--  data16 = 0000000000001100;
226 => X"000C",

-- L0081@00E3 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
227 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0082@00E4 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
228 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0083@00E5 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
229 => X"FF3E",

-- L0084@00E6 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
230 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0085@00E7 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
231 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0086@00E8 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
232 => X"FF3F",

-- L0087@00E9 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
233 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0088@00EA 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
234 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0090@00EB 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
235 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0091@00EC 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
236 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0092@00ED 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
237 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0094@00EE 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
238 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0095@00EF 0000.  data16 =  0;
--  data16 = 0000000000000000;
239 => X"0000",

-- L0096@00F0 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
240 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0097@00F1 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
241 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0098@00F2 0020.  data16 =  32;
--  data16 = 0000000000100000;
242 => X"0020",

-- L0099@00F3 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
243 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0100@00F4 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
244 => X"0003",

-- L0101@00F5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
245 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00F6 FFED.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111101101;
246 => X"FFED",

-- L0104@00F7 0000.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
247 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0105@00F8 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
248 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0106@00F9 0000.  data16 =  0;
--  data16 = 0000000000000000;
249 => X"0000",

-- L0107@00FA 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
250 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0108@00FB 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
251 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0109@00FC 0000.  data16 =  0;
--  data16 = 0000000000000000;
252 => X"0000",

-- L0110@00FD 6003.NxtCol:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
253 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0111@00FE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
254 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0112@00FF 0051.  data16 =  @GetRowBase - $;
--  data16 = 0000000001010001;
255 => X"0051",

-- L0113@0100 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
256 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0114@0101 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
257 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0115@0102 0040.  data16 =  64;
--  data16 = 0000000001000000;
258 => X"0040",

-- L0116@0103 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
259 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0117@0104 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
260 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0118@0105 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
261 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0119@0106 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
262 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0120@0107 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
263 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0121@0108 0040.  data16 =  64;
--  data16 = 0000000001000000;
264 => X"0040",

-- L0122@0109 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
265 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0123@010A 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
266 => X"0003",

-- L0124@010B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
267 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0125@010C 00FD.  data16 =  @NxtCol;
--  data16 = 0000000011111101;
268 => X"00FD",

-- L0126@010D 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
269 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0127@010E 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
270 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0128@010F 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
271 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0129@0110 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
272 => X"001F",

-- L0130@0111 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
273 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0131@0112 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
274 => X"0003",

-- L0132@0113 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
275 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0133@0114 FFE6.  data16 =  @NxtRow - $;
--  data16 = 1111111111100110;
276 => X"FFE6",

-- L0135@0115 1020.ClrLastRow:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
277 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0136@0116 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
278 => X"001F",

-- L0137@0117 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
279 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0138@0118 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
280 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0139@0119 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
281 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0140@011A 001D.  data16 =  @ClearRow - $;
--  data16 = 0000000000011101;
282 => X"001D",

-- L0141@011B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
283 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0142@011C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
284 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0143@011D 0002.  data16 =  @SetX0 - $;
--  data16 = 0000000000000010;
285 => X"0002",

-- L0145@011E 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
286 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0146@011F 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
287 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0147@0120 0000.  data16 =  0;
--  data16 = 0000000000000000;
288 => X"0000",

-- L0148@0121 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
289 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0149@0122 FFC1.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111000001;
290 => X"FFC1",

-- L0151@0123 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
291 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0152@0124 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
292 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0153@0125 FFCB.  data16 =  @NextRow1 - $;
--  data16 = 1111111111001011;
293 => X"FFCB",

-- L0155@0126 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
294 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0156@0127 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
295 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0157@0128 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
296 => X"0020",

-- L0158@0129 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
297 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0159@012A 0000.  data16 =  0;
--  data16 = 0000000000000000;
298 => X"0000",

-- L0160@012B 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
299 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0161@012C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
300 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0162@012D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
301 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0163@012E 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
302 => X"0009",

-- L0164@012F 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
303 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0165@0130 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
304 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0166@0131 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
305 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0167@0132 0020.  data16 =  32;
--  data16 = 0000000000100000;
306 => X"0020",

-- L0168@0133 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
307 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0169@0134 000E.  data16 =  @VGA_HOME - $;
--  data16 = 0000000000001110;
308 => X"000E",

-- L0170@0135 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
309 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0171@0136 FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
310 => X"FFF5",

-- L0173@0137 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
311 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0174@0138 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
312 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0175@0139 0017.  data16 =  @GetRowBase - $;
--  data16 = 0000000000010111;
313 => X"0017",

-- L0176@013A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
314 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0177@013B 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
315 => X"003F",

-- L0178@013C 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
316 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0179@013D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
317 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0180@013E 0003.  data16 =  @ClrDone - $;
--  data16 = 0000000000000011;
318 => X"0003",

-- L0181@013F 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
319 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0182@0140 FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
320 => X"FFFC",

-- L0183@0141 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
321 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0185@0142 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
322 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0186@0143 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
323 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0187@0144 0000.  data16 =  0;
--  data16 = 0000000000000000;
324 => X"0000",

-- L0188@0145 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
325 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0189@0146 FF9D.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110011101;
326 => X"FF9D",

-- L0191@0147 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
327 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0192@0148 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
328 => X"FF3E",

-- L0193@0149 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
329 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0194@014A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
330 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0195@014B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
331 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0196@014C FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
332 => X"FF3F",

-- L0197@014D 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
333 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0198@014E 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
334 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0199@014F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
335 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0201@0150 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
336 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0202@0151 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
337 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0203@0152 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
338 => X"FF00",

-- L0204@0153 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
339 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0205@0154 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
340 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0206@0155 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
341 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0207@0156 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
342 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0209@0157 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
343 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0210@0158 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
344 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0211@0159 0006.  data16 =  @OutStrDone - $;
--  data16 = 0000000000000110;
345 => X"0006",

-- L0212@015A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
346 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0213@015B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
347 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0214@015C FF62.  data16 =  @VGA_OutChr - $;
--  data16 = 1111111101100010;
348 => X"FF62",

-- L0215@015D 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
349 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0216@015E FFF9.  data16 =  @VGA_OutStr - $;
--  data16 = 1111111111111001;
350 => X"FFF9",

-- L0217@015F 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
351 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0219@0160 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
352 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0220@0161 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
353 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0221@0162 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
354 => X"1000",

-- L0222@0163 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
355 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0223@0164 0000.  data16 =  0;
--  data16 = 0000000000000000;
356 => X"0000",

-- L0224@0165 09C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 100, r_x = 111, r_y = 000, r_s = 000;
357 => X"0" & O"4" & O"7" & O"0" & O"0",

-- L0225@0166 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
358 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0226@0167 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
359 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0227@0168 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
360 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0228@0169 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
361 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0229@016A 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
362 => X"0800",

-- L0230@016B A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
363 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0231@016C 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
364 => X"0003",

-- L0232@016D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
365 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0233@016E FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
366 => X"FFF7",

-- L0234@016F 0802.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
367 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0235@0170 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
368 => X"4" & O"0" & O"0" & O"0" & O"2",

-- 143 location(s) in following ranges will be filled with default value
-- 0171 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

