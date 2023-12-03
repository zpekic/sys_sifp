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

-- L0023@0003 00A2.  data16 =  @VGA_Init - $;
--  data16 = 0000000010100010;
3 => X"00A2",

-- L0024@0004 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
4 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0025@0005 0029.  data16 =  @StrHWorld;
--  data16 = 0000000000101001;
5 => X"0029",

-- L0026@0006 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
6 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0027@0007 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
7 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0028@0008 014F.  data16 =  @VGA_OutStr - $;
--  data16 = 0000000101001111;
8 => X"014F",

-- L0030@0009 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
9 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0031@000A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0032@000B 006A.  data16 =  @UART_Init - $;
--  data16 = 0000000001101010;
11 => X"006A",

-- L0033@000C 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
12 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0034@000D 0029.  data16 =  @StrHWorld;
--  data16 = 0000000000101001;
13 => X"0029",

-- L0035@000E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
14 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0036@000F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
15 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@0010 008C.  data16 =  @UART_OutStr - $;
--  data16 = 0000000010001100;
16 => X"008C",

-- L0040@0011 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
17 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0042@0012 6003.EchoLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
18 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0043@0013 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
19 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@0014 006A.  data16 =  @UART_GetChr - $;
--  data16 = 0000000001101010;
20 => X"006A",

-- L0045@0015 0E03.EchoOut:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
21 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0046@0016 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
22 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0047@0017 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
23 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@0018 0075.  data16 =  @UART_OutChr - $;
--  data16 = 0000000001110101;
24 => X"0075",

-- L0049@0019 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
25 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0050@001A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
26 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@001B 00A1.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010100001;
27 => X"00A1",

-- L0052@001C 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
28 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0053@001D 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
29 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0054@001E 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
30 => X"000D",

-- L0055@001F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0056@0020 0003.  data16 =  @EchoLF - $;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0057@0021 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0058@0022 0012.  data16 =  @EchoLoop;
--  data16 = 0000000000010010;
34 => X"0012",

-- L0059@0023 1800.EchoLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
35 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0060@0024 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
36 => X"000A",

-- L0061@0025 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
37 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0062@0026 0015.  data16 =  @EchoOut;
--  data16 = 0000000000010101;
38 => X"0015",

-- L0064@0027 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
39 => X"0001",

-- L0065@0028 0000.  data16 =  0;
--  data16 = 0000000000000000;
40 => X"0000",

-- L0067@0029 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
41 => X"0048",

-- L0068@002A 0065.  data16 =  'e';
--  data16 = 0000000001100101;
42 => X"0065",

-- L0069@002B 006C.  data16 =  'l';
--  data16 = 0000000001101100;
43 => X"006C",

-- L0070@002C 006C.  data16 =  'l';
--  data16 = 0000000001101100;
44 => X"006C",

-- L0071@002D 006F.  data16 =  'o';
--  data16 = 0000000001101111;
45 => X"006F",

-- L0072@002E 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
46 => X"0020",

-- L0073@002F 0057.  data16 =  'W';
--  data16 = 0000000001010111;
47 => X"0057",

-- L0074@0030 006F.  data16 =  'o';
--  data16 = 0000000001101111;
48 => X"006F",

-- L0075@0031 0072.  data16 =  'r';
--  data16 = 0000000001110010;
49 => X"0072",

-- L0076@0032 006C.  data16 =  'l';
--  data16 = 0000000001101100;
50 => X"006C",

-- L0077@0033 0064.  data16 =  'd';
--  data16 = 0000000001100100;
51 => X"0064",

-- L0078@0034 0021.  data16 =  '!';
--  data16 = 0000000000100001;
52 => X"0021",

-- L0079@0035 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
53 => X"000D",

-- L0080@0036 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
54 => X"000A",

-- L0081@0037 0000.  data16 =  0;
--  data16 = 0000000000000000;
55 => X"0000",

-- L0003@0038 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
56 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0039 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
57 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@003A 0000.  data16 =  0;
--  data16 = 0000000000000000;
58 => X"0000",

-- L0006@003B 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
59 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@003C 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
60 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@003D 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
61 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@003E 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
62 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@003F FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
63 => X"FFFE",

-- L0013@0040 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
64 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0041 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
65 => X"1" & O"4" & O"0" & O"0" & O"0",

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

