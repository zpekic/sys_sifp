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
constant CODE_ADDRESS_WIDTH: 	positive := 12;
constant CODE_ADDRESS_LAST: 	positive := 4095;


type cpu_code_memory is array(0 to 4095) of std_logic_vector(15 downto 0);

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

-- L0019@0000 5FFF.  r_p = STP4, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0101, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
0 => X"5" & O"7" & O"7" & O"7" & O"7",

-- L0020@0001 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
1 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0021@0002 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0022@0003 0037.  data16 = @ Init;
--  data16 = 0000000000110111;
3 => X"0037",

-- L0028@0008 0E03.IntHandler:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
8 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0029@0009 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
9 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0030@000A 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
10 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0032@000B 6FFF.  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
11 => X"6" & O"7" & O"7" & O"7" & O"7",

-- L0034@000C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
12 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0035@000D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@000E 0251.  data16 = !$ + 1 + @ GetOldCrsXY;
--  data16 = 0000001001010001;
14 => X"0251",

-- L0037@000F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
15 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0038@0010 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
16 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0011 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
17 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0040@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@0013 025D.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001011101;
19 => X"025D",

-- L0042@0014 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0043@0015 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0044@0016 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
22 => X"FF7F",

-- L0045@0017 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
23 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0046@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0047@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@001A 024D.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001001001101;
26 => X"024D",

-- L0049@001B 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
27 => X"0" & O"0" & O"1" & O"0" & O"2",

-- L0050@001C 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
28 => X"0" & O"0" & O"0" & O"1" & O"2",

-- L0051@001D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0052@001E 0003.  data16 = !$ + 1 + @ CheckY;
--  data16 = 0000000000000011;
30 => X"0003",

-- L0053@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0054@0020 0003.  data16 = !$ + 1 + @ NoFlip;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0055@0021 D000.CheckY:  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0056@0022 0006.  data16 = !$ + 1 + @ Flip;
--  data16 = 0000000000000110;
34 => X"0006",

-- L0057@0023 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
35 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0058@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@0025 01C7.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000111000111;
37 => X"01C7",

-- L0060@0026 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0061@0027 000B.  data16 = !$ + 1 + @ IntExit;
--  data16 = 0000000000001011;
39 => X"000B",

-- L0063@0028 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
40 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0064@0029 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0065@002A 023D.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000111101;
42 => X"023D",

-- L0066@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0067@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0068@002D 0243.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001000011;
45 => X"0243",

-- L0069@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0070@002F 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0071@0030 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
48 => X"0080",

-- L0072@0031 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0074@0032 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0075@0033 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
51 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0076@0034 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0077@0035 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0078@0036 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
54 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0081@0037 6003.Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0082@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0083@0039 0159.  data16 = !$ + 1 + @ VGA_Init;
--  data16 = 0000000101011001;
57 => X"0159",

-- L0085@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0086@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0087@003C 00F8.  data16 = !$ + 1 + @ UART_Init;
--  data16 = 0000000011111000;
60 => X"00F8",

-- L0090@003D 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0091@003E 6003.PrintLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0092@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0093@0040 00FD.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000011111101;
64 => X"00FD",

-- L0094@0041 6003.PrintLoop1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0095@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@0043 00C6.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000011000110;
67 => X"00C6",

-- L0097@0044 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0098@0045 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
69 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0099@0046 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
70 => X"0003",

-- L0100@0047 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
71 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0101@0048 000C.  data16 = !$ + 1 + @ Continue;
--  data16 = 0000000000001100;
72 => X"000C",

-- L0102@0049 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
73 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0103@004A 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0104@004B 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
75 => X"000D",

-- L0105@004C 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0106@004D 0003.  data16 = !$ + 1 + @ PrintLF;
--  data16 = 0000000000000011;
77 => X"0003",

-- L0107@004E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0108@004F FFEF.  data16 = !$ + 1 + @ PrintLoop;
--  data16 = 1111111111101111;
79 => X"FFEF",

-- L0109@0050 1800.PrintLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
80 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0110@0051 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
81 => X"000A",

-- L0111@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0112@0053 FFEE.  data16 = !$ + 1 + @ PrintLoop1;
--  data16 = 1111111111101110;
83 => X"FFEE",

-- L0114@0054 0802.Continue:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
84 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0115@0055 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
85 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0116@0056 0299.  data16 =  @StrReady;
--  data16 = 0000001010011001;
86 => X"0299",

-- L0117@0057 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
87 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0118@0058 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0119@0059 00B0.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000010110000;
89 => X"00B0",

-- L0121@005A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
90 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0122@005B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@005C 020B.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000001011;
92 => X"020B",

-- L0124@005D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
93 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0125@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0126@005F 018D.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000110001101;
95 => X"018D",

