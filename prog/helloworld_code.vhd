--------------------------------------------------------
-- mcc V1.4.0216 - Custom microcode compiler (c)2020-... 
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
-- L0031.r_a: .valfield 3 values NOA, SBC, XOR, RRC, LDA, ADC, AND, STA|A default NOA;
--
alias cpu_r_a: 	std_logic_vector(2 downto 0) is cpu_uinstruction(11 downto 9);
constant r_a_NOA: 	std_logic_vector(2 downto 0) := O"0";
constant r_a_SBC: 	std_logic_vector(2 downto 0) := O"1";
constant r_a_XOR: 	std_logic_vector(2 downto 0) := O"2";
constant r_a_RRC: 	std_logic_vector(2 downto 0) := O"3";
constant r_a_LDA: 	std_logic_vector(2 downto 0) := O"4";
constant r_a_ADC: 	std_logic_vector(2 downto 0) := O"5";
constant r_a_AND: 	std_logic_vector(2 downto 0) := O"6";
constant r_a_STA: 	std_logic_vector(2 downto 0) := O"7";
constant r_a_A: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_a select r_a <=
--      NOA when r_a_NOA, -- default value
--      SBC when r_a_SBC,
--      XOR when r_a_XOR,
--      RRC when r_a_RRC,
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

-- L0036@000E 0243.  data16 = !$ + 1 + @ GetOldCrsXY;
--  data16 = 0000001001000011;
14 => X"0243",

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

-- L0041@0013 024F.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001001111;
19 => X"024F",

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

-- L0048@001A 023F.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000111111;
26 => X"023F",

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

-- L0059@0025 01BF.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000110111111;
37 => X"01BF",

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

-- L0065@002A 022F.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000101111;
42 => X"022F",

-- L0066@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0067@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0068@002D 0235.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001000110101;
45 => X"0235",

-- L0069@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0070@002F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0083@0039 0152.  data16 = !$ + 1 + @ VGA_Init;
--  data16 = 0000000101010010;
57 => X"0152",

-- L0085@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0086@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0087@003C 00F2.  data16 = !$ + 1 + @ UART_Init;
--  data16 = 0000000011110010;
60 => X"00F2",

-- L0090@003D 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0091@003E 6003.PrintLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0092@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0093@0040 00F7.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000011110111;
64 => X"00F7",

-- L0094@0041 6003.PrintLoop1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0095@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@0043 00C0.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000011000000;
67 => X"00C0",

-- L0097@0044 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0098@0045 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
69 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0103@004A 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0116@0056 028B.  data16 =  @StrReady;
--  data16 = 0000001010001011;
86 => X"028B",

-- L0117@0057 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
87 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0118@0058 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0119@0059 00AA.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000010101010;
89 => X"00AA",

-- L0121@005A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
90 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0122@005B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@005C 01FD.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000000111111101;
92 => X"01FD",

-- L0124@005D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
93 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0125@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0126@005F 0185.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000110000101;
95 => X"0185",

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

-- L0132@0064 00A6.  data16 = !$ + 1 + @ PrintHex;
--  data16 = 0000000010100110;
100 => X"00A6",

-- L0134@0065 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
101 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0139@0066 1020.MainLoop:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
102 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0140@0067 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
103 => X"FF40",

-- L0143@0068 0900.  r_p = NOP, r_a = LDA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 100, r_y = 000, r_s = 000;
104 => X"0" & O"4" & O"4" & O"0" & O"0",

-- L0144@0069 0FB0.TxtClear:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
105 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0145@006A 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
106 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0146@006B 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
107 => X"0010",

-- L0147@006C A000.  IF_XC;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
108 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0148@006D 0003.  data16 = !$ + 1 + @ TxtCleared;
--  data16 = 0000000000000011;
109 => X"0003",

-- L0149@006E 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
110 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0150@006F FFFA.  data16 = !$ + 1 + @ TxtClear;
--  data16 = 1111111111111010;
111 => X"FFFA",

-- L0152@0070 0100.TxtCleared:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
112 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0154@0071 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
113 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0155@0072 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
114 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0156@0073 002B.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 0000000000101011;
115 => X"002B",

-- L0157@0074 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0158@0075 0014.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000010100;
117 => X"0014",

