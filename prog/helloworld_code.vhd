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

-- L0023@0003 00AD.  data16 =  @VGA_Init - $;
--  data16 = 0000000010101101;
3 => X"00AD",

-- L0025@0004 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
4 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0026@0005 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
5 => X"0020",

-- L0027@0006 1A00.Loop:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
6 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0028@0007 0001.  data16 =  1;
--  data16 = 0000000000000001;
7 => X"0001",

-- L0029@0008 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
8 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0030@0009 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
9 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0031@000A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
10 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0032@000B 00BC.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010111100;
11 => X"00BC",

-- L0033@000C 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
12 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0034@000D 0040.  data16 =  @StrEnd;
--  data16 = 0000000001000000;
13 => X"0040",

-- L0035@000E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
14 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0036@000F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
15 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@0010 0152.  data16 =  @VGA_OutStr - $;
--  data16 = 0000000101010010;
16 => X"0152",

-- L0038@0011 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
17 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0039@0012 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0040@0013 0006.  data16 =  @Loop;
--  data16 = 0000000000000110;
19 => X"0006",

-- L0042@0014 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
20 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0043@0015 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
21 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@0016 006A.  data16 =  @UART_Init - $;
--  data16 = 0000000001101010;
22 => X"006A",

-- L0046@0017 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
23 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0047@0018 0034.  data16 =  @StrHWorld;
--  data16 = 0000000000110100;
24 => X"0034",

-- L0048@0019 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
25 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0049@001A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
26 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0050@001B 008C.  data16 =  @UART_OutStr - $;
--  data16 = 0000000010001100;
27 => X"008C",

-- L0052@001C 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
28 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0054@001D 6003.EchoLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
29 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0055@001E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
30 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0056@001F 006A.  data16 =  @UART_GetChr - $;
--  data16 = 0000000001101010;
31 => X"006A",

-- L0057@0020 0E03.EchoOut:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
32 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0058@0021 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
33 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0059@0022 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
34 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0060@0023 0075.  data16 =  @UART_OutChr - $;
--  data16 = 0000000001110101;
35 => X"0075",

-- L0061@0024 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
36 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0062@0025 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
37 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0063@0026 00A1.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010100001;
38 => X"00A1",

-- L0064@0027 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
39 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0065@0028 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
40 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0066@0029 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
41 => X"000D",

-- L0067@002A 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
42 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0068@002B 0003.  data16 =  @EchoLF - $;
--  data16 = 0000000000000011;
43 => X"0003",

-- L0069@002C 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0070@002D 001D.  data16 =  @EchoLoop;
--  data16 = 0000000000011101;
45 => X"001D",

-- L0071@002E 1800.EchoLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
46 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0072@002F 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
47 => X"000A",

-- L0073@0030 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
48 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0074@0031 0020.  data16 =  @EchoOut;
--  data16 = 0000000000100000;
49 => X"0020",

-- L0076@0032 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
50 => X"0001",

-- L0077@0033 0000.  data16 =  0;
--  data16 = 0000000000000000;
51 => X"0000",

-- L0079@0034 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
52 => X"0048",

-- L0080@0035 0065.  data16 =  'e';
--  data16 = 0000000001100101;
53 => X"0065",

-- L0081@0036 006C.  data16 =  'l';
--  data16 = 0000000001101100;
54 => X"006C",

-- L0082@0037 006C.  data16 =  'l';
--  data16 = 0000000001101100;
55 => X"006C",

-- L0083@0038 006F.  data16 =  'o';
--  data16 = 0000000001101111;
56 => X"006F",

-- L0084@0039 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
57 => X"0020",

-- L0085@003A 0057.  data16 =  'W';
--  data16 = 0000000001010111;
58 => X"0057",

-- L0086@003B 006F.  data16 =  'o';
--  data16 = 0000000001101111;
59 => X"006F",

-- L0087@003C 0072.  data16 =  'r';
--  data16 = 0000000001110010;
60 => X"0072",

-- L0088@003D 006C.  data16 =  'l';
--  data16 = 0000000001101100;
61 => X"006C",

-- L0089@003E 0064.  data16 =  'd';
--  data16 = 0000000001100100;
62 => X"0064",

-- L0090@003F 0021.  data16 =  '!';
--  data16 = 0000000000100001;
63 => X"0021",

-- L0091@0040 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
64 => X"000D",

-- L0092@0041 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
65 => X"000A",

-- L0093@0042 0000.  data16 =  0;
--  data16 = 0000000000000000;
66 => X"0000",

-- L0003@0043 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
67 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0044 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
68 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0045 0000.  data16 =  0;
--  data16 = 0000000000000000;
69 => X"0000",

