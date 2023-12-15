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
constant CODE_ADDRESS_WIDTH: 	positive := 10;
constant CODE_ADDRESS_LAST: 	positive := 1023;


type cpu_code_memory is array(0 to 1023) of std_logic_vector(15 downto 0);

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

-- L0020@0001 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0021@0002 0029.  data16 =  @Init;
--  data16 = 0000000000101001;
2 => X"0029",

-- L0028@0008 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
8 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0029@0009 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
9 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0030@000A 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
10 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0051@000B 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
11 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0052@000C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
12 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0053@000D 01B0.  data16 =  @GetCursorXY - $;
--  data16 = 0000000110110000;
13 => X"01B0",

-- L0054@000E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
14 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0055@000F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
15 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0056@0010 01B6.  data16 =  @GetRowBase - $;
--  data16 = 0000000110110110;
16 => X"01B6",

-- L0057@0011 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
17 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0058@0012 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
18 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0059@0013 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
19 => X"0080",

-- L0060@0014 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0061@0015 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
21 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0062@0016 000E.  data16 =  @IntExit - $;
--  data16 = 0000000000001110;
22 => X"000E",

-- L0064@0017 6003.Revert:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
23 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0065@0018 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
24 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@0019 01AD.  data16 =  @GetRowBase - $;
--  data16 = 0000000110101101;
25 => X"01AD",

-- L0067@001A 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
26 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0068@001B 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
27 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0069@001C FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
28 => X"FF7F",

-- L0070@001D 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
29 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0071@001E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
30 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0072@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0073@0020 019D.  data16 =  @GetCursorXY - $;
--  data16 = 0000000110011101;
32 => X"019D",

-- L0074@0021 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
33 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0075@0022 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
34 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0076@0023 011F.  data16 =  @SetOldCrsXY - $;
--  data16 = 0000000100011111;
35 => X"011F",

-- L0078@0024 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
36 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0079@0025 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
37 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0080@0026 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
38 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0081@0027 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
39 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0082@0028 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
40 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0085@0029 6003.Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
41 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0086@002A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
42 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0087@002B 00C6.  data16 =  @VGA_Init - $;
--  data16 = 0000000011000110;
43 => X"00C6",

-- L0088@002C 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
44 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0089@002D 0051.  data16 =  @StrHWorld;
--  data16 = 0000000001010001;
45 => X"0051",

-- L0090@002E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
46 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0091@002F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
47 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0092@0030 019D.  data16 =  @VGA_OutStr - $;
--  data16 = 0000000110011101;
48 => X"019D",

-- L0094@0031 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
49 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0095@0032 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
50 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@0033 008C.  data16 =  @UART_Init - $;
--  data16 = 0000000010001100;
51 => X"008C",

-- L0097@0034 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
52 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0098@0035 0051.  data16 =  @StrHWorld;
--  data16 = 0000000001010001;
53 => X"0051",

-- L0099@0036 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
54 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0100@0037 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
55 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0101@0038 00B0.  data16 =  @UART_OutStr - $;
--  data16 = 0000000010110000;
56 => X"00B0",

-- L0104@0039 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
57 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0106@003A 6003.EchoLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0107@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0108@003C 008C.  data16 =  @UART_GetChr - $;
--  data16 = 0000000010001100;
60 => X"008C",

-- L0109@003D 0E03.EchoOut:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
61 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0110@003E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0111@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0112@0040 0099.  data16 =  @UART_OutChr - $;
--  data16 = 0000000010011001;
64 => X"0099",

-- L0113@0041 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0114@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0115@0043 00CA.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000011001010;
67 => X"00CA",

-- L0116@0044 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
68 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0117@0045 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
69 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0118@0046 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
70 => X"000D",

-- L0119@0047 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
71 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0120@0048 0003.  data16 =  @EchoLF - $;
--  data16 = 0000000000000011;
72 => X"0003",

-- L0121@0049 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
73 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0122@004A 003A.  data16 =  @EchoLoop;
--  data16 = 0000000000111010;
74 => X"003A",