-- L0161@0076 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
118 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0162@0077 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
119 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0163@0078 0082.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000010000010;
120 => X"0082",

-- L0166@0079 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
121 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0167@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0168@007B 0005.  data16 = !$ + 1 + @ CmdExec;
--  data16 = 0000000000000101;
123 => X"0005",

-- L0169@007C 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0170@007D 000C.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000001100;
125 => X"000C",

-- L0173@007E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0174@007F FFE7.  data16 = !$ + 1 + @ MainLoop;
--  data16 = 1111111111100111;
127 => X"FFE7",

-- L0179@0080 6003.CmdExec:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
128 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0180@0081 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0181@0082 00C8.  data16 = !$ + 1 + @ UART_IsBrk;
--  data16 = 0000000011001000;
130 => X"00C8",

-- L0182@0083 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0183@0084 0004.  data16 = !$ + 1 + @ CmdBreak;
--  data16 = 0000000000000100;
132 => X"0004",

-- L0184@0085 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
133 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0185@0086 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
134 => X"FFFF",

-- L0186@0087 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
135 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0187@0088 4002.CmdBreak:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
136 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0189@0089 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
137 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0190@008A 0272.  data16 =  @StrBreak;
--  data16 = 0000001001110010;
138 => X"0272",

-- L0191@008B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
139 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0192@008C 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
140 => X"0003",

-- L0193@008D 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
141 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0194@008E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0195@008F 006B.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101011;
143 => X"006B",

-- L0196@0090 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
144 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0197@0091 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
145 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0198@0092 027C.  data16 =  @StrError;
--  data16 = 0000001001111100;
146 => X"027C",

-- L0199@0093 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
147 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0200@0094 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0201@0095 0065.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001100101;
149 => X"0065",

-- L0202@0096 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
150 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0203@0097 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
151 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0204@0098 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
152 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0205@0099 FF66.  data16 = !$ + 1 + @ PrintHexA;
--  data16 = 1111111101100110;
153 => X"FF66",

-- L0206@009A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
154 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0207@009B 0291.  data16 =  @StrEnd;
--  data16 = 0000001010010001;
155 => X"0291",

-- L0208@009C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0209@009D 005D.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001011101;
157 => X"005D",

-- L0211@009E 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
158 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0212@009F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0213@00A0 0097.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000010010111;
160 => X"0097",

-- L0214@00A1 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
161 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0216@00A2 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
162 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0217@00A3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
163 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0218@00A4 005F.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000001011111;
164 => X"005F",

-- L0220@00A5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
165 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0221@00A6 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
166 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0222@00A7 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
167 => X"000D",

-- L0223@00A8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0224@00A9 0026.  data16 = !$ + 1 + @ LeaveEdit;
--  data16 = 0000000000100110;
169 => X"0026",

-- L0226@00AA 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
170 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0227@00AB 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
171 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0228@00AC 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
172 => X"0003",

-- L0229@00AD 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0230@00AE 001A.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000011010;
174 => X"001A",

-- L0232@00AF 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
175 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0233@00B0 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
176 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0234@00B1 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
177 => X"0001",

-- L0235@00B2 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0236@00B3 0015.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010101;
179 => X"0015",

-- L0238@00B4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
180 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0239@00B5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
181 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0240@00B6 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
182 => X"0002",

-- L0241@00B7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0242@00B8 0010.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010000;
184 => X"0010",

-- L0244@00B9 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
185 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0245@00BA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
186 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0246@00BB 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
187 => X"0008",

-- L0247@00BC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0248@00BD 0018.  data16 = !$ + 1 + @ BSEdit;
--  data16 = 0000000000011000;
189 => X"0018",

-- L0251@00BE 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
190 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0252@00BF 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
191 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0253@00C0 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
192 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0254@00C1 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
193 => X"0010",

-- L0255@00C2 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
194 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0256@00C3 0025.  data16 = !$ + 1 + @ BumpEnd;
--  data16 = 0000000000100101;
195 => X"0025",

-- L0257@00C4 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
196 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0258@00C5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
197 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0259@00C6 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
198 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0260@00C7 FFD7.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111010111;
199 => X"FFD7",

-- L0263@00C8 0802.BrkEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
200 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0264@00C9 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
201 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0265@00CA 0001.  data16 =  1;
--  data16 = 0000000000000001;
202 => X"0001",