-- L0006@0046 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
70 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@0047 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
71 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@0048 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
72 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@0049 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
73 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@004A FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
74 => X"FFFE",

-- L0013@004B 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
75 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@004C 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
76 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@004D FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
77 => X"FFFF",

-- L0016@004E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@004F FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
79 => X"FFF7",

-- L0021@0050 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
80 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0051 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
81 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0023@0052 0010.  data16 =  16;
--  data16 = 0000000000010000;
82 => X"0010",

-- L0024@0053 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
83 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0025@0054 0000.  data16 =  0;
--  data16 = 0000000000000000;
84 => X"0000",

-- L0027@0055 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
85 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0056 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
86 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0029@0057 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
87 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0030@0058 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
88 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@0059 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
89 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@005A 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
90 => X"0005",

-- L0033@005B 1A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
91 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0034@005C 0000.  data16 =  0;
--  data16 = 0000000000000000;
92 => X"0000",

-- L0035@005D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
93 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@005E 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
94 => X"0005",

-- L0037@005F 6003.Y01:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
95 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0038@0060 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
96 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0061 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
97 => X"FFE2",

-- L0040@0062 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
98 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0063 0600.Nextbit:  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
99 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0042@0064 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
100 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0065 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
101 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0044@0066 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
102 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0045@0067 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
103 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@0068 08C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 011, r_y = 000, r_s = 010;
104 => X"0" & O"4" & O"3" & O"0" & O"2",

-- L0047@0069 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
105 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@006A FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
106 => X"FFEB",

-- L0049@006B 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
107 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@006C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
108 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0053@006D 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
109 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0054@006E 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
110 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0055@006F 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
111 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0056@0070 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
112 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0057@0071 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
113 => X"0002",

-- L0058@0072 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
114 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0059@0073 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
115 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0060@0074 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
116 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0061@0075 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
117 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0062@0076 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
118 => X"0002",

-- L0063@0077 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
119 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0064@0078 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
120 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0065@0079 1920.  LDA, LDY, LDX, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 100, r_s = 000;
121 => X"1" & O"4" & O"4" & O"4" & O"0",

-- L0066@007A 0000.  data16 =  0;
--  data16 = 0000000000000000;
122 => X"0000",

-- L0067@007B 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
123 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0068@007C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
124 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0069@007D 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
125 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0070@007E 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
126 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0071@007F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
127 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0080 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
128 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0081 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
129 => X"E000",

-- L0004@0082 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
130 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0083 0003.  data16 =  3;
--  data16 = 0000000000000011;
131 => X"0003",

-- L0006@0084 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
132 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@0085 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
133 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@0086 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
134 => X"0010",

-- L0009@0087 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
135 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@0088 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
136 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@0089 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
137 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@008A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
138 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0014@008B E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
139 => X"E000",

-- L0015@008C 0830.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
140 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0016@008D 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
141 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0017@008E 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0018@008F 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
143 => X"0003",

-- L0019@0090 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
144 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@0091 FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
145 => X"FFFB",

-- L0021@0092 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
146 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0022@0093 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
147 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0023@0094 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
148 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0024@0095 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
149 => X"00FF",

-- L0025@0096 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
150 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0026@0097 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
151 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@0098 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
152 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0029@0099 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
153 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0030@009A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
154 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0031@009B E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
155 => X"E000",

-- L0032@009C 0830.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
156 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0033@009D 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
157 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0034@009E 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
158 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0035@009F 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0036@00A0 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
160 => X"0003",

-- L0037@00A1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
161 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@00A2 FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
162 => X"FFFA",

-- L0039@00A3 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
163 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0040@00A4 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
164 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0041@00A5 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
165 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0042@00A6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
166 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0044@00A7 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
167 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0045@00A8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0046@00A9 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
169 => X"0006",

-- L0047@00AA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
170 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0048@00AB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
171 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0049@00AC FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
172 => X"FFEC",

-- L0050@00AD 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
173 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0051@00AE FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
174 => X"FFF9",

-- L0052@00AF 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
175 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0008@00B0 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
176 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0009@00B1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
177 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@00B2 FF91.  data16 =  @CLC - $;
--  data16 = 1111111110010001;
178 => X"FF91",

-- L0011@00B3 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
179 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0012@00B4 0040.  data16 =  64;
--  data16 = 0000000001000000;
180 => X"0040",

-- L0013@00B5 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
181 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00B6 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
182 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@00B7 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
183 => X"1000",

-- L0016@00B8 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
184 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0017@00B9 0020.  data16 =  32;
--  data16 = 0000000000100000;
185 => X"0020",

-- L0018@00BA 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
186 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0019@00BB FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
187 => X"FF00",