-- L0123@004B 1800.EchoLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
75 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0124@004C 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
76 => X"000A",

-- L0125@004D 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
77 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0126@004E 003D.  data16 =  @EchoOut;
--  data16 = 0000000000111101;
78 => X"003D",

-- L0128@004F 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
79 => X"0001",

-- L0129@0050 0000.  data16 =  0;
--  data16 = 0000000000000000;
80 => X"0000",

-- L0131@0051 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
81 => X"0048",

-- L0132@0052 0065.  data16 =  'e';
--  data16 = 0000000001100101;
82 => X"0065",

-- L0133@0053 006C.  data16 =  'l';
--  data16 = 0000000001101100;
83 => X"006C",

-- L0134@0054 006C.  data16 =  'l';
--  data16 = 0000000001101100;
84 => X"006C",

-- L0135@0055 006F.  data16 =  'o';
--  data16 = 0000000001101111;
85 => X"006F",

-- L0136@0056 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
86 => X"0020",

-- L0137@0057 0057.  data16 =  'W';
--  data16 = 0000000001010111;
87 => X"0057",

-- L0138@0058 006F.  data16 =  'o';
--  data16 = 0000000001101111;
88 => X"006F",

-- L0139@0059 0072.  data16 =  'r';
--  data16 = 0000000001110010;
89 => X"0072",

-- L0140@005A 006C.  data16 =  'l';
--  data16 = 0000000001101100;
90 => X"006C",

-- L0141@005B 0064.  data16 =  'd';
--  data16 = 0000000001100100;
91 => X"0064",

-- L0142@005C 0021.  data16 =  '!';
--  data16 = 0000000000100001;
92 => X"0021",

-- L0143@005D 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
93 => X"000D",

-- L0144@005E 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
94 => X"000A",

-- L0145@005F 0000.  data16 =  0;
--  data16 = 0000000000000000;
95 => X"0000",

-- L0003@0060 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
96 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0061 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
97 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0062 0000.  data16 =  0;
--  data16 = 0000000000000000;
98 => X"0000",

-- L0006@0063 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
99 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@0064 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
100 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@0065 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
101 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@0066 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
102 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@0067 FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
103 => X"FFFE",

-- L0013@0068 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
104 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0069 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
105 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@006A FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
106 => X"FFFF",

-- L0016@006B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
107 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@006C FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
108 => X"FFF7",

-- L0020@006D 0E03.MemCompare:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
109 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0021@006E 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
110 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0022@006F 0000.  data16 =  0;
--  data16 = 0000000000000000;
111 => X"0000",

-- L0023@0070 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
112 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0024@0071 0005.  data16 =  @CompDone - $;
--  data16 = 0000000000000101;
113 => X"0005",

-- L0025@0072 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
114 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@0073 0380.  XOR, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
115 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0027@0074 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0028@0075 0004.  data16 =  @CompCont - $;
--  data16 = 0000000000000100;
117 => X"0004",

-- L0029@0076 1005.CompDone:  r_p = M[IMM], r_s = ADS;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 101;
118 => X"1" & O"0" & O"0" & O"0" & O"5",

-- L0030@0077 0001.  data16 =  1;
--  data16 = 0000000000000001;
119 => X"0001",

-- L0031@0078 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
120 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@0079 0892.CompCont:  INX, INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 010, r_y = 010, r_s = 010;
121 => X"0" & O"4" & O"2" & O"2" & O"2",

-- L0033@007A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
122 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@007B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
123 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@007C 000B.  data16 =  @DECA - $;
--  data16 = 0000000000001011;
124 => X"000B",

-- L0036@007D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
125 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@007E FFEF.  data16 =  @MemCompare - $;
--  data16 = 1111111111101111;
126 => X"FFEF",

-- L0039@007F 8000.INCA:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
127 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0040@0080 0004.  data16 =  @INC0 - $;
--  data16 = 0000000000000100;
128 => X"0004",

-- L0041@0081 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
129 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0042@0082 0001.  data16 =  1;
--  data16 = 0000000000000001;
130 => X"0001",