-- L0266@00CB 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
203 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0267@00CC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
204 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0268@00CD 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
205 => X"0003",

-- L0269@00CE 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
206 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0272@00CF 0802.LeaveEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
207 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0273@00D0 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
208 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0274@00D1 0000.  data16 =  0;
--  data16 = 0000000000000000;
209 => X"0000",

-- L0275@00D2 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
210 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0276@00D3 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
211 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0277@00D4 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
212 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0280@00D5 0802.BSEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
213 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0281@00D6 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
214 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0282@00D7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
215 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0283@00D8 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
216 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0284@00D9 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0285@00DA 0003.  data16 = !$ + 1 + @ BumpStart;
--  data16 = 0000000000000011;
218 => X"0003",

-- L0286@00DB 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
219 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0287@00DC FFC2.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111000010;
220 => X"FFC2",

-- L0289@00DD 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
221 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0290@00DE 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
222 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0291@00DF 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
223 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0292@00E0 0284.  data16 =  @StrBeep;
--  data16 = 0000001010000100;
224 => X"0284",

-- L0293@00E1 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
225 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0294@00E2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
226 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0295@00E3 0017.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000000010111;
227 => X"0017",

-- L0296@00E4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
228 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0297@00E5 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
229 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0298@00E6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0299@00E7 FFB7.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111110110111;
231 => X"FFB7",

-- L0301@00E8 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
232 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0302@00E9 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
233 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0303@00EA 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
234 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0304@00EB 0286.  data16 =  @StrBack;
--  data16 = 0000001010000110;
235 => X"0286",

-- L0305@00EC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
236 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0306@00ED FFF4.  data16 = !$ + 1 + @ Bumped;
--  data16 = 1111111111110100;
237 => X"FFF4",

-- L0003@00EE 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
238 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@00EF 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
239 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0005@00F0 0600.ACSet:  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
240 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0006@00F1 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
241 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0007@00F2 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
242 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@00F3 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
243 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0011@00F4 FFFE.  data16 = !$ + 1 + @ ACDone;
--  data16 = 1111111111111110;
244 => X"FFFE",

-- L0012@00F5 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
245 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0013@00F6 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
246 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@00F7 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
247 => X"FFFF",

-- L0015@00F8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
248 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0016@00F9 FFF7.  data16 = !$ + 1 + @ ACSet;
--  data16 = 1111111111110111;
249 => X"FFF7",

-- L0018@00FA 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
250 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0019@00FB 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
251 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0020@00FC 0006.  data16 = !$ + 1 + @ PrintDone;
--  data16 = 0000000000000110;
252 => X"0006",

-- L0021@00FD 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
253 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0022@00FE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
254 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@00FF 0004.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000000000100;
255 => X"0004",

-- L0024@0100 2010.  INY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
256 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0025@0101 FFF9.  data16 = !$ + 1 + @ Print;
--  data16 = 1111111111111001;
257 => X"FFF9",

-- L0026@0102 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
258 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@0103 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
259 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0029@0104 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
260 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0030@0105 00A1.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 0000000010100001;
261 => X"00A1",

-- L0031@0106 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
262 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0032@0107 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
263 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@0108 0060.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 0000000001100000;
264 => X"0060",

-- L0034@0109 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
265 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0036@010A 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
266 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0037@010B 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
267 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0038@010C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
268 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0039@010D 0294.  data16 = @ StrHex;
--  data16 = 0000001010010100;
269 => X"0294",

-- L0041@010E 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
270 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0042@010F 000C.  data16 =  12;
--  data16 = 0000000000001100;
271 => X"000C",

-- L0043@0110 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
272 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0044@0111 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
273 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0046@0112 1040.SrcLoopX:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
274 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0047@0113 0000.  data16 =  0;
--  data16 = 0000000000000000;
275 => X"0000",

-- L0048@0114 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
276 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0049@0115 0003.  data16 = !$ + 1 + @ PrintNib;
--  data16 = 0000000000000011;
277 => X"0003",

-- L0050@0116 26C0.  DEX, RRC, BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
278 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0051@0117 FFFB.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111111011;
279 => X"FFFB",

-- L0053@0118 1C00.PrintNib:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
280 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0054@0119 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
281 => X"000F",