-- L0022@0046 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
70 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0023@0047 0010.  data16 =  16;
--  data16 = 0000000000010000;
71 => X"0010",

-- L0024@0048 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
72 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0025@0049 0000.  data16 =  0;
--  data16 = 0000000000000000;
73 => X"0000",

-- L0027@004A 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
74 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@004B 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
75 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0029@004C 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
76 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0030@004D 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
77 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@004E 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@004F 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
79 => X"0005",

-- L0033@0050 1A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
80 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0034@0051 0000.  data16 =  0;
--  data16 = 0000000000000000;
81 => X"0000",

-- L0035@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0053 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
83 => X"0005",

-- L0037@0054 6003.Y01:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
84 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0038@0055 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
85 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0056 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
86 => X"FFE2",

-- L0040@0057 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
87 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0058 0600.Nextbit:  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
88 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0042@0059 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
89 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@005A 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
90 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0044@005B 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
91 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0045@005C 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
92 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@005D 08C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 011, r_y = 000, r_s = 010;
93 => X"0" & O"4" & O"3" & O"0" & O"2",

-- L0047@005E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@005F FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
95 => X"FFEB",

-- L0049@0060 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
96 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@0061 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
97 => X"4" & O"0" & O"0" & O"0" & O"2",

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

-- L0058@0067 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
103 => X"1" & O"7" & O"7" & O"7" & O"7",

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

-- L0063@006C 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
108 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0064@006D 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
109 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0065@006E 1920.  LDA, LDY, LDX, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 100, r_s = 000;
110 => X"1" & O"4" & O"4" & O"4" & O"0",

-- L0066@006F 0000.  data16 =  0;
--  data16 = 0000000000000000;
111 => X"0000",

-- L0067@0070 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
112 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0068@0071 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
113 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0069@0072 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
114 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0070@0073 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
115 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0071@0074 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
116 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0075 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
117 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0076 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
118 => X"E000",

-- L0004@0077 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
119 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0078 0003.  data16 =  3;
--  data16 = 0000000000000011;
120 => X"0003",

-- L0006@0079 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
121 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@007A 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
122 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@007B 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
123 => X"0010",

-- L0009@007C 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
124 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@007D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
125 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@007E 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
126 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@007F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
127 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0014@0080 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
128 => X"E000",

-- L0015@0081 0830.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
129 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0016@0082 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
130 => X"0" & O"3" & O"0" & O"0" & O"0",

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

-- L0022@0088 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
136 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0023@0089 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
137 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0024@008A 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
138 => X"00FF",

-- L0025@008B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
139 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0026@008C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
140 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@008D 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
141 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0029@008E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
142 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0030@008F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
143 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0031@0090 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
144 => X"E000",

-- L0032@0091 0830.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
145 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0033@0092 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
146 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0034@0093 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
147 => X"0" & O"3" & O"0" & O"0" & O"0",

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

-- L0039@0098 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
152 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0040@0099 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
153 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0041@009A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
154 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0042@009B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
155 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0044@009C 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
156 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0045@009D 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
157 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0046@009E 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
158 => X"0006",

-- L0047@009F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
159 => X"6" & O"0" & O"0" & O"0" & O"3",

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

-- L0052@00A4 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
164 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0008@00A5 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
165 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0009@00A6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
166 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@00A7 FF91.  data16 =  @CLC - $;
--  data16 = 1111111110010001;
167 => X"FF91",

-- L0011@00A8 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
168 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0012@00A9 0040.  data16 =  64;
--  data16 = 0000000001000000;
169 => X"0040",

-- L0013@00AA 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
170 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00AB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
171 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@00AC 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
172 => X"1000",

-- L0016@00AD 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
173 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0017@00AE 0020.  data16 =  32;
--  data16 = 0000000000100000;
174 => X"0020",

-- L0018@00AF 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
175 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0019@00B0 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
176 => X"FF00",

-- L0020@00B1 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
177 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0021@00B2 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
178 => X"0" & O"4" & O"0" & O"6" & O"0",

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

-- L0028@00B9 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
185 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0029@00BA 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
186 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0030@00BB 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
187 => X"0001",

-- L0035@00BC 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
188 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0036@00BD 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
189 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0037@00BE 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
190 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0039@00BF 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
191 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0040@00C0 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
192 => X"0002",