-- L0043@0083 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
131 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0044@0084 1A00.INC0:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
132 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0045@0085 0000.  data16 =  0;
--  data16 = 0000000000000000;
133 => X"0000",

-- L0046@0086 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
134 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0048@0087 8000.DECA:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
135 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0049@0088 0004.  data16 =  @DEC2 - $;
--  data16 = 0000000000000100;
136 => X"0004",

-- L0050@0089 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
137 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0051@008A FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
138 => X"FFFF",

-- L0052@008B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
139 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0053@008C 1A00.DEC2:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
140 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0054@008D FFFE.  data16 =  0xFFFE;
--  data16 = 1111111111111110;
141 => X"FFFE",

-- L0055@008E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
142 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0059@008F 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
143 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0060@0090 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
144 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0061@0091 0010.  data16 =  16;
--  data16 = 0000000000010000;
145 => X"0010",

-- L0062@0092 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
146 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0063@0093 0000.  data16 =  0;
--  data16 = 0000000000000000;
147 => X"0000",

-- L0065@0094 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
148 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0066@0095 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
149 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0067@0096 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
150 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0068@0097 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
151 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0069@0098 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
152 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0070@0099 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
153 => X"0005",

-- L0071@009A 1A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
154 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0072@009B 0000.  data16 =  0;
--  data16 = 0000000000000000;
155 => X"0000",

-- L0073@009C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0074@009D 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
157 => X"0005",

-- L0075@009E 6003.Y01:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
158 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0076@009F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@00A0 FFC0.  data16 =  @CLC - $;
--  data16 = 1111111111000000;
160 => X"FFC0",

-- L0078@00A1 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
161 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0079@00A2 0600.Nextbit:  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
162 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0080@00A3 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
163 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0081@00A4 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
164 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0082@00A5 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
165 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0083@00A6 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
166 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0084@00A7 08C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 011, r_y = 000, r_s = 010;
167 => X"0" & O"4" & O"3" & O"0" & O"2",

-- L0085@00A8 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0086@00A9 FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
169 => X"FFEB",

-- L0087@00AA 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
170 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0088@00AB 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
171 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0091@00AC 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
172 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0092@00AD 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
173 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0093@00AE 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
174 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0094@00AF B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
175 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0095@00B0 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
176 => X"0002",

-- L0096@00B1 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
177 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0097@00B2 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
178 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0098@00B3 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
179 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0099@00B4 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
180 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0100@00B5 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
181 => X"0002",

-- L0101@00B6 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
182 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0102@00B7 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
183 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0103@00B8 1920.  LDA, LDY, LDX, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 100, r_s = 000;
184 => X"1" & O"4" & O"4" & O"4" & O"0",

-- L0104@00B9 0000.  data16 =  0;
--  data16 = 0000000000000000;
185 => X"0000",

-- L0105@00BA 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
186 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0106@00BB 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
187 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0107@00BC 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
188 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0108@00BD 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
189 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0109@00BE 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
190 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@00BF 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
191 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@00C0 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
192 => X"E000",

-- L0004@00C1 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
193 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@00C2 0003.  data16 =  3;
--  data16 = 0000000000000011;
194 => X"0003",

-- L0006@00C3 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
195 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@00C4 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
196 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@00C5 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
197 => X"0010",

-- L0009@00C6 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
198 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@00C7 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
199 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@00C8 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
200 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@00C9 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
201 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0014@00CA E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
202 => X"E000",

-- L0015@00CB 0830.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
203 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0016@00CC 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
204 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0017@00CD 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
205 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0018@00CE 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
206 => X"0003",

-- L0019@00CF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
207 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@00D0 FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
208 => X"FFFB",

-- L0021@00D1 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
209 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0022@00D2 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
210 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0023@00D3 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
211 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0024@00D4 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
212 => X"00FF",

-- L0025@00D5 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
213 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0026@00D6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
214 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@00D7 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
215 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0029@00D8 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
216 => X"0007",

-- L0030@00D9 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
217 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0031@00DA 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
218 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0032@00DB 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
219 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0033@00DC E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
220 => X"E000",