-- L0055@011A 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
282 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0056@011B 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
283 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0057@011C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
284 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0058@011D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
285 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@011E FFE5.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 1111111111100101;
286 => X"FFE5",

-- L0061@011F 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
287 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0062@0120 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
288 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0063@0121 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
289 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0064@0122 0009.  data16 = !$ + 1 + @ PrintHexEx;
--  data16 = 0000000000001001;
290 => X"0009",

-- L0065@0123 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
291 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0066@0124 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
292 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0067@0125 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
293 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0068@0126 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
294 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0069@0127 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
295 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0070@0128 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
296 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0071@0129 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
297 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0072@012A FFE8.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111101000;
298 => X"FFE8",

-- L0074@012B 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
299 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0075@012C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
300 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0076@012D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
301 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@012E 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
302 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@012F 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
303 => X"2000",

-- L0004@0130 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
304 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0131 0003.  data16 =  3;
--  data16 = 0000000000000011;
305 => X"0003",

-- L0006@0132 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
306 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@0133 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
307 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@0134 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
308 => X"0010",

-- L0009@0135 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
309 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@0136 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
310 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@0137 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
311 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0013@0138 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
312 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0014@0139 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
313 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0015@013A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
314 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0016@013B 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
315 => X"2000",

-- L0017@013C 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
316 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0018@013D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
317 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0019@013E 0039.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000111001;
318 => X"0039",

-- L0020@013F 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
319 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0021@0140 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
320 => X"0001",

-- L0022@0141 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
321 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@0142 FFFA.  data16 = !$ + 1 + @ RdStatus0;
--  data16 = 1111111111111010;
322 => X"FFFA",

-- L0024@0143 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
323 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0025@0144 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
324 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@0145 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
325 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0027@0146 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
326 => X"00FF",

-- L0028@0147 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
327 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0029@0148 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
328 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0030@0149 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
329 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@014A 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
330 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0033@014B 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
331 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0034@014C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
332 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0035@014D 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
333 => X"2000",

-- L0036@014E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
334 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0037@014F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
335 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@0150 0027.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000100111;
336 => X"0027",

-- L0039@0151 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
337 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0040@0152 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
338 => X"0001",

-- L0041@0153 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
339 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0042@0154 0009.  data16 = !$ + 1 + @ NoBrk;
--  data16 = 0000000000001001;
340 => X"0009",

-- L0044@0155 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
341 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0045@0156 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
342 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0046@0157 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
343 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0047@0158 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
344 => X"00FF",

-- L0048@0159 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
345 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0049@015A 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
346 => X"0003",

-- L0050@015B 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
347 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0051@015C 0004.  data16 = !$ + 1 + @ Brk;
--  data16 = 0000000000000100;
348 => X"0004",

-- L0053@015D 0800.NoBrk:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
349 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0054@015E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
350 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0055@015F 0004.  data16 = !$ + 1 + @ BrkExit;
--  data16 = 0000000000000100;
351 => X"0004",

-- L0056@0160 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
352 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0057@0161 0001.  data16 =  1;
--  data16 = 0000000000000001;
353 => X"0001",

-- L0058@0162 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
354 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0059@0163 0022.BrkExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
355 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0060@0164 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
356 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0061@0165 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
357 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0063@0166 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
358 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0064@0167 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
359 => X"0007",

-- L0065@0168 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
360 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0066@0169 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
361 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0067@016A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
362 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0068@016B 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
363 => X"2000",

-- L0069@016C 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
364 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0070@016D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
365 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0071@016E 0009.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000001001;
366 => X"0009",

-- L0072@016F 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
367 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0073@0170 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
368 => X"0002",

-- L0074@0171 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
369 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0075@0172 FFFA.  data16 = !$ + 1 + @ RdStatus1;
--  data16 = 1111111111111010;
370 => X"FFFA",

-- L0076@0173 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
371 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0077@0174 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
372 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0078@0175 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
373 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0079@0176 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
374 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0081@0177 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
375 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0082@0178 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
376 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0083@0179 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
377 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0084@017A 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
378 => X"0" & O"2" & O"0" & O"0" & O"6",

-- L0085@017B 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
379 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0086@017C 0004.  data16 = !$ + 1 + @ StIsStable;
--  data16 = 0000000000000100;
380 => X"0004",