-- L0041@00C1 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
193 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0042@00C2 0080.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010000000;
194 => X"0080",

-- L0044@00C3 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
195 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0045@00C4 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
196 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0046@00C5 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
197 => X"0001",

-- L0047@00C6 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
198 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@00C7 005D.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001011101;
199 => X"005D",

-- L0050@00C8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
200 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0051@00C9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
201 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@00CA 007D.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111101;
202 => X"007D",

-- L0054@00CB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
203 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0055@00CC 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
204 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0056@00CD 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
205 => X"000D",

-- L0057@00CE 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
206 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0058@00CF 004D.  data16 =  @VGA_CR - $;
--  data16 = 0000000001001101;
207 => X"004D",

-- L0060@00D0 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
208 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0061@00D1 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
209 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0062@00D2 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
210 => X"000A",

-- L0063@00D3 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
211 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0064@00D4 004D.  data16 =  @VGA_LF - $;
--  data16 = 0000000001001101;
212 => X"004D",

-- L0067@00D5 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
213 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0069@00D6 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
214 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0070@00D7 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
215 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0071@00D8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
216 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0072@00D9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0073@00DA 0076.  data16 =  @GetRowBase - $;
--  data16 = 0000000001110110;
218 => X"0076",

-- L0074@00DB 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
219 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0075@00DC 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
220 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0076@00DD 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
221 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0077@00DE 0040.  data16 =  64;
--  data16 = 0000000001000000;
222 => X"0040",

-- L0078@00DF A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
223 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0079@00E0 000C.  data16 =  @NextRow - $;
--  data16 = 0000000000001100;
224 => X"000C",

-- L0080@00E1 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
225 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0081@00E2 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
226 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0082@00E3 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
227 => X"FF3E",

-- L0083@00E4 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
228 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0084@00E5 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
229 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0085@00E6 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
230 => X"FF3F",

-- L0086@00E7 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
231 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0087@00E8 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
232 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0089@00E9 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
233 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0090@00EA 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
234 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0091@00EB 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
235 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0093@00EC 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
236 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0094@00ED 0000.  data16 =  0;
--  data16 = 0000000000000000;
237 => X"0000",

-- L0095@00EE 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
238 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0096@00EF 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
239 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0097@00F0 0020.  data16 =  32;
--  data16 = 0000000000100000;
240 => X"0020",

-- L0098@00F1 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
241 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0099@00F2 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
242 => X"0003",

-- L0100@00F3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
243 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0101@00F4 FFED.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111101101;
244 => X"FFED",

-- L0103@00F5 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
245 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0104@00F6 0000.  data16 =  0;
--  data16 = 0000000000000000;
246 => X"0000",

-- L0105@00F7 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
247 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0106@00F8 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
248 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0107@00F9 0000.  data16 =  0;
--  data16 = 0000000000000000;
249 => X"0000",

-- L0108@00FA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
250 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0109@00FB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
251 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0110@00FC 0054.  data16 =  @GetRowBase - $;
--  data16 = 0000000001010100;
252 => X"0054",

-- L0111@00FD 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
253 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0112@00FE 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
254 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0113@00FF 0040.  data16 =  64;
--  data16 = 0000000001000000;
255 => X"0040",

-- L0114@0100 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
256 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0115@0101 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
257 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0116@0102 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
258 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0117@0103 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
259 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0118@0104 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
260 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0119@0105 0040.  data16 =  64;
--  data16 = 0000000001000000;
261 => X"0040",

-- L0120@0106 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0121@0107 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
263 => X"0003",

-- L0122@0108 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
264 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@0109 FFF4.  data16 =  @NxtCol - $;
--  data16 = 1111111111110100;
265 => X"FFF4",

-- L0124@010A 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
266 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0125@010B 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
267 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0126@010C 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
268 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0127@010D 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
269 => X"001F",

-- L0128@010E C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
270 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0129@010F 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
271 => X"0003",

-- L0130@0110 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
272 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0131@0111 FFE6.  data16 =  @NxtRow - $;
--  data16 = 1111111111100110;
273 => X"FFE6",

-- L0133@0112 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
274 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0134@0113 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
275 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0135@0114 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
276 => X"001F",