-- L0128@0060 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
96 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0129@0061 89AB.  data16 =  0x89AB;
--  data16 = 1000100110101011;
97 => X"89AB",

-- L0130@0062 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
98 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0131@0063 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
99 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@0064 00AC.  data16 = !$ + 1 + @ PrintHex;
--  data16 = 0000000010101100;
100 => X"00AC",

-- L0134@0065 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
101 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0139@0066 1020.MainLoop:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
102 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0140@0067 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
103 => X"FF40",

-- L0143@0068 1900.  LDX, LDA, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 000, r_s = 000;
104 => X"1" & O"4" & O"4" & O"0" & O"0",

-- L0144@0069 0000.  data16 =  0;
--  data16 = 0000000000000000;
105 => X"0000",

-- L0145@006A 0FB0.TxtClear:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
106 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0146@006B 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
107 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0147@006C 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
108 => X"0010",

-- L0148@006D A000.  IF_XC;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
109 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0149@006E 0003.  data16 = !$ + 1 + @ TxtCleared;
--  data16 = 0000000000000011;
110 => X"0003",

-- L0150@006F 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
111 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0151@0070 FFFA.  data16 = !$ + 1 + @ TxtClear;
--  data16 = 1111111111111010;
112 => X"FFFA",

-- L0153@0071 1100.TxtCleared:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
113 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0154@0072 0000.  data16 =  0;
--  data16 = 0000000000000000;
114 => X"0000",

-- L0156@0073 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
115 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0157@0074 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0158@0075 002B.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 0000000000101011;
117 => X"002B",

-- L0159@0076 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
118 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0160@0077 0014.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000010100;
119 => X"0014",

-- L0163@0078 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
120 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0164@0079 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
121 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@007A 0086.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000010000110;
122 => X"0086",

-- L0168@007B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
123 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0169@007C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0170@007D 0005.  data16 = !$ + 1 + @ CmdExec;
--  data16 = 0000000000000101;
125 => X"0005",

-- L0171@007E 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0172@007F 000C.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000001100;
127 => X"000C",

-- L0175@0080 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
128 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0176@0081 FFE5.  data16 = !$ + 1 + @ MainLoop;
--  data16 = 1111111111100101;
129 => X"FFE5",

-- L0181@0082 6003.CmdExec:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
130 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0182@0083 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0183@0084 00CC.  data16 = !$ + 1 + @ UART_IsBrk;
--  data16 = 0000000011001100;
132 => X"00CC",

-- L0184@0085 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
133 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0185@0086 0004.  data16 = !$ + 1 + @ CmdBreak;
--  data16 = 0000000000000100;
134 => X"0004",

-- L0186@0087 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
135 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0187@0088 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
136 => X"FFFF",

-- L0188@0089 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
137 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0189@008A 4002.CmdBreak:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
138 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0191@008B 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
139 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0192@008C 0280.  data16 =  @StrBreak;
--  data16 = 0000001010000000;
140 => X"0280",

-- L0193@008D 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
141 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0194@008E 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
142 => X"0003",

-- L0195@008F 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
143 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0196@0090 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
144 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0197@0091 006F.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101111;
145 => X"006F",

-- L0198@0092 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
146 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0199@0093 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
147 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0200@0094 028A.  data16 =  @StrError;
--  data16 = 0000001010001010;
148 => X"028A",

-- L0201@0095 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
149 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0202@0096 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0203@0097 0069.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101001;
151 => X"0069",

-- L0204@0098 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
152 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0205@0099 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
153 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0206@009A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
154 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0207@009B FF64.  data16 = !$ + 1 + @ PrintHexA;
--  data16 = 1111111101100100;
155 => X"FF64",

-- L0208@009C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
156 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0209@009D 029F.  data16 =  @StrEnd;
--  data16 = 0000001010011111;
157 => X"029F",

-- L0210@009E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0211@009F 0061.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001100001;
159 => X"0061",

-- L0213@00A0 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
160 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0214@00A1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
161 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0215@00A2 009B.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000010011011;
162 => X"009B",

-- L0216@00A3 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
163 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0218@00A4 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
164 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0219@00A5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
165 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0220@00A6 0063.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000001100011;
166 => X"0063",

-- L0222@00A7 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
167 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0223@00A8 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
168 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0224@00A9 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
169 => X"000D",

-- L0225@00AA 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
170 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0226@00AB 0027.  data16 = !$ + 1 + @ LeaveEdit;
--  data16 = 0000000000100111;
171 => X"0027",

-- L0228@00AC 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
172 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0229@00AD 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
173 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0230@00AE 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
174 => X"0003",

-- L0231@00AF 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
175 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0232@00B0 001B.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000011011;
176 => X"001B",