-- L0087@017D 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
381 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0088@017E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
382 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0089@017F FFF8.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 1111111111111000;
383 => X"FFF8",

-- L0090@0180 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
384 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0091@0181 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
385 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0093@0182 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
386 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0094@0183 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
387 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0095@0184 0006.  data16 = !$ + 1 + @ UART_Done;
--  data16 = 0000000000000110;
388 => X"0006",

-- L0096@0185 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
389 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0097@0186 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
390 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@0187 FFE1.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 1111111111100001;
391 => X"FFE1",

-- L0099@0188 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
392 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0100@0189 FFF9.  data16 = !$ + 1 + @ UART_OutStr;
--  data16 = 1111111111111001;
393 => X"FFF9",

-- L0101@018A 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
394 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@018B 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
395 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0011@018C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
396 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0012@018D FF61.  data16 = !$ + 1 + @ CLC;
--  data16 = 1111111101100001;
397 => X"FF61",

-- L0013@018E 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
398 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@018F 0040.  data16 =  64;
--  data16 = 0000000001000000;
399 => X"0040",

-- L0015@0190 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
400 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0016@0191 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
401 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0017@0192 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
402 => X"1000",

-- L0018@0193 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
403 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0019@0194 0020.  data16 =  32;
--  data16 = 0000000000100000;
404 => X"0020",

-- L0020@0195 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
405 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0021@0196 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
406 => X"FF00",

-- L0022@0197 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
407 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0023@0198 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
408 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@0199 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
409 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0025@019A 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
410 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0026@019B B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
411 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0027@019C 0003.  data16 = !$ + 1 + @ RowOffDone;
--  data16 = 0000000000000011;
412 => X"0003",

-- L0028@019D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
413 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@019E FFFA.  data16 = !$ + 1 + @ RowOffLoop;
--  data16 = 1111111111111010;
414 => X"FFFA",

-- L0030@019F 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
415 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@01A0 0120.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
416 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0032@01A1 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
417 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@01A2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
418 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@01A3 0041.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000001000001;
419 => X"0041",

-- L0035@01A4 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
420 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0036@01A5 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
421 => X"0001",

-- L0040@01A6 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
422 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0041@01A7 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
423 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0042@01A8 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
424 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0044@01A9 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
425 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0045@01AA 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
426 => X"0002",

-- L0046@01AB 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
427 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0047@01AC 00A1.  data16 = !$ + 1 + @ VGA_HOME;
--  data16 = 0000000010100001;
428 => X"00A1",

-- L0049@01AD 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
429 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0050@01AE 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
430 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0051@01AF 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
431 => X"0001",

-- L0052@01B0 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
432 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0053@01B1 007F.  data16 = !$ + 1 + @ VGA_CLS;
--  data16 = 0000000001111111;
433 => X"007F",

-- L0055@01B2 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
434 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0056@01B3 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
435 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0057@01B4 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
436 => X"0007",

-- L0058@01B5 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
437 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0059@01B6 002A.  data16 = !$ + 1 + @ VGA_Ignore;
--  data16 = 0000000000101010;
438 => X"002A",

-- L0061@01B7 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
439 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0062@01B8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
440 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0063@01B9 00A0.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000000010100000;
441 => X"00A0",

-- L0065@01BA 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
442 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0066@01BB 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
443 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0067@01BC 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
444 => X"000D",

-- L0068@01BD 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
445 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0069@01BE 005C.  data16 = !$ + 1 + @ VGA_CR;
--  data16 = 0000000001011100;
446 => X"005C",

-- L0071@01BF 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
447 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0072@01C0 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
448 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0073@01C1 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
449 => X"000A",

-- L0074@01C2 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
450 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0075@01C3 006A.  data16 = !$ + 1 + @ VGA_LF;
--  data16 = 0000000001101010;
451 => X"006A",

-- L0077@01C4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
452 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0078@01C5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
453 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0079@01C6 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
454 => X"0008",

-- L0080@01C7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
455 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0081@01C8 0057.  data16 = !$ + 1 + @ VGA_BS;
--  data16 = 0000000001010111;
456 => X"0057",

-- L0084@01C9 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
457 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0086@01CA 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
458 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0087@01CB 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
459 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0088@01CC 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
460 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0089@01CD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
461 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@01CE 0094.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000010010100;
462 => X"0094",