-- L0034@00DD 0830.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
221 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0035@00DE 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
222 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0036@00DF 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
223 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0037@00E0 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
224 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0038@00E1 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
225 => X"0003",

-- L0039@00E2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
226 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0040@00E3 FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
227 => X"FFFA",

-- L0041@00E4 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
228 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0042@00E5 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
229 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0043@00E6 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
230 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0044@00E7 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
231 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0046@00E8 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
232 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0047@00E9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
233 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@00EA 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
234 => X"0006",

-- L0049@00EB 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
235 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0050@00EC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
236 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@00ED FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
237 => X"FFEC",

-- L0052@00EE 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
238 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0053@00EF FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
239 => X"FFF9",

-- L0054@00F0 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
240 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@00F1 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
241 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0011@00F2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
242 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0012@00F3 FF6D.  data16 =  @CLC - $;
--  data16 = 1111111101101101;
243 => X"FF6D",

-- L0013@00F4 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
244 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@00F5 0040.  data16 =  64;
--  data16 = 0000000001000000;
245 => X"0040",

-- L0015@00F6 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
246 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0016@00F7 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
247 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0017@00F8 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
248 => X"1000",

-- L0018@00F9 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
249 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0019@00FA 0020.  data16 =  32;
--  data16 = 0000000000100000;
250 => X"0020",

-- L0020@00FB 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
251 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0021@00FC FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
252 => X"FF00",

-- L0022@00FD 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
253 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0023@00FE 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
254 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@00FF 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
255 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0025@0100 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
256 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0026@0101 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
257 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0027@0102 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
258 => X"0003",

-- L0028@0103 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
259 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@0104 FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
260 => X"FFFA",

-- L0030@0105 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
261 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@0106 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
262 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0032@0107 0000.  data16 =  0;
--  data16 = 0000000000000000;
263 => X"0000",

-- L0033@0108 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
264 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@0109 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
265 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@010A 0038.  data16 =  @SetOldCrsXY - $;
--  data16 = 0000000000111000;
266 => X"0038",

-- L0036@010B 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
267 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0037@010C 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
268 => X"0001",

-- L0042@010D 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
269 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0043@010E 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
270 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0044@010F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
271 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0046@0110 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
272 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0047@0111 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
273 => X"0002",

-- L0048@0112 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
274 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0049@0113 009D.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010011101;
275 => X"009D",

-- L0051@0114 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
276 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0052@0115 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
277 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0053@0116 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
278 => X"0001",

-- L0054@0117 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
279 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0055@0118 007A.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001111010;
280 => X"007A",

-- L0057@0119 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
281 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0058@011A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
282 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@011B 00A2.  data16 =  @GetCursorXY - $;
--  data16 = 0000000010100010;
283 => X"00A2",

-- L0061@011C 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
284 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0062@011D 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
285 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0063@011E 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
286 => X"000D",

-- L0064@011F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
287 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0065@0120 005B.  data16 =  @VGA_CR - $;
--  data16 = 0000000001011011;
288 => X"005B",

-- L0067@0121 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
289 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0068@0122 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
290 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0069@0123 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
291 => X"000A",

-- L0070@0124 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
292 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0071@0125 006A.  data16 =  @VGA_LF - $;
--  data16 = 0000000001101010;
293 => X"006A",

-- L0073@0126 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
294 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0074@0127 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
295 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0075@0128 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
296 => X"0008",

-- L0076@0129 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
297 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0077@012A 0056.  data16 =  @VGA_BS - $;
--  data16 = 0000000001010110;
298 => X"0056",

-- L0080@012B 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
299 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0082@012C 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
300 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0083@012D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
301 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0084@012E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
302 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0085@012F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
303 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0086@0130 0096.  data16 =  @GetRowBase - $;
--  data16 = 0000000010010110;
304 => X"0096",

-- L0087@0131 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
305 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0088@0132 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
306 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0089@0133 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
307 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0090@0134 0040.  data16 =  64;
--  data16 = 0000000001000000;
308 => X"0040",