-- L0234@00B1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
177 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0235@00B2 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
178 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0236@00B3 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
179 => X"0001",

-- L0237@00B4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
180 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0238@00B5 0016.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010110;
181 => X"0016",

-- L0240@00B6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
182 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0241@00B7 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
183 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0242@00B8 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
184 => X"0002",

-- L0243@00B9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
185 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0244@00BA 0011.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010001;
186 => X"0011",

-- L0246@00BB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
187 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0247@00BC 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
188 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0248@00BD 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
189 => X"0008",

-- L0249@00BE 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0250@00BF 0019.  data16 = !$ + 1 + @ BSEdit;
--  data16 = 0000000000011001;
191 => X"0019",

-- L0253@00C0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
192 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0254@00C1 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
193 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0255@00C2 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
194 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0256@00C3 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
195 => X"0010",

-- L0257@00C4 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
196 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0258@00C5 0028.  data16 = !$ + 1 + @ BumpEnd;
--  data16 = 0000000000101000;
197 => X"0028",

-- L0259@00C6 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
198 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0260@00C7 0000.  data16 =  0;
--  data16 = 0000000000000000;
199 => X"0000",

-- L0261@00C8 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
200 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0262@00C9 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
201 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0263@00CA FFD6.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111010110;
202 => X"FFD6",

-- L0266@00CB 0802.BrkEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
203 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0267@00CC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
204 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0268@00CD 0001.  data16 =  1;
--  data16 = 0000000000000001;
205 => X"0001",

-- L0269@00CE 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
206 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0270@00CF 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
207 => X"0003",

-- L0271@00D0 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
208 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0272@00D1 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
209 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0275@00D2 0802.LeaveEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
210 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0276@00D3 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
211 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0277@00D4 0000.  data16 =  0;
--  data16 = 0000000000000000;
212 => X"0000",

-- L0278@00D5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
213 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0279@00D6 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
214 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0280@00D7 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
215 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0283@00D8 0802.BSEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
216 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0284@00D9 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
217 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0285@00DA 0000.  data16 =  0;
--  data16 = 0000000000000000;
218 => X"0000",

-- L0286@00DB 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
219 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0287@00DC 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
220 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0288@00DD 0000.  data16 =  0;
--  data16 = 0000000000000000;
221 => X"0000",

-- L0289@00DE B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
222 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0290@00DF 0003.  data16 = !$ + 1 + @ BumpStart;
--  data16 = 0000000000000011;
223 => X"0003",

-- L0291@00E0 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
224 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0292@00E1 FFBF.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111110111111;
225 => X"FFBF",

-- L0294@00E2 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
226 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0295@00E3 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
227 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0296@00E4 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
228 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0297@00E5 0292.  data16 =  @StrBeep;
--  data16 = 0000001010010010;
229 => X"0292",

-- L0298@00E6 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
230 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0299@00E7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
231 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0300@00E8 0018.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000000011000;
232 => X"0018",

-- L0301@00E9 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
233 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0302@00EA 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
234 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0303@00EB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
235 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0304@00EC FFB4.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111110110100;
236 => X"FFB4",

-- L0306@00ED 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
237 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0307@00EE 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
238 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0308@00EF 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
239 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0309@00F0 0294.  data16 =  @StrBack;
--  data16 = 0000001010010100;
240 => X"0294",

-- L0310@00F1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
241 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0311@00F2 FFF4.  data16 = !$ + 1 + @ Bumped;
--  data16 = 1111111111110100;
242 => X"FFF4",

-- L0003@00F3 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
243 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@00F4 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
244 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@00F5 0000.  data16 =  0;
--  data16 = 0000000000000000;
245 => X"0000",

-- L0006@00F6 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
246 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@00F7 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
247 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@00F8 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
248 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@00F9 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
249 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@00FA FFFE.  data16 = !$ + 1 + @ ACDone;
--  data16 = 1111111111111110;
250 => X"FFFE",

-- L0013@00FB 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
251 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00FC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
252 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@00FD FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
253 => X"FFFF",

-- L0016@00FE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
254 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@00FF FFF7.  data16 = !$ + 1 + @ ACSet;
--  data16 = 1111111111110111;
255 => X"FFF7",

-- L0019@0100 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
256 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0020@0101 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
257 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0021@0102 0006.  data16 = !$ + 1 + @ PrintDone;
--  data16 = 0000000000000110;
258 => X"0006",

-- L0022@0103 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
259 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0023@0104 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
260 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0024@0105 0004.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000000000100;
261 => X"0004",

-- L0025@0106 2010.  INY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
262 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0026@0107 FFF9.  data16 = !$ + 1 + @ Print;
--  data16 = 1111111111111001;
263 => X"FFF9",