-- L0136@0115 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
277 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0137@0116 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
278 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0138@0117 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
279 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0139@0118 001D.  data16 =  @ClearRow - $;
--  data16 = 0000000000011101;
280 => X"001D",

-- L0140@0119 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
281 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0141@011A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
282 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0142@011B 0002.  data16 =  @SetX0 - $;
--  data16 = 0000000000000010;
283 => X"0002",

-- L0144@011C 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
284 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0145@011D 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
285 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0146@011E 0000.  data16 =  0;
--  data16 = 0000000000000000;
286 => X"0000",

-- L0147@011F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
287 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0148@0120 FFC1.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111000001;
288 => X"FFC1",

-- L0150@0121 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
289 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0151@0122 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0152@0123 FFCB.  data16 =  @NextRow1 - $;
--  data16 = 1111111111001011;
291 => X"FFCB",

-- L0154@0124 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
292 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0155@0125 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
293 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0156@0126 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
294 => X"0020",

-- L0157@0127 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
295 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0158@0128 0000.  data16 =  0;
--  data16 = 0000000000000000;
296 => X"0000",

-- L0159@0129 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
297 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0160@012A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
298 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0161@012B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
299 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0162@012C 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
300 => X"0009",

-- L0163@012D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
301 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0164@012E 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
302 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0165@012F 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
303 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0166@0130 0020.  data16 =  32;
--  data16 = 0000000000100000;
304 => X"0020",

-- L0167@0131 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
305 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0168@0132 0011.  data16 =  @vga_home1 - $;
--  data16 = 0000000000010001;
306 => X"0011",

-- L0169@0133 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
307 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0170@0134 FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
308 => X"FFF5",

-- L0172@0135 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
309 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0173@0136 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
310 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0174@0137 0019.  data16 =  @GetRowBase - $;
--  data16 = 0000000000011001;
311 => X"0019",

-- L0175@0138 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
312 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0176@0139 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
313 => X"0020",

-- L0177@013A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
314 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0178@013B 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
315 => X"0007",

-- L0179@013C 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
316 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0180@013D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
317 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0181@013E 0003.  data16 =  @ClrDone - $;
--  data16 = 0000000000000011;
318 => X"0003",

-- L0182@013F 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
319 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0183@0140 FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
320 => X"FFFC",

-- L0184@0141 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
321 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0186@0142 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
322 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0187@0143 1120.vga_home1:  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
323 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0188@0144 0000.  data16 =  0;
--  data16 = 0000000000000000;
324 => X"0000",

-- L0189@0145 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
325 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0190@0146 FF9B.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110011011;
326 => X"FF9B",

-- L0192@0147 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
327 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0193@0148 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
328 => X"FF3E",

-- L0194@0149 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
329 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0195@014A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
330 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0196@014B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
331 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0197@014C FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
332 => X"FF3F",

-- L0198@014D 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
333 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0199@014E 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
334 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0200@014F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
335 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0202@0150 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
336 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0203@0151 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
337 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0204@0152 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
338 => X"FF00",

-- L0205@0153 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
339 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0206@0154 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
340 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0207@0155 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
341 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0208@0156 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
342 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0210@0157 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
343 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0211@0158 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
344 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0212@0159 0006.  data16 =  @OutStrDone - $;
--  data16 = 0000000000000110;
345 => X"0006",

-- L0213@015A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
346 => X"6" & O"0" & O"0" & O"0" & O"3",

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

-- L0218@015F 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
351 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0220@0160 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
352 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0221@0161 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
353 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0222@0162 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
354 => X"1000",

-- L0223@0163 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
355 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0224@0164 0000.  data16 =  0;
--  data16 = 0000000000000000;
356 => X"0000",

-- L0225@0165 09C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 100, r_x = 111, r_y = 000, r_s = 000;
357 => X"0" & O"4" & O"7" & O"0" & O"0",

-- L0226@0166 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
358 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0227@0167 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
359 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0228@0168 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
360 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0229@0169 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
361 => X"1" & O"0" & O"1" & O"0" & O"0",

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

-- L0235@016F 0802.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
367 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0236@0170 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
368 => X"4" & O"0" & O"0" & O"0" & O"2",

-- 143 location(s) in following ranges will be filled with default value
-- 0171 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