-- L0091@0135 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
309 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0092@0136 0015.  data16 =  @NextRow - $;
--  data16 = 0000000000010101;
310 => X"0015",

-- L0093@0137 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
311 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0094@0138 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
312 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0095@0139 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
313 => X"FF3E",

-- L0096@013A 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
314 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0097@013B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
315 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0098@013C FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
316 => X"FF3F",

-- L0099@013D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
317 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0100@013E 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
318 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0102@013F 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
319 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0103@0140 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
320 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0104@0141 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
321 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0106@0142 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
322 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0107@0143 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
323 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0108@0144 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
324 => X"FF3C",

-- L0109@0145 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
325 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0110@0146 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
326 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0111@0147 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
327 => X"FF3D",

-- L0112@0148 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
328 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0113@0149 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
329 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0114@014A 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
330 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0116@014B 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
331 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0117@014C 0000.  data16 =  0;
--  data16 = 0000000000000000;
332 => X"0000",

-- L0118@014D 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
333 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0119@014E 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
334 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0120@014F 0020.  data16 =  32;
--  data16 = 0000000000100000;
335 => X"0020",

-- L0121@0150 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
336 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0122@0151 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
337 => X"0003",

-- L0123@0152 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
338 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0124@0153 FFE4.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111100100;
339 => X"FFE4",

-- L0126@0154 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
340 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0127@0155 0000.  data16 =  0;
--  data16 = 0000000000000000;
341 => X"0000",

-- L0128@0156 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
342 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0129@0157 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
343 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0130@0158 0000.  data16 =  0;
--  data16 = 0000000000000000;
344 => X"0000",

-- L0131@0159 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
345 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0132@015A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
346 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0133@015B 006B.  data16 =  @GetRowBase - $;
--  data16 = 0000000001101011;
347 => X"006B",

-- L0134@015C 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
348 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0135@015D 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
349 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0136@015E 0040.  data16 =  64;
--  data16 = 0000000001000000;
350 => X"0040",

-- L0137@015F 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
351 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0138@0160 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
352 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0139@0161 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
353 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0140@0162 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
354 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0141@0163 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
355 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0142@0164 0040.  data16 =  64;
--  data16 = 0000000001000000;
356 => X"0040",

-- L0143@0165 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
357 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0144@0166 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
358 => X"0003",

-- L0145@0167 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
359 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@0168 FFF4.  data16 =  @NxtCol - $;
--  data16 = 1111111111110100;
360 => X"FFF4",

-- L0147@0169 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
361 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0148@016A 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
362 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0149@016B 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
363 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0150@016C 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
364 => X"001F",

-- L0151@016D C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
365 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0152@016E 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
366 => X"0003",

-- L0153@016F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
367 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0154@0170 FFE6.  data16 =  @NxtRow - $;
--  data16 = 1111111111100110;
368 => X"FFE6",

-- L0156@0171 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
369 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0157@0172 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
370 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0158@0173 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
371 => X"001F",

-- L0159@0174 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
372 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0160@0175 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
373 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0161@0176 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
374 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0162@0177 002C.  data16 =  @ClearRow - $;
--  data16 = 0000000000101100;
375 => X"002C",

-- L0163@0178 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
376 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0164@0179 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
377 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@017A 0002.  data16 =  @SetX0 - $;
--  data16 = 0000000000000010;
378 => X"0002",

-- L0167@017B 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
379 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0168@017C 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
380 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0169@017D 0000.  data16 =  0;
--  data16 = 0000000000000000;
381 => X"0000",

-- L0170@017E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
382 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0171@017F FFB8.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110111000;
383 => X"FFB8",

-- L0173@0180 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
384 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0174@0181 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
385 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0175@0182 0000.  data16 =  0;
--  data16 = 0000000000000000;
386 => X"0000",

-- L0176@0183 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
387 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0177@0184 0003.  data16 =  @PrevRow - $;
--  data16 = 0000000000000011;
388 => X"0003",

-- L0178@0185 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
389 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0179@0186 FFB1.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110110001;
390 => X"FFB1",