-- L0027@0108 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
264 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0029@0109 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
265 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0030@010A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
266 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@010B 00A3.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 0000000010100011;
267 => X"00A3",

-- L0032@010C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
268 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@010D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
269 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@010E 0061.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 0000000001100001;
270 => X"0061",

-- L0035@010F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
271 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0037@0110 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
272 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0038@0111 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
273 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0112 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
274 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0040@0113 02A2.  data16 = @ StrHex;
--  data16 = 0000001010100010;
275 => X"02A2",

-- L0042@0114 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
276 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0043@0115 000C.  data16 =  12;
--  data16 = 0000000000001100;
277 => X"000C",

-- L0044@0116 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
278 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0045@0117 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
279 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0047@0118 1040.SrcLoopX:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
280 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0048@0119 0000.  data16 =  0;
--  data16 = 0000000000000000;
281 => X"0000",

-- L0049@011A B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
282 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0050@011B 0003.  data16 = !$ + 1 + @ PrintNib;
--  data16 = 0000000000000011;
283 => X"0003",

-- L0051@011C 26C0.  DEX, SRC, BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
284 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0052@011D FFFB.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111111011;
285 => X"FFFB",

-- L0054@011E 1C00.PrintNib:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
286 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0055@011F 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
287 => X"000F",

-- L0056@0120 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
288 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0057@0121 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
289 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0058@0122 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
290 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0059@0123 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
291 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0060@0124 FFE5.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 1111111111100101;
292 => X"FFE5",

-- L0062@0125 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
293 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0063@0126 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
294 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0064@0127 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
295 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0065@0128 0009.  data16 = !$ + 1 + @ PrintHexEx;
--  data16 = 0000000000001001;
296 => X"0009",

-- L0066@0129 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
297 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0067@012A 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
298 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0068@012B 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
299 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0069@012C 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
300 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0070@012D 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
301 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0071@012E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
302 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0072@012F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
303 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0073@0130 FFE8.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111101000;
304 => X"FFE8",

-- L0075@0131 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
305 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0076@0132 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
306 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0077@0133 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
307 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0134 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
308 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0135 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
309 => X"2000",

-- L0004@0136 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
310 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0137 0003.  data16 =  3;
--  data16 = 0000000000000011;
311 => X"0003",

-- L0006@0138 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
312 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@0139 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
313 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@013A 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
314 => X"0010",

-- L0009@013B 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
315 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@013C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
316 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@013D 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
317 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0013@013E 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
318 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0014@013F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
319 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0015@0140 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
320 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0016@0141 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
321 => X"2000",

-- L0017@0142 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
322 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0018@0143 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
323 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0019@0144 003A.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000111010;
324 => X"003A",

-- L0020@0145 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
325 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0021@0146 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
326 => X"0001",

-- L0022@0147 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
327 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@0148 FFFA.  data16 = !$ + 1 + @ RdStatus0;
--  data16 = 1111111111111010;
328 => X"FFFA",

-- L0024@0149 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
329 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0025@014A 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
330 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@014B 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
331 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0027@014C 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
332 => X"00FF",

-- L0028@014D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
333 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0029@014E 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
334 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0030@014F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
335 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@0150 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
336 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0033@0151 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
337 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0034@0152 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
338 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0035@0153 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
339 => X"2000",

-- L0036@0154 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
340 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0037@0155 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
341 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@0156 0028.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000101000;
342 => X"0028",

-- L0039@0157 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
343 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0040@0158 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
344 => X"0001",

-- L0041@0159 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
345 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0042@015A 0009.  data16 = !$ + 1 + @ NoBrk;
--  data16 = 0000000000001001;
346 => X"0009",

-- L0044@015B 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
347 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0045@015C 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
348 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0046@015D 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
349 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0047@015E 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
350 => X"00FF",

-- L0048@015F 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
351 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0049@0160 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
352 => X"0003",

-- L0050@0161 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
353 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0051@0162 0005.  data16 = !$ + 1 + @ Brk;
--  data16 = 0000000000000101;
354 => X"0005",

-- L0053@0163 1800.NoBrk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
355 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0054@0164 0000.  data16 =  0;
--  data16 = 0000000000000000;
356 => X"0000",

-- L0055@0165 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
357 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0056@0166 0004.  data16 = !$ + 1 + @ BrkExit;
--  data16 = 0000000000000100;
358 => X"0004",

-- L0057@0167 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
359 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0058@0168 0001.  data16 =  1;
--  data16 = 0000000000000001;
360 => X"0001",

-- L0059@0169 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
361 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0060@016A 0022.BrkExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
362 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0061@016B 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
363 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0062@016C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
364 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0064@016D 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
365 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0065@016E 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
366 => X"0007",