-- L0091@01CF 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
463 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0092@01D0 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
464 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0093@01D1 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
465 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0094@01D2 0040.  data16 =  64;
--  data16 = 0000000001000000;
466 => X"0040",

-- L0095@01D3 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
467 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0096@01D4 0019.  data16 = !$ + 1 + @ NextRow;
--  data16 = 0000000000011001;
468 => X"0019",

-- L0097@01D5 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
469 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0098@01D6 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
470 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0099@01D7 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
471 => X"FF3E",

-- L0100@01D8 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
472 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0101@01D9 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
473 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0102@01DA FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
474 => X"FF3F",

-- L0103@01DB 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
475 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0104@01DC 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
476 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0106@01DD 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
477 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0107@01DE 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
478 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0108@01DF 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
479 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0110@01E0 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
480 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0111@01E1 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
481 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0112@01E2 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
482 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0113@01E3 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
483 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0115@01E4 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
484 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0116@01E5 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
485 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0117@01E6 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
486 => X"FF3C",

-- L0118@01E7 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
487 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0119@01E8 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
488 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0120@01E9 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
489 => X"FF3D",

-- L0121@01EA 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
490 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0122@01EB 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
491 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0123@01EC 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
492 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0125@01ED 0100.NextRow:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
493 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0126@01EE 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
494 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0127@01EF 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
495 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0128@01F0 0020.  data16 =  32;
--  data16 = 0000000000100000;
496 => X"0020",

-- L0129@01F1 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
497 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0130@01F2 0003.  data16 = !$ + 1 + @ ScrollUp;
--  data16 = 0000000000000011;
498 => X"0003",

-- L0131@01F3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
499 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@01F4 FFE1.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111111100001;
500 => X"FFE1",

-- L0134@01F5 0020.ScrollUp:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
501 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0135@01F6 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
502 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0136@01F7 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
503 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0137@01F8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
504 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0138@01F9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
505 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0139@01FA 0068.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000001101000;
506 => X"0068",

-- L0140@01FB 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
507 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0141@01FC 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
508 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0142@01FD 0040.  data16 =  64;
--  data16 = 0000000001000000;
509 => X"0040",

-- L0143@01FE 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
510 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0144@01FF 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
511 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0145@0200 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
512 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0146@0201 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
513 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0147@0202 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
514 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0148@0203 0040.  data16 =  64;
--  data16 = 0000000001000000;
515 => X"0040",

-- L0149@0204 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
516 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0150@0205 0003.  data16 = !$ + 1 + @ ChkRow;
--  data16 = 0000000000000011;
517 => X"0003",

-- L0151@0206 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
518 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0152@0207 FFF4.  data16 = !$ + 1 + @ NxtCol;
--  data16 = 1111111111110100;
519 => X"FFF4",

-- L0153@0208 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
520 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0154@0209 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
521 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0155@020A 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
522 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0156@020B 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
523 => X"001F",

-- L0157@020C C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
524 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0158@020D 0003.  data16 = !$ + 1 + @ ClrLastRow;
--  data16 = 0000000000000011;
525 => X"0003",

-- L0159@020E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
526 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0160@020F FFE7.  data16 = !$ + 1 + @ NxtRow;
--  data16 = 1111111111100111;
527 => X"FFE7",

-- L0162@0210 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
528 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0163@0211 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
529 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0164@0212 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
530 => X"001F",

-- L0165@0213 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
531 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@0214 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
532 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0167@0215 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
533 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0168@0216 002A.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000101010;
534 => X"002A",

-- L0169@0217 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
535 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0170@0218 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
536 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0171@0219 0002.  data16 = !$ + 1 + @ SetX0;
--  data16 = 0000000000000010;
537 => X"0002",

-- L0173@021A 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
538 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0174@021B 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
539 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0175@021C 0000.  data16 =  0;
--  data16 = 0000000000000000;
540 => X"0000",

-- L0176@021D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
541 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0177@021E FFB7.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110111;
542 => X"FFB7",

-- L0179@021F 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
543 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0180@0220 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
544 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0181@0221 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
545 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0182@0222 0003.  data16 = !$ + 1 + @ PrevRow;
--  data16 = 0000000000000011;
546 => X"0003",

-- L0183@0223 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
547 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0184@0224 FFB1.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110001;
548 => X"FFB1",