-- L0020@00BC 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
188 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0021@00BD 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
189 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0022@00BE 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
190 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0023@00BF 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
191 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0024@00C0 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
192 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0025@00C1 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
193 => X"0003",

-- L0026@00C2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
194 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0027@00C3 FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
195 => X"FFFA",

-- L0028@00C4 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
196 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0029@00C5 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
197 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0030@00C6 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
198 => X"0002",

-- L0036@00C7 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
199 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0037@00C8 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
200 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0038@00C9 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
201 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0040@00CA 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
202 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0041@00CB 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
203 => X"0002",

-- L0042@00CC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
204 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0043@00CD 0080.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010000000;
205 => X"0080",

-- L0045@00CE 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
206 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0046@00CF 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
207 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0047@00D0 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
208 => X"0001",

-- L0048@00D1 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
209 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0049@00D2 005D.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001011101;
210 => X"005D",

-- L0051@00D3 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
211 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0052@00D4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
212 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0053@00D5 007D.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111101;
213 => X"007D",

-- L0055@00D6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
214 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0056@00D7 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
215 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0057@00D8 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
216 => X"000D",

-- L0058@00D9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0059@00DA 004D.  data16 =  @VGA_CR - $;
--  data16 = 0000000001001101;
218 => X"004D",

-- L0061@00DB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
219 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0062@00DC 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
220 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0063@00DD 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
221 => X"000A",

-- L0064@00DE 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
222 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0065@00DF 004D.  data16 =  @VGA_LF - $;
--  data16 = 0000000001001101;
223 => X"004D",

-- L0068@00E0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
224 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0070@00E1 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
225 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0071@00E2 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
226 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@00E3 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
227 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0073@00E4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
228 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0074@00E5 0076.  data16 =  @GetRowBase - $;
--  data16 = 0000000001110110;
229 => X"0076",

-- L0075@00E6 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
230 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0076@00E7 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
231 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0077@00E8 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
232 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0078@00E9 0040.  data16 =  64;
--  data16 = 0000000001000000;
233 => X"0040",

-- L0079@00EA A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
234 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0080@00EB 000C.  data16 =  @NextRow - $;
--  data16 = 0000000000001100;
235 => X"000C",

-- L0081@00EC 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
236 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0082@00ED 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
237 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0083@00EE FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
238 => X"FF3E",

-- L0084@00EF 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
239 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0085@00F0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
240 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0086@00F1 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
241 => X"FF3F",

-- L0087@00F2 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
242 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0088@00F3 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
243 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0090@00F4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
244 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0091@00F5 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
245 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0092@00F6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
246 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0094@00F7 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
247 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0095@00F8 0000.  data16 =  0;
--  data16 = 0000000000000000;
248 => X"0000",

-- L0096@00F9 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
249 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0097@00FA 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
250 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0098@00FB 0020.  data16 =  32;
--  data16 = 0000000000100000;
251 => X"0020",

-- L0099@00FC C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
252 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0100@00FD 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
253 => X"0003",

-- L0101@00FE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
254 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00FF FFED.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111101101;
255 => X"FFED",

-- L0104@0100 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
256 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0105@0101 0000.  data16 =  0;
--  data16 = 0000000000000000;
257 => X"0000",

-- L0106@0102 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
258 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0107@0103 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
259 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0108@0104 0000.  data16 =  0;
--  data16 = 0000000000000000;
260 => X"0000",

-- L0109@0105 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
261 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0110@0106 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0111@0107 0054.  data16 =  @GetRowBase - $;
--  data16 = 0000000001010100;
263 => X"0054",

-- L0112@0108 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
264 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0113@0109 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
265 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0114@010A 0040.  data16 =  64;
--  data16 = 0000000001000000;
266 => X"0040",

-- L0115@010B 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
267 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0116@010C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
268 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0117@010D 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
269 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0118@010E 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
270 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0119@010F 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
271 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0120@0110 0040.  data16 =  64;
--  data16 = 0000000001000000;
272 => X"0040",

-- L0121@0111 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
273 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0122@0112 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
274 => X"0003",

-- L0123@0113 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
275 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0124@0114 FFF4.  data16 =  @NxtCol - $;
--  data16 = 1111111111110100;
276 => X"FFF4",

-- L0125@0115 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
277 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0126@0116 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
278 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0127@0117 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
279 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0128@0118 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
280 => X"001F",

-- L0129@0119 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
281 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0130@011A 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
282 => X"0003",

-- L0131@011B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
283 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@011C FFE6.  data16 =  @NxtRow - $;
--  data16 = 1111111111100110;
284 => X"FFE6",

-- L0134@011D 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
285 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0135@011E 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
286 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0136@011F 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
287 => X"001F",