-- L0066@016F 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
367 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0067@0170 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
368 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0068@0171 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
369 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0069@0172 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
370 => X"2000",

-- L0070@0173 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
371 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0071@0174 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
372 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0072@0175 0009.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000001001;
373 => X"0009",

-- L0073@0176 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
374 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0074@0177 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
375 => X"0002",

-- L0075@0178 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
376 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0076@0179 FFFA.  data16 = !$ + 1 + @ RdStatus1;
--  data16 = 1111111111111010;
377 => X"FFFA",

-- L0077@017A 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
378 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0078@017B 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
379 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0079@017C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
380 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0080@017D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
381 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0082@017E 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
382 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0083@017F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
383 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0084@0180 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
384 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0085@0181 0206.  XOR, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
385 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0086@0182 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
386 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0087@0183 0004.  data16 = !$ + 1 + @ StIsStable;
--  data16 = 0000000000000100;
387 => X"0004",

-- L0088@0184 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
388 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0089@0185 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
389 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@0186 FFF8.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 1111111111111000;
390 => X"FFF8",

-- L0091@0187 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
391 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0092@0188 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
392 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0094@0189 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
393 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0095@018A 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
394 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0096@018B 0006.  data16 = !$ + 1 + @ UART_Done;
--  data16 = 0000000000000110;
395 => X"0006",

-- L0097@018C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
396 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0098@018D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
397 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0099@018E FFE1.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 1111111111100001;
398 => X"FFE1",

-- L0100@018F 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
399 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0101@0190 FFF9.  data16 = !$ + 1 + @ UART_OutStr;
--  data16 = 1111111111111001;
400 => X"FFF9",

-- L0102@0191 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
401 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@0192 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
402 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0011@0193 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
403 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0012@0194 FF5F.  data16 = !$ + 1 + @ CLC;
--  data16 = 1111111101011111;
404 => X"FF5F",

-- L0013@0195 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
405 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@0196 0040.  data16 =  64;
--  data16 = 0000000001000000;
406 => X"0040",

-- L0015@0197 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
407 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0016@0198 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
408 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0017@0199 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
409 => X"1000",

-- L0018@019A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
410 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0019@019B 0020.  data16 =  32;
--  data16 = 0000000000100000;
411 => X"0020",

-- L0020@019C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
412 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0021@019D FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
413 => X"FF00",

-- L0022@019E 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
414 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0023@019F 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
415 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@01A0 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
416 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0025@01A1 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
417 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0026@01A2 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
418 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0027@01A3 0003.  data16 = !$ + 1 + @ RowOffDone;
--  data16 = 0000000000000011;
419 => X"0003",

-- L0028@01A4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
420 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@01A5 FFFA.  data16 = !$ + 1 + @ RowOffLoop;
--  data16 = 1111111111111010;
421 => X"FFFA",

-- L0030@01A6 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
422 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@01A7 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
423 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0032@01A8 0000.  data16 =  0;
--  data16 = 0000000000000000;
424 => X"0000",

-- L0033@01A9 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
425 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@01AA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
426 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@01AB 0041.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000001000001;
427 => X"0041",

-- L0036@01AC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
428 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0037@01AD 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
429 => X"0001",

-- L0041@01AE 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
430 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0042@01AF 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
431 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0043@01B0 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
432 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0045@01B1 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
433 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0046@01B2 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
434 => X"0002",

-- L0047@01B3 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
435 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@01B4 00A6.  data16 = !$ + 1 + @ VGA_HOME;
--  data16 = 0000000010100110;
436 => X"00A6",

-- L0050@01B5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
437 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0051@01B6 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
438 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0052@01B7 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
439 => X"0001",

-- L0053@01B8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
440 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0054@01B9 0083.  data16 = !$ + 1 + @ VGA_CLS;
--  data16 = 0000000010000011;
441 => X"0083",

-- L0056@01BA 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
442 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0057@01BB 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
443 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0058@01BC 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
444 => X"0007",

-- L0059@01BD 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
445 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0060@01BE 002A.  data16 = !$ + 1 + @ VGA_Ignore;
--  data16 = 0000000000101010;
446 => X"002A",

-- L0062@01BF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
447 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0063@01C0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
448 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0064@01C1 00A6.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000000010100110;
449 => X"00A6",

-- L0066@01C2 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
450 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0067@01C3 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
451 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0068@01C4 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
452 => X"000D",

-- L0069@01C5 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
453 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0070@01C6 005F.  data16 = !$ + 1 + @ VGA_CR;
--  data16 = 0000000001011111;
454 => X"005F",

-- L0072@01C7 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
455 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0073@01C8 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
456 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0074@01C9 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
457 => X"000A",