-- L0180@0187 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
391 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0181@0188 0000.  data16 =  0;
--  data16 = 0000000000000000;
392 => X"0000",

-- L0182@0189 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
393 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0183@018A FFAD.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110101101;
394 => X"FFAD",

-- L0184@018B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
395 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0185@018C 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
396 => X"003F",

-- L0186@018D 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
397 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0187@018E FFA9.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110101001;
398 => X"FFA9",

-- L0189@018F 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
399 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0190@0190 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
400 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0191 FFBC.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111100;
401 => X"FFBC",

-- L0193@0192 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
402 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0194@0193 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
403 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0195@0194 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
404 => X"0020",

-- L0196@0195 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
405 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0197@0196 0000.  data16 =  0;
--  data16 = 0000000000000000;
406 => X"0000",

-- L0198@0197 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
407 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0199@0198 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
408 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0200@0199 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
409 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0201@019A 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
410 => X"0009",

-- L0202@019B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
411 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0203@019C 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
412 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0204@019D 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
413 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0205@019E 0020.  data16 =  32;
--  data16 = 0000000000100000;
414 => X"0020",

-- L0206@019F C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
415 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0207@01A0 0011.  data16 =  @vga_home1 - $;
--  data16 = 0000000000010001;
416 => X"0011",

-- L0208@01A1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
417 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0209@01A2 FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
418 => X"FFF5",

-- L0211@01A3 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
419 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0212@01A4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
420 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0213@01A5 0021.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100001;
421 => X"0021",

-- L0214@01A6 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
422 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0215@01A7 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
423 => X"0020",

-- L0216@01A8 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
424 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0217@01A9 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
425 => X"0007",

-- L0218@01AA 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
426 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0219@01AB B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
427 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0220@01AC 0003.  data16 =  @ClrDone - $;
--  data16 = 0000000000000011;
428 => X"0003",

-- L0221@01AD 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
429 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0222@01AE FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
430 => X"FFFC",

-- L0223@01AF 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
431 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0225@01B0 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
432 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0226@01B1 1120.vga_home1:  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
433 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0227@01B2 0000.  data16 =  0;
--  data16 = 0000000000000000;
434 => X"0000",

-- L0228@01B3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
435 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0229@01B4 FF83.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110000011;
436 => X"FF83",

-- L0231@01B5 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
437 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0232@01B6 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
438 => X"FF3C",

-- L0233@01B7 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
439 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0234@01B8 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
440 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0235@01B9 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
441 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0236@01BA FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
442 => X"FF3D",

-- L0237@01BB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
443 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0238@01BC 0007.  data16 =  @GetCursorY - $;
--  data16 = 0000000000000111;
444 => X"0007",

-- L0240@01BD 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
445 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0241@01BE FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
446 => X"FF3E",

-- L0242@01BF 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
447 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0243@01C0 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
448 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0244@01C1 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
449 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0245@01C2 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
450 => X"FF3F",

-- L0246@01C3 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
451 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0247@01C4 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
452 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0248@01C5 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
453 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0250@01C6 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
454 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0251@01C7 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
455 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0252@01C8 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
456 => X"FF00",

-- L0253@01C9 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
457 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0254@01CA 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
458 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0255@01CB 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
459 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0256@01CC 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
460 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0258@01CD 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
461 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0259@01CE 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
462 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0260@01CF 0006.  data16 =  @OutStrDone - $;
--  data16 = 0000000000000110;
463 => X"0006",

-- L0261@01D0 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
464 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0262@01D1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
465 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0263@01D2 FF3B.  data16 =  @VGA_OutChr - $;
--  data16 = 1111111100111011;
466 => X"FF3B",

-- L0264@01D3 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
467 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0265@01D4 FFF9.  data16 =  @VGA_OutStr - $;
--  data16 = 1111111111111001;
468 => X"FFF9",

-- L0266@01D5 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
469 => X"4" & O"0" & O"0" & O"0" & O"2",

-- 559 location(s) in following ranges will be filled with default value
-- 0003 .. 0007
-- 01D6 .. 03FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