-- L0137@0120 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
288 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0138@0121 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
289 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0139@0122 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0140@0123 001D.  data16 =  @ClearRow - $;
--  data16 = 0000000000011101;
291 => X"001D",

-- L0141@0124 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
292 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0142@0125 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
293 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0143@0126 0002.  data16 =  @SetX0 - $;
--  data16 = 0000000000000010;
294 => X"0002",

-- L0145@0127 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
295 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0146@0128 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
296 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0147@0129 0000.  data16 =  0;
--  data16 = 0000000000000000;
297 => X"0000",

-- L0148@012A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
298 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0149@012B FFC1.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111000001;
299 => X"FFC1",

-- L0151@012C 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
300 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0152@012D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
301 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0153@012E FFCB.  data16 =  @NextRow1 - $;
--  data16 = 1111111111001011;
302 => X"FFCB",

-- L0155@012F 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
303 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0156@0130 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
304 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0157@0131 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
305 => X"0020",

-- L0158@0132 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
306 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0159@0133 0000.  data16 =  0;
--  data16 = 0000000000000000;
307 => X"0000",

-- L0160@0134 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
308 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0161@0135 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
309 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0162@0136 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
310 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0163@0137 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
311 => X"0009",

-- L0164@0138 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
312 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0165@0139 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
313 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0166@013A 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
314 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0167@013B 0020.  data16 =  32;
--  data16 = 0000000000100000;
315 => X"0020",

-- L0168@013C C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
316 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0169@013D 0010.  data16 =  @VGA_HOME - $;
--  data16 = 0000000000010000;
317 => X"0010",

-- L0170@013E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0171@013F FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
319 => X"FFF5",

-- L0173@0140 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
320 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0174@0141 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
321 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0175@0142 0019.  data16 =  @GetRowBase - $;
--  data16 = 0000000000011001;
322 => X"0019",

-- L0176@0143 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
323 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0177@0144 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
324 => X"0020",

-- L0178@0145 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
325 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0179@0146 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
326 => X"003F",

-- L0180@0147 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
327 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0181@0148 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
328 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0182@0149 0003.  data16 =  @ClrDone - $;
--  data16 = 0000000000000011;
329 => X"0003",

-- L0183@014A 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
330 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0184@014B FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
331 => X"FFFC",

-- L0185@014C 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
332 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0187@014D 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
333 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0188@014E 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
334 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0189@014F 0000.  data16 =  0;
--  data16 = 0000000000000000;
335 => X"0000",

-- L0190@0150 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
336 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0151 FF9B.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110011011;
337 => X"FF9B",

-- L0193@0152 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
338 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0194@0153 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
339 => X"FF3E",

-- L0195@0154 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
340 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0196@0155 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
341 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0197@0156 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
342 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0198@0157 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
343 => X"FF3F",

-- L0199@0158 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
344 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0200@0159 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
345 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0201@015A 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
346 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0203@015B 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
347 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0204@015C 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
348 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0205@015D FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
349 => X"FF00",

-- L0206@015E 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
350 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0207@015F 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
351 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0208@0160 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
352 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0209@0161 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
353 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0211@0162 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
354 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0212@0163 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
355 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0213@0164 0006.  data16 =  @OutStrDone - $;
--  data16 = 0000000000000110;
356 => X"0006",

-- L0214@0165 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
357 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0215@0166 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
358 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0216@0167 FF60.  data16 =  @VGA_OutChr - $;
--  data16 = 1111111101100000;
359 => X"FF60",

-- L0217@0168 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
360 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0218@0169 FFF9.  data16 =  @VGA_OutStr - $;
--  data16 = 1111111111111001;
361 => X"FFF9",

-- L0219@016A 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
362 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0221@016B 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
363 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0222@016C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
364 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0223@016D 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
365 => X"1000",

-- L0224@016E 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
366 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0225@016F 0000.  data16 =  0;
--  data16 = 0000000000000000;
367 => X"0000",

-- L0226@0170 09C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 100, r_x = 111, r_y = 000, r_s = 000;
368 => X"0" & O"4" & O"7" & O"0" & O"0",

-- L0227@0171 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
369 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0228@0172 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
370 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0229@0173 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
371 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0230@0174 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
372 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0231@0175 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
373 => X"0800",

-- L0232@0176 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
374 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0233@0177 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
375 => X"0003",

-- L0234@0178 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
376 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0235@0179 FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
377 => X"FFF7",

-- L0236@017A 0802.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
378 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0237@017B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
379 => X"4" & O"0" & O"0" & O"0" & O"2",

-- 132 location(s) in following ranges will be filled with default value
-- 017C .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