-- L0075@01CA 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
458 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0076@01CB 006E.  data16 = !$ + 1 + @ VGA_LF;
--  data16 = 0000000001101110;
459 => X"006E",

-- L0078@01CC 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
460 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0079@01CD 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
461 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0080@01CE 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
462 => X"0008",

-- L0081@01CF 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
463 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0082@01D0 005A.  data16 = !$ + 1 + @ VGA_BS;
--  data16 = 0000000001011010;
464 => X"005A",

-- L0085@01D1 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
465 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0087@01D2 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
466 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0088@01D3 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
467 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0089@01D4 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
468 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0090@01D5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
469 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0091@01D6 009A.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000010011010;
470 => X"009A",

-- L0092@01D7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
471 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0093@01D8 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
472 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0094@01D9 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
473 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0095@01DA 0040.  data16 =  64;
--  data16 = 0000000001000000;
474 => X"0040",

-- L0096@01DB A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
475 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0097@01DC 0019.  data16 = !$ + 1 + @ NextRow;
--  data16 = 0000000000011001;
476 => X"0019",

-- L0098@01DD 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
477 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0099@01DE 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
478 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0100@01DF FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
479 => X"FF3E",

-- L0101@01E0 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
480 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0102@01E1 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
481 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0103@01E2 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
482 => X"FF3F",

-- L0104@01E3 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
483 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0105@01E4 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
484 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0107@01E5 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
485 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0108@01E6 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
486 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0109@01E7 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
487 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0111@01E8 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
488 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0112@01E9 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
489 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0113@01EA 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
490 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0114@01EB 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
491 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0116@01EC 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
492 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0117@01ED 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
493 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0118@01EE FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
494 => X"FF3C",

-- L0119@01EF 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
495 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0120@01F0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
496 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0121@01F1 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
497 => X"FF3D",

-- L0122@01F2 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
498 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0123@01F3 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
499 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0124@01F4 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
500 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0126@01F5 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
501 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0127@01F6 0000.  data16 =  0;
--  data16 = 0000000000000000;
502 => X"0000",

-- L0128@01F7 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
503 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0129@01F8 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
504 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0130@01F9 0020.  data16 =  32;
--  data16 = 0000000000100000;
505 => X"0020",

-- L0131@01FA C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
506 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0132@01FB 0003.  data16 = !$ + 1 + @ ScrollUp;
--  data16 = 0000000000000011;
507 => X"0003",

-- L0133@01FC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
508 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0134@01FD FFE0.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111111100000;
509 => X"FFE0",

-- L0136@01FE 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
510 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0137@01FF 0000.  data16 =  0;
--  data16 = 0000000000000000;
511 => X"0000",

-- L0138@0200 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
512 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0139@0201 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
513 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0140@0202 0000.  data16 =  0;
--  data16 = 0000000000000000;
514 => X"0000",

-- L0141@0203 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
515 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0142@0204 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
516 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0143@0205 006B.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000001101011;
517 => X"006B",

-- L0144@0206 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
518 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0145@0207 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
519 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0146@0208 0040.  data16 =  64;
--  data16 = 0000000001000000;
520 => X"0040",

-- L0147@0209 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
521 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0148@020A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
522 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0149@020B 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
523 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0150@020C 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
524 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0151@020D 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
525 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0152@020E 0040.  data16 =  64;
--  data16 = 0000000001000000;
526 => X"0040",

-- L0153@020F A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
527 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0154@0210 0003.  data16 = !$ + 1 + @ ChkRow;
--  data16 = 0000000000000011;
528 => X"0003",

-- L0155@0211 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
529 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0156@0212 FFF4.  data16 = !$ + 1 + @ NxtCol;
--  data16 = 1111111111110100;
530 => X"FFF4",

-- L0157@0213 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
531 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0158@0214 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
532 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0159@0215 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
533 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0160@0216 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
534 => X"001F",

-- L0161@0217 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
535 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0162@0218 0003.  data16 = !$ + 1 + @ ClrLastRow;
--  data16 = 0000000000000011;
536 => X"0003",

-- L0163@0219 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
537 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0164@021A FFE6.  data16 = !$ + 1 + @ NxtRow;
--  data16 = 1111111111100110;
538 => X"FFE6",

-- L0166@021B 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
539 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0167@021C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
540 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0168@021D 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
541 => X"001F",

-- L0169@021E 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
542 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0170@021F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
543 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0171@0220 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
544 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0172@0221 002C.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000101100;
545 => X"002C",

-- L0173@0222 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
546 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0174@0223 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
547 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0175@0224 0002.  data16 = !$ + 1 + @ SetX0;
--  data16 = 0000000000000010;
548 => X"0002",