-- L0185@0225 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
549 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0186@0226 0000.  data16 =  0;
--  data16 = 0000000000000000;
550 => X"0000",

-- L0187@0227 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
551 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0188@0228 FFAD.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101101;
552 => X"FFAD",

-- L0189@0229 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
553 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0190@022A 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
554 => X"003F",

-- L0191@022B 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
555 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0192@022C FFA9.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101001;
556 => X"FFA9",

-- L0194@022D 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
557 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0195@022E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
558 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0196@022F FFBF.  data16 = !$ + 1 + @ NextRow1;
--  data16 = 1111111110111111;
559 => X"FFBF",

-- L0198@0230 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
560 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0199@0231 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
561 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0200@0232 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
562 => X"0020",

-- L0201@0233 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
563 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0202@0234 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
564 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0203@0235 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
565 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0204@0236 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
566 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0205@0237 0009.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000001001;
567 => X"0009",

-- L0206@0238 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
568 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0207@0239 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
569 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0208@023A 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
570 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0209@023B 0020.  data16 =  32;
--  data16 = 0000000000100000;
571 => X"0020",

-- L0210@023C C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
572 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0211@023D 0011.  data16 = !$ + 1 + @ vga_home1;
--  data16 = 0000000000010001;
573 => X"0011",

-- L0212@023E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
574 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0213@023F FFF5.  data16 = !$ + 1 + @ ClrNextRow;
--  data16 = 1111111111110101;
575 => X"FFF5",

-- L0215@0240 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
576 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0216@0241 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
577 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0217@0242 0020.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000000100000;
578 => X"0020",

-- L0218@0243 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
579 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0219@0244 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
580 => X"0020",

-- L0220@0245 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
581 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0221@0246 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
582 => X"0007",

-- L0222@0247 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
583 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0223@0248 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
584 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0224@0249 0003.  data16 = !$ + 1 + @ ClrDone;
--  data16 = 0000000000000011;
585 => X"0003",

-- L0225@024A 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
586 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0226@024B FFFC.  data16 = !$ + 1 + @ ClrRLoop;
--  data16 = 1111111111111100;
587 => X"FFFC",

-- L0227@024C 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
588 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0229@024D 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
589 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0230@024E 0120.vga_home1:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
590 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0231@024F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
591 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0232@0250 FF85.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110000101;
592 => X"FF85",

-- L0234@0251 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
593 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0235@0252 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
594 => X"FF3C",

-- L0236@0253 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
595 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0237@0254 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
596 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0238@0255 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
597 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0239@0256 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
598 => X"FF3D",

-- L0240@0257 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
599 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0241@0258 0007.  data16 = !$ + 1 + @ GetCursorY;
--  data16 = 0000000000000111;
600 => X"0007",

-- L0243@0259 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
601 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0244@025A FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
602 => X"FF3E",

-- L0245@025B 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
603 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0246@025C 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
604 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0247@025D 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
605 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0248@025E FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
606 => X"FF3F",

-- L0249@025F 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
607 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0250@0260 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
608 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0251@0261 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
609 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0253@0262 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
610 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0254@0263 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
611 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0255@0264 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
612 => X"FF00",

-- L0256@0265 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
613 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0257@0266 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
614 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0258@0267 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
615 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0259@0268 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
616 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0261@0269 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
617 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0262@026A 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
618 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0263@026B 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
619 => X"0006",

-- L0264@026C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
620 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0265@026D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
621 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0266@026E FF38.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 1111111100111000;
622 => X"FF38",

-- L0267@026F 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
623 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0268@0270 FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
624 => X"FFF9",

-- L0269@0271 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
625 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@0272 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
626 => X"000D",

-- L0004@0273 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
627 => X"000A",

-- L0005@0274 002A.  data16 =  '*';
--  data16 = 0000000000101010;
628 => X"002A",

-- L0006@0275 0042.  data16 =  'B';
--  data16 = 0000000001000010;
629 => X"0042",

-- L0007@0276 0052.  data16 =  'R';
--  data16 = 0000000001010010;
630 => X"0052",

-- L0008@0277 0045.  data16 =  'E';
--  data16 = 0000000001000101;
631 => X"0045",

-- L0009@0278 0041.  data16 =  'A';
--  data16 = 0000000001000001;
632 => X"0041",