-- L0177@0225 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
549 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0178@0226 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
550 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0179@0227 0000.  data16 =  0;
--  data16 = 0000000000000000;
551 => X"0000",

-- L0180@0228 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
552 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0181@0229 FFB4.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110100;
553 => X"FFB4",

-- L0183@022A 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
554 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0184@022B 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
555 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0185@022C 0000.  data16 =  0;
--  data16 = 0000000000000000;
556 => X"0000",

-- L0186@022D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
557 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0187@022E 0003.  data16 = !$ + 1 + @ PrevRow;
--  data16 = 0000000000000011;
558 => X"0003",

-- L0188@022F 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
559 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0189@0230 FFAD.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101101;
560 => X"FFAD",

-- L0190@0231 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
561 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0191@0232 0000.  data16 =  0;
--  data16 = 0000000000000000;
562 => X"0000",

-- L0192@0233 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
563 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0193@0234 FFA9.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101001;
564 => X"FFA9",

-- L0194@0235 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
565 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0195@0236 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
566 => X"003F",

-- L0196@0237 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
567 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0197@0238 FFA5.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110100101;
568 => X"FFA5",

-- L0199@0239 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
569 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0200@023A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
570 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0201@023B FFBC.  data16 = !$ + 1 + @ NextRow1;
--  data16 = 1111111110111100;
571 => X"FFBC",

-- L0203@023C 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
572 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0204@023D 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
573 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0205@023E 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
574 => X"0020",

-- L0206@023F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
575 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0207@0240 0000.  data16 =  0;
--  data16 = 0000000000000000;
576 => X"0000",

-- L0208@0241 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
577 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0209@0242 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
578 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0210@0243 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
579 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0211@0244 0009.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000001001;
580 => X"0009",

-- L0212@0245 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
581 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0213@0246 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
582 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0214@0247 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
583 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0215@0248 0020.  data16 =  32;
--  data16 = 0000000000100000;
584 => X"0020",

-- L0216@0249 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
585 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0217@024A 0011.  data16 = !$ + 1 + @ vga_home1;
--  data16 = 0000000000010001;
586 => X"0011",

-- L0218@024B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
587 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0219@024C FFF5.  data16 = !$ + 1 + @ ClrNextRow;
--  data16 = 1111111111110101;
588 => X"FFF5",

-- L0221@024D 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
589 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0222@024E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
590 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0223@024F 0021.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000000100001;
591 => X"0021",

-- L0224@0250 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
592 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0225@0251 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
593 => X"0020",

-- L0226@0252 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
594 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0227@0253 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
595 => X"0007",

-- L0228@0254 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
596 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0229@0255 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
597 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0230@0256 0003.  data16 = !$ + 1 + @ ClrDone;
--  data16 = 0000000000000011;
598 => X"0003",

-- L0231@0257 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
599 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0232@0258 FFFC.  data16 = !$ + 1 + @ ClrRLoop;
--  data16 = 1111111111111100;
600 => X"FFFC",

-- L0233@0259 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
601 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0235@025A 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
602 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0236@025B 1120.vga_home1:  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
603 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0237@025C 0000.  data16 =  0;
--  data16 = 0000000000000000;
604 => X"0000",

-- L0238@025D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
605 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0239@025E FF7F.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111101111111;
606 => X"FF7F",

-- L0241@025F 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
607 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0242@0260 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
608 => X"FF3C",

-- L0243@0261 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
609 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0244@0262 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
610 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0245@0263 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
611 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0246@0264 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
612 => X"FF3D",

-- L0247@0265 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
613 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0248@0266 0007.  data16 = !$ + 1 + @ GetCursorY;
--  data16 = 0000000000000111;
614 => X"0007",

-- L0250@0267 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
615 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0251@0268 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
616 => X"FF3E",

-- L0252@0269 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
617 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0253@026A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
618 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0254@026B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
619 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0255@026C FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
620 => X"FF3F",

-- L0256@026D 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
621 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0257@026E 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
622 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0258@026F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
623 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0260@0270 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
624 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0261@0271 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
625 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0262@0272 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
626 => X"FF00",

-- L0263@0273 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
627 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0264@0274 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
628 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0265@0275 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
629 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0266@0276 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
630 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0268@0277 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
631 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0269@0278 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
632 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0270@0279 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
633 => X"0006",

-- L0271@027A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
634 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0272@027B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
635 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0273@027C FF32.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 1111111100110010;
636 => X"FF32",

-- L0274@027D 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
637 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0275@027E FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
638 => X"FFF9",

-- L0276@027F 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
639 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@0280 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
640 => X"000D",

-- L0004@0281 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
641 => X"000A",

-- L0005@0282 002A.  data16 =  '*';
--  data16 = 0000000000101010;
642 => X"002A",