-- L0010@0279 004B.  data16 =  'K';
--  data16 = 0000000001001011;
633 => X"004B",

-- L0011@027A 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
634 => X"0007",

-- L0012@027B 0000.  data16 =  0;
--  data16 = 0000000000000000;
635 => X"0000",

-- L0014@027C 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
636 => X"000D",

-- L0015@027D 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
637 => X"000A",

-- L0016@027E 002A.  data16 =  '*';
--  data16 = 0000000000101010;
638 => X"002A",

-- L0017@027F 0045.  data16 =  'E';
--  data16 = 0000000001000101;
639 => X"0045",

-- L0018@0280 0052.  data16 =  'R';
--  data16 = 0000000001010010;
640 => X"0052",

-- L0019@0281 0052.  data16 =  'R';
--  data16 = 0000000001010010;
641 => X"0052",

-- L0020@0282 004F.  data16 =  'O';
--  data16 = 0000000001001111;
642 => X"004F",

-- L0021@0283 0052.  data16 =  'R';
--  data16 = 0000000001010010;
643 => X"0052",

-- L0022@0284 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
644 => X"0007",

-- L0023@0285 0000.  data16 =  0;
--  data16 = 0000000000000000;
645 => X"0000",

-- L0025@0286 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
646 => X"0008",

-- L0026@0287 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
647 => X"0007",

-- L0027@0288 0000.  data16 =  0;
--  data16 = 0000000000000000;
648 => X"0000",

-- L0029@0289 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
649 => X"0001",

-- L0030@028A 0000.  data16 =  0;
--  data16 = 0000000000000000;
650 => X"0000",

-- L0032@028B 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
651 => X"0052",

-- L0033@028C 0065.  data16 =  'e';
--  data16 = 0000000001100101;
652 => X"0065",

-- L0034@028D 0061.  data16 =  'a';
--  data16 = 0000000001100001;
653 => X"0061",

-- L0035@028E 0064.  data16 =  'd';
--  data16 = 0000000001100100;
654 => X"0064",

-- L0036@028F 0079.  data16 =  'y';
--  data16 = 0000000001111001;
655 => X"0079",

-- L0037@0290 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
656 => X"002E",

-- L0038@0291 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
657 => X"000D",

-- L0039@0292 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
658 => X"000A",

-- L0040@0293 0000.  data16 =  0;
--  data16 = 0000000000000000;
659 => X"0000",

-- L0042@0294 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
660 => X"0030",

-- L0043@0295 0031.  data16 =  '1';
--  data16 = 0000000000110001;
661 => X"0031",

-- L0044@0296 0032.  data16 =  '2';
--  data16 = 0000000000110010;
662 => X"0032",

-- L0045@0297 0033.  data16 =  '3';
--  data16 = 0000000000110011;
663 => X"0033",

-- L0046@0298 0034.  data16 =  '4';
--  data16 = 0000000000110100;
664 => X"0034",

-- L0047@0299 0035.  data16 =  '5';
--  data16 = 0000000000110101;
665 => X"0035",

-- L0048@029A 0036.  data16 =  '6';
--  data16 = 0000000000110110;
666 => X"0036",

-- L0049@029B 0037.  data16 =  '7';
--  data16 = 0000000000110111;
667 => X"0037",

-- L0050@029C 0038.  data16 =  '8';
--  data16 = 0000000000111000;
668 => X"0038",

-- L0051@029D 0039.  data16 =  '9';
--  data16 = 0000000000111001;
669 => X"0039",

-- L0052@029E 0041.  data16 =  'A';
--  data16 = 0000000001000001;
670 => X"0041",

-- L0053@029F 0042.  data16 =  'B';
--  data16 = 0000000001000010;
671 => X"0042",

-- L0054@02A0 0043.  data16 =  'C';
--  data16 = 0000000001000011;
672 => X"0043",

-- L0055@02A1 0044.  data16 =  'D';
--  data16 = 0000000001000100;
673 => X"0044",

-- L0056@02A2 0045.  data16 =  'E';
--  data16 = 0000000001000101;
674 => X"0045",

-- L0057@02A3 0046.  data16 =  'F';
--  data16 = 0000000001000110;
675 => X"0046",

-- 3424 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02A4 .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