-- L0006@0283 0042.  data16 =  'B';
--  data16 = 0000000001000010;
643 => X"0042",

-- L0007@0284 0052.  data16 =  'R';
--  data16 = 0000000001010010;
644 => X"0052",

-- L0008@0285 0045.  data16 =  'E';
--  data16 = 0000000001000101;
645 => X"0045",

-- L0009@0286 0041.  data16 =  'A';
--  data16 = 0000000001000001;
646 => X"0041",

-- L0010@0287 004B.  data16 =  'K';
--  data16 = 0000000001001011;
647 => X"004B",

-- L0011@0288 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
648 => X"0007",

-- L0012@0289 0000.  data16 =  0;
--  data16 = 0000000000000000;
649 => X"0000",

-- L0014@028A 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
650 => X"000D",

-- L0015@028B 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
651 => X"000A",

-- L0016@028C 002A.  data16 =  '*';
--  data16 = 0000000000101010;
652 => X"002A",

-- L0017@028D 0045.  data16 =  'E';
--  data16 = 0000000001000101;
653 => X"0045",

-- L0018@028E 0052.  data16 =  'R';
--  data16 = 0000000001010010;
654 => X"0052",

-- L0019@028F 0052.  data16 =  'R';
--  data16 = 0000000001010010;
655 => X"0052",

-- L0020@0290 004F.  data16 =  'O';
--  data16 = 0000000001001111;
656 => X"004F",

-- L0021@0291 0052.  data16 =  'R';
--  data16 = 0000000001010010;
657 => X"0052",

-- L0022@0292 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
658 => X"0007",

-- L0023@0293 0000.  data16 =  0;
--  data16 = 0000000000000000;
659 => X"0000",

-- L0025@0294 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
660 => X"0008",

-- L0026@0295 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
661 => X"0007",

-- L0027@0296 0000.  data16 =  0;
--  data16 = 0000000000000000;
662 => X"0000",

-- L0029@0297 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
663 => X"0001",

-- L0030@0298 0000.  data16 =  0;
--  data16 = 0000000000000000;
664 => X"0000",

-- L0032@0299 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
665 => X"0052",

-- L0033@029A 0065.  data16 =  'e';
--  data16 = 0000000001100101;
666 => X"0065",

-- L0034@029B 0061.  data16 =  'a';
--  data16 = 0000000001100001;
667 => X"0061",

-- L0035@029C 0064.  data16 =  'd';
--  data16 = 0000000001100100;
668 => X"0064",

-- L0036@029D 0079.  data16 =  'y';
--  data16 = 0000000001111001;
669 => X"0079",

-- L0037@029E 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
670 => X"002E",

-- L0038@029F 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
671 => X"000D",

-- L0039@02A0 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
672 => X"000A",

-- L0040@02A1 0000.  data16 =  0;
--  data16 = 0000000000000000;
673 => X"0000",

-- L0042@02A2 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
674 => X"0030",

-- L0043@02A3 0031.  data16 =  '1';
--  data16 = 0000000000110001;
675 => X"0031",

-- L0044@02A4 0032.  data16 =  '2';
--  data16 = 0000000000110010;
676 => X"0032",

-- L0045@02A5 0033.  data16 =  '3';
--  data16 = 0000000000110011;
677 => X"0033",

-- L0046@02A6 0034.  data16 =  '4';
--  data16 = 0000000000110100;
678 => X"0034",

-- L0047@02A7 0035.  data16 =  '5';
--  data16 = 0000000000110101;
679 => X"0035",

-- L0048@02A8 0036.  data16 =  '6';
--  data16 = 0000000000110110;
680 => X"0036",

-- L0049@02A9 0037.  data16 =  '7';
--  data16 = 0000000000110111;
681 => X"0037",

-- L0050@02AA 0038.  data16 =  '8';
--  data16 = 0000000000111000;
682 => X"0038",

-- L0051@02AB 0039.  data16 =  '9';
--  data16 = 0000000000111001;
683 => X"0039",

-- L0052@02AC 0041.  data16 =  'A';
--  data16 = 0000000001000001;
684 => X"0041",

-- L0053@02AD 0042.  data16 =  'B';
--  data16 = 0000000001000010;
685 => X"0042",

-- L0054@02AE 0043.  data16 =  'C';
--  data16 = 0000000001000011;
686 => X"0043",

-- L0055@02AF 0044.  data16 =  'D';
--  data16 = 0000000001000100;
687 => X"0044",

-- L0056@02B0 0045.  data16 =  'E';
--  data16 = 0000000001000101;
688 => X"0045",

-- L0057@02B1 0046.  data16 =  'F';
--  data16 = 0000000001000110;
689 => X"0046",

-- 3410 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02B2 .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

