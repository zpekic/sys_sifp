--------------------------------------------------------
-- mcc V1.4.0328 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package monitor_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 16;
constant CODE_ADDRESS_WIDTH: 	positive := 11;
constant CODE_ADDRESS_LAST: 	positive := 2047;


type cpu_code_memory is array(0 to 2047) of std_logic_vector(15 downto 0);

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

-- INTOFF;
-- L0019@0000 5FFF.  r_p = STP4, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0101, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
0 => X"5" & O"7" & O"7" & O"7" & O"7",

-- TRACEOFF;
-- L0020@0001 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
1 => X"7" & O"7" & O"7" & O"7" & O"7",

-- JUMP;
-- L0021@0002 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"3" & O"0" & O"0" & O"0" & O"0",

-- .absolute  ColdStart;
-- L0021@0003 0037.  data16 = @  ColdStart;
--  data16 = 0000000000110111;
3 => X"0037",

-- TRACEOFF;
-- L0027@0008 7FFF.IntHandler:  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
8 => X"7" & O"7" & O"7" & O"7" & O"7",

-- PUSHA;
-- L0028@0009 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
9 => X"0" & O"7" & O"0" & O"0" & O"3",

-- PUSHX;
-- L0029@000A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
10 => X"0" & O"0" & O"7" & O"0" & O"3",

-- PUSHY;
-- L0030@000B 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
11 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = STP2, r_s = M[PUSH];
-- L0032@000C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
12 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0032@000D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetOldCrsXY;
-- L0032@000E 0411.  data16 = !$ + 1 + @  GetOldCrsXY;
--  data16 = 0000010000010001;
14 => X"0411",

-- PUSHY;
-- L0033@000F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
15 => X"0" & O"0" & O"0" & O"7" & O"3",

-- PUSHX;
-- L0034@0010 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
16 => X"0" & O"0" & O"7" & O"0" & O"3",

-- r_p = STP2, r_s = M[PUSH];
-- L0035@0011 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
17 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0035@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetRowBase;
-- L0035@0013 041D.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000010000011101;
19 => X"041D",

-- LDA, M[Y+X];
-- L0036@0014 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = AND;
-- L0037@0015 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0xFF7F;
-- L0037@0016 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
22 => X"FF7F",

-- STA, M[Y+X];
-- L0038@0017 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
23 => X"0" & O"7" & O"6" & O"6" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0039@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0039@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetCursorXY;
-- L0039@001A 040D.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000010000001101;
26 => X"040D",

-- CPX, M[POP];
-- L0040@001B 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
27 => X"0" & O"0" & O"1" & O"0" & O"2",

-- CPY, M[POP];
-- L0041@001C 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
28 => X"0" & O"0" & O"0" & O"1" & O"2",

-- IF_X_EQ;
-- L0042@001D B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"B" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0042@001E 0003.  data16 = 3;
--  data16 = 0000000000000011;
30 => X"0003",

-- BRANCH;
-- L0042@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NoFlip;
-- L0042@0020 0003.  data16 = !$ + 1 + @  NoFlip;
--  data16 = 0000000000000011;
32 => X"0003",

-- IF_Y_EQ;
-- L0043@0021 D000.CheckY:  IF_Y_EQ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"D" & O"0" & O"0" & O"0" & O"0",

-- .relative  Flip;
-- L0043@0022 0006.  data16 = !$ + 1 + @  Flip;
--  data16 = 0000000000000110;
34 => X"0006",

-- r_p = STP2, r_s = M[PUSH];
-- L0044@0023 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
35 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0044@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SetOldCrsXY;
-- L0044@0025 0379.  data16 = !$ + 1 + @  SetOldCrsXY;
--  data16 = 0000001101111001;
37 => X"0379",

-- BRANCH;
-- L0045@0026 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  IntExit;
-- L0045@0027 000B.  data16 = !$ + 1 + @  IntExit;
--  data16 = 0000000000001011;
39 => X"000B",

-- r_p = STP2, r_s = M[PUSH];
-- L0047@0028 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
40 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0047@0029 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetCursorXY;
-- L0047@002A 03FD.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000001111111101;
42 => X"03FD",

-- r_p = STP2, r_s = M[PUSH];
-- L0048@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0048@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetRowBase;
-- L0048@002D 0403.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000010000000011;
45 => X"0403",

-- LDA, M[Y+X];
-- L0049@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = XOR;
-- L0050@002F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  0x0080;
-- L0050@0030 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
48 => X"0080",

-- STA, M[Y+X];
-- L0051@0031 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"6" & O"6" & O"0",

-- POPY;
-- L0053@0032 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- POPX;
-- L0054@0033 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
51 => X"0" & O"0" & O"4" & O"0" & O"2",

-- POPA;
-- L0055@0034 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"4" & O"0" & O"0" & O"2",

-- POPF;
-- L0056@0035 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"0" & O"0" & O"0" & O"0" & O"2",

-- RTS  ;
-- L0056@0036 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
54 => X"4" & O"0" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0059@0037 6003.ColdStart:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0059@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_Init;
-- L0059@0039 031F.  data16 = !$ + 1 + @  VGA_Init;
--  data16 = 0000001100011111;
57 => X"031F",

-- r_p = STP2, r_s = M[PUSH];
-- L0061@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0061@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  UART_Init;
-- L0061@003C 02D6.  data16 = !$ + 1 + @  UART_Init;
--  data16 = 0000001011010110;
60 => X"02D6",

-- TRACEON;
-- L0063@003D 6FFF.  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"6" & O"7" & O"7" & O"7" & O"7",

-- r_p = M[IMM], r_y = LDY;
-- L0067@003E 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
62 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  @StrReady;
-- L0067@003F 046B.  data16 =  @StrReady;
--  data16 = 0000010001101011;
63 => X"046B",

-- r_p = STP2, r_s = M[PUSH];
-- L0068@0040 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
64 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0068@0041 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
65 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  Print;
-- L0068@0042 00FB.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000011111011;
66 => X"00FB",

-- r_p = M[IMM], r_a = LDA;
-- L0073@0043 1800.HotStart:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
67 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  ' ';
-- L0073@0044 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
68 => X"0020",

-- PUSHA;
-- L0074@0045 0E03.HotStart1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
69 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = STP2, r_s = M[PUSH];
-- L0075@0046 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
70 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0075@0047 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
71 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0075@0048 00FE.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000011111110;
72 => X"00FE",

-- POPA;
-- L0076@0049 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
73 => X"0" & O"4" & O"0" & O"0" & O"2",

-- r_p = M[IMM], r_a = AND;
-- L0077@004A 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0077@004B 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
75 => X"00FF",

-- IF_A_EQ;
-- L0078@004C 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  HotStart;
-- L0078@004D FFF6.  data16 = !$ + 1 + @  HotStart;
--  data16 = 1111111111110110;
77 => X"FFF6",

-- IF_A_GE;
-- L0079@004E 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  NextPrint;
-- L0079@004F 0005.  data16 = !$ + 1 + @  NextPrint;
--  data16 = 0000000000000101;
79 => X"0005",

-- r_p = M[IMM], r_a = ADC;
-- L0080@0050 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
80 => X"1" & O"5" & O"0" & O"0" & O"0",

-- data16 =  1;
-- L0080@0051 0001.  data16 =  1;
--  data16 = 0000000000000001;
81 => X"0001",

-- BRANCH;
-- L0081@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  HotStart1;
-- L0081@0053 FFF2.  data16 = !$ + 1 + @  HotStart1;
--  data16 = 1111111111110010;
83 => X"FFF2",

-- r_p = M[IMM], r_a = ADC;
-- L0082@0054 1A00.NextPrint:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
84 => X"1" & O"5" & O"0" & O"0" & O"0",

-- data16 =  0;
-- L0082@0055 0000.  data16 =  0;
--  data16 = 0000000000000000;
85 => X"0000",

-- BRANCH;
-- L0083@0056 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
86 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  HotStart1;
-- L0083@0057 FFEE.  data16 = !$ + 1 + @  HotStart1;
--  data16 = 1111111111101110;
87 => X"FFEE",

-- r_p = M[IMM], r_x = LDX;
-- L0086@0058 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
88 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  TXTBUFLEN;
-- L0086@0059 0040.  data16 =  0x0040;
--  data16 = 0000000001000000;
89 => X"0040",

-- r_p = M[IMM], r_y = LDY;
-- L0087@005A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
90 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  TXTBUFFER;
-- L0087@005B FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
91 => X"FF00",

-- r_p = STP2, r_s = M[PUSH];
-- L0088@005C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
92 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0088@005D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
93 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  MemClear;
-- L0088@005E 00AA.  data16 = !$ + 1 + @  MemClear;
--  data16 = 0000000010101010;
94 => X"00AA",

-- r_p = STP2, r_s = M[PUSH];
-- L0090@005F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
95 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0090@0060 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
96 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CmdEdit;
-- L0090@0061 0039.  data16 = !$ + 1 + @  CmdEdit;
--  data16 = 0000000000111001;
97 => X"0039",

-- IF_A_GE;
-- L0091@0062 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
98 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ErrOrBrk;
-- L0091@0063 0008.  data16 = !$ + 1 + @  ErrOrBrk;
--  data16 = 0000000000001000;
99 => X"0008",

-- r_p = STP2, r_s = M[PUSH];
-- L0098@0064 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
100 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0098@0065 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
101 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CmdExec;
-- L0098@0066 0028.  data16 = !$ + 1 + @  CmdExec;
--  data16 = 0000000000101000;
102 => X"0028",

-- IF_A_GE;
-- L0099@0067 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
103 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ErrOrBrk;
-- L0099@0068 0003.  data16 = !$ + 1 + @  ErrOrBrk;
--  data16 = 0000000000000011;
104 => X"0003",

-- BRANCH;
-- L0102@0069 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
105 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  HotStart;
-- L0102@006A FFD9.  data16 = !$ + 1 + @  HotStart;
--  data16 = 1111111111011001;
106 => X"FFD9",

-- PUSHA;
-- L0104@006B 0E03.ErrOrBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
107 => X"0" & O"7" & O"0" & O"0" & O"3",

-- PUSHA;
-- L0105@006C 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
108 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = XOR;
-- L0106@006D 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
109 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  ETX;
-- L0106@006E 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
110 => X"0003",

-- IF_A_EQ;
-- L0107@006F 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
111 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  BrkMsg;
-- L0107@0070 0005.  data16 = !$ + 1 + @  BrkMsg;
--  data16 = 0000000000000101;
112 => X"0005",

-- r_p = M[IMM], r_y = LDY;
-- L0108@0071 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
113 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  @StrError;
-- L0108@0072 045C.  data16 =  @StrError;
--  data16 = 0000010001011100;
114 => X"045C",

-- BRANCH;
-- L0109@0073 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
115 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ErrMsg;
-- L0109@0074 0003.  data16 = !$ + 1 + @  ErrMsg;
--  data16 = 0000000000000011;
116 => X"0003",

-- r_p = M[IMM], r_y = LDY;
-- L0110@0075 1020.BrkMsg:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
117 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  @StrBreak;
-- L0110@0076 0451.  data16 =  @StrBreak;
--  data16 = 0000010001010001;
118 => X"0451",

-- r_p = STP2, r_s = M[PUSH];
-- L0111@0077 6003.ErrMsg:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
119 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0111@0078 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
120 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  Print;
-- L0111@0079 00C4.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000011000100;
121 => X"00C4",

-- POPA;
-- L0112@007A 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
122 => X"0" & O"4" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0113@007B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
123 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0113@007C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintHex;
-- L0113@007D 00CF.  data16 = !$ + 1 + @  PrintHex;
--  data16 = 0000000011001111;
125 => X"00CF",

-- r_p = M[IMM], r_a = LDA;
-- L0114@007E 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
126 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  ' ';
-- L0114@007F 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
127 => X"0020",

-- r_p = STP2, r_s = M[PUSH];
-- L0115@0080 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
128 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0115@0081 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0115@0082 00C4.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000011000100;
130 => X"00C4",

-- POPA;
-- L0116@0083 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
131 => X"0" & O"4" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0117@0084 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
132 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0117@0085 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
133 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintBin;
-- L0117@0086 00E7.  data16 = !$ + 1 + @  PrintBin;
--  data16 = 0000000011100111;
134 => X"00E7",

-- r_p = M[IMM], r_y = LDY;
-- L0118@0087 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
135 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  @StrEnd;
-- L0118@0088 0471.  data16 =  @StrEnd;
--  data16 = 0000010001110001;
136 => X"0471",

-- r_p = STP2, r_s = M[PUSH];
-- L0119@0089 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
137 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0119@008A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
138 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  Print;
-- L0119@008B 00B2.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010110010;
139 => X"00B2",

-- BRANCH;
-- L0120@008C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
140 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  HotStart;
-- L0120@008D FFB6.  data16 = !$ + 1 + @  HotStart;
--  data16 = 1111111110110110;
141 => X"FFB6",

-- r_p = M[IMM], r_y = LDY;
-- L0125@008E 1020.CmdExec:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
142 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  TXTBUFFER;
-- L0125@008F FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
143 => X"FF00",

-- CLRA;
-- L0126@0090 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
144 => X"0" & O"4" & O"0" & O"0" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0127@0091 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
145 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0127@0092 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
146 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ParseInt;
-- L0127@0093 00EC.  data16 = !$ + 1 + @  ParseInt;
--  data16 = 0000000011101100;
147 => X"00EC",

-- IF_A_GE;
-- L0128@0094 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  CmdExecEx;
-- L0128@0095 0004.  data16 = !$ + 1 + @  CmdExecEx;
--  data16 = 0000000000000100;
149 => X"0004",

-- r_p = STP2, r_s = M[PUSH];
-- L0129@0096 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
150 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0129@0097 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
151 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintHex;
-- L0129@0098 00B4.  data16 = !$ + 1 + @  PrintHex;
--  data16 = 0000000010110100;
152 => X"00B4",

-- RTS;
-- L0130@0099 4002.CmdExecEx:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
153 => X"4" & O"0" & O"0" & O"0" & O"2",

-- CLRX;
-- L0135@009A 0100.CmdEdit:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
154 => X"0" & O"0" & O"4" & O"0" & O"0",

-- r_p = M[IMM], r_y = LDY;
-- L0136@009B 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
155 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  TXTBUFFER;
-- L0136@009C FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
156 => X"FF00",

-- r_p = STP2, r_s = M[PUSH];
-- L0138@009D 6003.EditLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
157 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0138@009E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  UART_GetChr;
-- L0138@009F 027C.  data16 = !$ + 1 + @  UART_GetChr;
--  data16 = 0000001001111100;
159 => X"027C",

-- STA, M[Y+X];
-- L0139@00A0 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
160 => X"0" & O"7" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = XOR;
-- L0141@00A1 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
161 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  CR;
-- L0141@00A2 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
162 => X"000D",

-- IF_A_EQ;
-- L0142@00A3 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
163 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0142@00A4 0003.  data16 = 3;
--  data16 = 0000000000000011;
164 => X"0003",

-- BRANCH;
-- L0142@00A5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
165 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NotEnter;
-- L0142@00A6 000B.  data16 = !$ + 1 + @  NotEnter;
--  data16 = 0000000000001011;
166 => X"000B",

-- STA, M[Y+X];
-- L0143@00A7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
167 => X"0" & O"7" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_y = LDY;
-- L0144@00A8 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
168 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  @StrEnd;
-- L0144@00A9 0471.  data16 =  @StrEnd;
--  data16 = 0000010001110001;
169 => X"0471",

-- r_p = STP2, r_s = M[PUSH];
-- L0145@00AA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
170 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0145@00AB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
171 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  Print;
-- L0145@00AC 0091.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010010001;
172 => X"0091",

-- r_p = M[IMM], r_a = LDA;
-- L0146@00AD 1800.EditExOk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
173 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  CR;
-- L0146@00AE 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
174 => X"000D",

-- BRANCH;
-- L0147@00AF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
175 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0147@00B0 004C.  data16 = !$ + 1 + @  CLC;
--  data16 = 0000000001001100;
176 => X"004C",

-- LDA, M[Y+X];
-- L0149@00B1 09B0.NotEnter:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
177 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = XOR;
-- L0150@00B2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
178 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  ETX;
-- L0150@00B3 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
179 => X"0003",

-- IF_A_EQ;
-- L0151@00B4 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
180 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0151@00B5 0003.  data16 = 3;
--  data16 = 0000000000000011;
181 => X"0003",

-- BRANCH;
-- L0151@00B6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
182 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NotBreak;
-- L0151@00B7 0009.  data16 = !$ + 1 + @  NotBreak;
--  data16 = 0000000000001001;
183 => X"0009",

-- STA, M[Y+X];
-- L0152@00B8 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
184 => X"0" & O"7" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = LDA;
-- L0153@00B9 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
185 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  ETX;
-- L0153@00BA 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
186 => X"0003",

-- r_p = STP2, r_s = M[PUSH];
-- L0154@00BB 6003.EditExErr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
187 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0154@00BC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0154@00BD 0089.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000010001001;
189 => X"0089",

-- BRANCH;
-- L0155@00BE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SEC;
-- L0155@00BF 0042.  data16 = !$ + 1 + @  SEC;
--  data16 = 0000000001000010;
191 => X"0042",

-- LDA, M[Y+X];
-- L0157@00C0 09B0.NotBreak:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
192 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = XOR;
-- L0158@00C1 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
193 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  CLS;
-- L0158@00C2 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
194 => X"0001",

-- IF_A_EQ;
-- L0159@00C3 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
195 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0159@00C4 0003.  data16 = 3;
--  data16 = 0000000000000011;
196 => X"0003",

-- BRANCH;
-- L0159@00C5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
197 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NotCls;
-- L0159@00C6 0006.  data16 = !$ + 1 + @  NotCls;
--  data16 = 0000000000000110;
198 => X"0006",

-- STA, M[Y+X];
-- L0160@00C7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
199 => X"0" & O"7" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = LDA;
-- L0161@00C8 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
200 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  CLS;
-- L0161@00C9 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
201 => X"0001",

-- BRANCH;
-- L0162@00CA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
202 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  EditExErr;
-- L0162@00CB FFF0.  data16 = !$ + 1 + @  EditExErr;
--  data16 = 1111111111110000;
203 => X"FFF0",

-- LDA, M[Y+X];
-- L0164@00CC 09B0.NotCls:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
204 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = XOR;
-- L0165@00CD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
205 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  HOME;
-- L0165@00CE 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
206 => X"0002",

-- IF_A_EQ;
-- L0166@00CF 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
207 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0166@00D0 0003.  data16 = 3;
--  data16 = 0000000000000011;
208 => X"0003",

-- BRANCH;
-- L0166@00D1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
209 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NotHome;
-- L0166@00D2 0006.  data16 = !$ + 1 + @  NotHome;
--  data16 = 0000000000000110;
210 => X"0006",

-- STA, M[Y+X];
-- L0167@00D3 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
211 => X"0" & O"7" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = LDA;
-- L0168@00D4 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
212 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  HOME;
-- L0168@00D5 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
213 => X"0002",

-- BRANCH;
-- L0169@00D6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
214 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  EditExErr;
-- L0169@00D7 FFE4.  data16 = !$ + 1 + @  EditExErr;
--  data16 = 1111111111100100;
215 => X"FFE4",

-- LDA, M[Y+X];
-- L0171@00D8 09B0.NotHome:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
216 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_a = XOR;
-- L0172@00D9 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
217 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  BS;
-- L0172@00DA 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
218 => X"0008",

-- IF_A_EQ;
-- L0173@00DB 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
219 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0173@00DC 0003.  data16 = 3;
--  data16 = 0000000000000011;
220 => X"0003",

-- BRANCH;
-- L0173@00DD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
221 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NotBS;
-- L0173@00DE 0014.  data16 = !$ + 1 + @  NotBS;
--  data16 = 0000000000010100;
222 => X"0014",

-- CHKX;
-- L0174@00DF 0040.  r_p = NOP, r_a = NOA, r_x = CPX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
223 => X"0" & O"0" & O"1" & O"0" & O"0",

-- IF_X_EQ;
-- L0175@00E0 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
224 => X"B" & O"0" & O"0" & O"0" & O"0",

-- .relative  Bumper;
-- L0175@00E1 0008.  data16 = !$ + 1 + @  Bumper;
--  data16 = 0000000000001000;
225 => X"0008",

-- r_p = M[IMM], r_a = LDA;
-- L0176@00E2 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
226 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  BS;
-- L0176@00E3 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
227 => X"0008",

-- r_p = STP2, r_s = M[PUSH];
-- L0177@00E4 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
228 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0177@00E5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
229 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0177@00E6 0060.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001100000;
230 => X"0060",

-- DEX,BRANCH;
-- L0178@00E7 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
231 => X"2" & O"0" & O"3" & O"0" & O"0",

-- .relative  EditNext;
-- L0178@00E8 0006.  data16 = !$ + 1 + @  EditNext;
--  data16 = 0000000000000110;
232 => X"0006",

-- r_p = M[IMM], r_a = LDA;
-- L0180@00E9 1800.Bumper:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
233 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  BEL;
-- L0180@00EA 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
234 => X"0007",

-- r_p = STP2, r_s = M[PUSH];
-- L0181@00EB 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
235 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0181@00EC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
236 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0181@00ED 0059.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001011001;
237 => X"0059",

-- CLRA;
-- L0182@00EE 0800.EditNext:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
238 => X"0" & O"4" & O"0" & O"0" & O"0",

-- STA, M[Y+X];
-- L0183@00EF 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
239 => X"0" & O"7" & O"6" & O"6" & O"0",

-- BRANCH;
-- L0184@00F0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
240 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  EditLoop;
-- L0184@00F1 FFAC.  data16 = !$ + 1 + @  EditLoop;
--  data16 = 1111111110101100;
241 => X"FFAC",

-- r_p = M[IMM], r_x = CPX;
-- L0187@00F2 1040.NotBS:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
242 => X"1" & O"0" & O"1" & O"0" & O"0",

-- data16 =  TXTBUFLEN - 1;
-- L0187@00F3 003F.  data16 =  0x0040 - 1;
--  data16 = 0000000000111111;
243 => X"003F",

-- IF_X_GE;
-- L0188@00F4 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
244 => X"A" & O"0" & O"0" & O"0" & O"0",

-- .relative  Bumper;
-- L0188@00F5 FFF4.  data16 = !$ + 1 + @  Bumper;
--  data16 = 1111111111110100;
245 => X"FFF4",

-- LDA, M[Y+X];
-- L0189@00F6 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
246 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0190@00F7 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
247 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0190@00F8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
248 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0190@00F9 004D.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001001101;
249 => X"004D",

-- INX,BRANCH;
-- L0191@00FA 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
250 => X"2" & O"0" & O"2" & O"0" & O"0",

-- .relative  EditNext;
-- L0191@00FB FFF3.  data16 = !$ + 1 + @  EditNext;
--  data16 = 1111111111110011;
251 => X"FFF3",

-- PUSHA;
-- L0003@00FC 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
252 => X"0" & O"7" & O"0" & O"0" & O"3",

-- CLRA;
-- L0004@00FD 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
253 => X"0" & O"4" & O"0" & O"0" & O"0",

-- RRC;
-- L0005@00FE 0600.ACSet:  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
254 => X"0" & O"3" & O"0" & O"0" & O"0",

-- POPA;
-- L0006@00FF 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
255 => X"0" & O"4" & O"0" & O"0" & O"2",

-- RTS;
-- L0007@0100 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
256 => X"4" & O"0" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0010@0101 8000.SEC:  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
257 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ACDone;
-- L0010@0102 FFFE.  data16 = !$ + 1 + @  ACDone;
--  data16 = 1111111111111110;
258 => X"FFFE",

-- PUSHA;
-- L0011@0103 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
259 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = LDA;
-- L0012@0104 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
260 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  -1;
-- L0012@0105 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
261 => X"FFFF",

-- BRANCH;
-- L0013@0106 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ACSet;
-- L0013@0107 FFF7.  data16 = !$ + 1 + @  ACSet;
--  data16 = 1111111111110111;
263 => X"FFF7",

-- CLRA;
-- L0018@0108 0800.MemClear:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
264 => X"0" & O"4" & O"0" & O"0" & O"0",

-- PUSHX;
-- L0019@0109 01C3.MemFill:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
265 => X"0" & O"0" & O"7" & O"0" & O"3",

-- CLRX;
-- L0020@010A 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
266 => X"0" & O"0" & O"4" & O"0" & O"0",

-- CPX, M[S];
-- L0021@010B 0046.MemCFLoop:  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
267 => X"0" & O"0" & O"1" & O"0" & O"6",

-- IF_X_GE;
-- L0022@010C A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"A" & O"0" & O"0" & O"0" & O"0",

-- .relative  MemCFExit;
-- L0022@010D 0004.  data16 = !$ + 1 + @  MemCFExit;
--  data16 = 0000000000000100;
269 => X"0004",

-- STA, M[Y+X];
-- L0023@010E 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
270 => X"0" & O"7" & O"6" & O"6" & O"0",

-- INX,BRANCH;
-- L0024@010F 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
271 => X"2" & O"0" & O"2" & O"0" & O"0",

-- .relative  MemCFLoop;
-- L0024@0110 FFFB.  data16 = !$ + 1 + @  MemCFLoop;
--  data16 = 1111111111111011;
272 => X"FFFB",

-- POPX;
-- L0025@0111 0102.MemCFExit:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
273 => X"0" & O"0" & O"4" & O"0" & O"2",

-- RTS;
-- L0026@0112 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
274 => X"4" & O"0" & O"0" & O"0" & O"2",

-- r_p = M[IMM], r_a = AND;
-- L0031@0113 1C00.ToUpper:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
275 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0031@0114 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
276 => X"00FF",

-- r_p = STP2, r_s = M[PUSH];
-- L0032@0115 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
277 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0032@0116 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
278 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SEC;
-- L0032@0117 FFEA.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111101010;
279 => X"FFEA",

-- PUSHA;
-- L0033@0118 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
280 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = SBC;
-- L0034@0119 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
281 => X"1" & O"1" & O"0" & O"0" & O"0",

-- data16 =  'a';
-- L0034@011A 0061.  data16 =  'a';
--  data16 = 0000000001100001;
282 => X"0061",

-- POPA;
-- L0035@011B 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
283 => X"0" & O"4" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0036@011C 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
284 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ToUpper1;
-- L0036@011D 0002.  data16 = !$ + 1 + @  ToUpper1;
--  data16 = 0000000000000010;
285 => X"0002",

-- RTS;
-- L0037@011E 4002.ToUpperEx:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
286 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHA;
-- L0038@011F 0E03.ToUpper1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
287 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = SBC;
-- L0039@0120 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
288 => X"1" & O"1" & O"0" & O"0" & O"0",

-- data16 =  '{';
-- L0039@0121 007B.  data16 =  '{';
--  data16 = 0000000001111011;
289 => X"007B",

-- POPA;
-- L0040@0122 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
290 => X"0" & O"4" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0041@0123 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
291 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ToUpperEx;
-- L0041@0124 FFFA.  data16 = !$ + 1 + @  ToUpperEx;
--  data16 = 1111111111111010;
292 => X"FFFA",

-- r_p = M[IMM], r_a = SBC;
-- L0042@0125 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
293 => X"1" & O"1" & O"0" & O"0" & O"0",

-- data16 =  'a' - 'A' - 1;
-- L0042@0126 001F.  data16 =  'a' - 'A' - 1;
--  data16 = 0000000000011111;
294 => X"001F",

-- RTS;
-- L0043@0127 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
295 => X"4" & O"0" & O"0" & O"0" & O"2",

-- r_p = M[IMM], r_a = AND;
-- L0048@0128 1C00.ToLower:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
296 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0048@0129 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
297 => X"00FF",

-- r_p = STP2, r_s = M[PUSH];
-- L0049@012A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
298 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0049@012B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
299 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SEC;
-- L0049@012C FFD5.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111010101;
300 => X"FFD5",

-- PUSHA;
-- L0050@012D 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
301 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = SBC;
-- L0051@012E 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
302 => X"1" & O"1" & O"0" & O"0" & O"0",

-- data16 =  'A';
-- L0051@012F 0041.  data16 =  'A';
--  data16 = 0000000001000001;
303 => X"0041",

-- POPA;
-- L0052@0130 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
304 => X"0" & O"4" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0053@0131 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
305 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ToLower1;
-- L0053@0132 0002.  data16 = !$ + 1 + @  ToLower1;
--  data16 = 0000000000000010;
306 => X"0002",

-- RTS;
-- L0054@0133 4002.ToLowerEx:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
307 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHA;
-- L0055@0134 0E03.ToLower1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
308 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = SBC;
-- L0056@0135 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
309 => X"1" & O"1" & O"0" & O"0" & O"0",

-- data16 =  '[';
-- L0056@0136 005B.  data16 =  '[';
--  data16 = 0000000001011011;
310 => X"005B",

-- POPA;
-- L0057@0137 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
311 => X"0" & O"4" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0058@0138 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
312 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  ToLowerEx;
-- L0058@0139 FFFA.  data16 = !$ + 1 + @  ToLowerEx;
--  data16 = 1111111111111010;
313 => X"FFFA",

-- r_p = M[IMM], r_a = ADC;
-- L0059@013A 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
314 => X"1" & O"5" & O"0" & O"0" & O"0",

-- data16 =  'A' - 'a';
-- L0059@013B FFE0.  data16 =  'A' - 'a';
--  data16 = 1111111111100000;
315 => X"FFE0",

-- RTS;
-- L0060@013C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
316 => X"4" & O"0" & O"0" & O"0" & O"2",

-- LDA, M[Y];
-- L0062@013D 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
317 => X"0" & O"4" & O"0" & O"6" & O"0",

-- IF_A_EQ;
-- L0063@013E 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintDone;
-- L0063@013F 0006.  data16 = !$ + 1 + @  PrintDone;
--  data16 = 0000000000000110;
319 => X"0006",

-- r_p = STP2, r_s = M[PUSH];
-- L0064@0140 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
320 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0064@0141 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
321 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0064@0142 0004.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000000000100;
322 => X"0004",

-- INY,BRANCH;
-- L0065@0143 2010.  INY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
323 => X"2" & O"0" & O"0" & O"2" & O"0",

-- .relative  Print;
-- L0065@0144 FFF9.  data16 = !$ + 1 + @  Print;
--  data16 = 1111111111111001;
324 => X"FFF9",

-- RTS;
-- L0066@0145 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
325 => X"4" & O"0" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0068@0146 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
326 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0068@0147 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
327 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  UART_OutChr;
-- L0068@0148 01F6.  data16 = !$ + 1 + @  UART_OutChr;
--  data16 = 0000000111110110;
328 => X"01F6",

-- BRANCH;
-- L0069@0149 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
329 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_OutChr;
-- L0069@014A 0210.  data16 = !$ + 1 + @  VGA_OutChr;
--  data16 = 0000001000010000;
330 => X"0210",

-- RTS;
-- L0070@014B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
331 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHY;
-- L0075@014C 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
332 => X"0" & O"0" & O"0" & O"7" & O"3",

-- PUSHX;
-- L0076@014D 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
333 => X"0" & O"0" & O"7" & O"0" & O"3",

-- PUSHA;
-- L0077@014E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
334 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_x = LDX;
-- L0078@014F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
335 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  3;
-- L0078@0150 0003.  data16 =  3;
--  data16 = 0000000000000011;
336 => X"0003",

-- IF_X_EQ;
-- L0079@0151 B000.PushNibLp:  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
337 => X"B" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintHexLp;
-- L0079@0152 0008.  data16 = !$ + 1 + @  PrintHexLp;
--  data16 = 0000000000001000;
338 => X"0008",

-- RRC;
-- L0080@0153 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
339 => X"0" & O"3" & O"0" & O"0" & O"0",

-- RRC;
-- L0081@0154 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
340 => X"0" & O"3" & O"0" & O"0" & O"0",

-- RRC;
-- L0082@0155 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
341 => X"0" & O"3" & O"0" & O"0" & O"0",

-- RRC;
-- L0083@0156 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
342 => X"0" & O"3" & O"0" & O"0" & O"0",

-- PUSHA;
-- L0084@0157 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
343 => X"0" & O"7" & O"0" & O"0" & O"3",

-- DEX,BRANCH;
-- L0085@0158 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
344 => X"2" & O"0" & O"3" & O"0" & O"0",

-- .relative  PushNibLp;
-- L0085@0159 FFF8.  data16 = !$ + 1 + @  PushNibLp;
--  data16 = 1111111111111000;
345 => X"FFF8",

-- r_p = M[IMM], r_x = CPX;
-- L0086@015A 1040.PrintHexLp:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
346 => X"1" & O"0" & O"1" & O"0" & O"0",

-- data16 =  4;
-- L0086@015B 0004.  data16 =  4;
--  data16 = 0000000000000100;
347 => X"0004",

-- IF_X_GE;
-- L0087@015C A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
348 => X"A" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintHexEx;
-- L0087@015D 000D.  data16 = !$ + 1 + @  PrintHexEx;
--  data16 = 0000000000001101;
349 => X"000D",

-- POPA;
-- L0088@015E 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
350 => X"0" & O"4" & O"0" & O"0" & O"2",

-- r_p = M[IMM], r_a = AND;
-- L0089@015F 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
351 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x000F;
-- L0089@0160 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
352 => X"000F",

-- r_p = M[IMM], r_y = LDY;
-- L0090@0161 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
353 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  @StrHex;
-- L0090@0162 0474.  data16 =  @StrHex;
--  data16 = 0000010001110100;
354 => X"0474",

-- ADY, A;
-- L0091@0163 0E28.  ADY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 101, r_s = 000;
355 => X"0" & O"7" & O"0" & O"5" & O"0",

-- LDA, M[Y];
-- L0092@0164 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
356 => X"0" & O"4" & O"0" & O"6" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0093@0165 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
357 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0093@0166 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
358 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0093@0167 FFDF.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 1111111111011111;
359 => X"FFDF",

-- INX,BRANCH;
-- L0094@0168 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
360 => X"2" & O"0" & O"2" & O"0" & O"0",

-- .relative  PrintHexLp;
-- L0094@0169 FFF1.  data16 = !$ + 1 + @  PrintHexLp;
--  data16 = 1111111111110001;
361 => X"FFF1",

-- POPX;
-- L0095@016A 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
362 => X"0" & O"0" & O"4" & O"0" & O"2",

-- POPY;
-- L0096@016B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
363 => X"0" & O"0" & O"0" & O"4" & O"2",

-- RTS;
-- L0097@016C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
364 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHY;
-- L0102@016D 003B.PrintBin:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
365 => X"0" & O"0" & O"0" & O"7" & O"3",

-- PUSHX;
-- L0103@016E 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
366 => X"0" & O"0" & O"7" & O"0" & O"3",

-- r_p = M[IMM], r_x = LDX;
-- L0104@016F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
367 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  16;
-- L0104@0170 0010.  data16 =  16;
--  data16 = 0000000000010000;
368 => X"0010",

-- IF_X_EQ;
-- L0105@0171 B000.PrintBinLp:  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
369 => X"B" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintHexEx;
-- L0105@0172 FFF8.  data16 = !$ + 1 + @  PrintHexEx;
--  data16 = 1111111111111000;
370 => X"FFF8",

-- STA, M[PUSH];
-- L0106@0173 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
371 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0106@0174 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
372 => X"0" & O"5" & O"0" & O"0" & O"2",

-- TAY;
-- L0107@0175 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
373 => X"0" & O"7" & O"0" & O"4" & O"0",

-- r_p = M[IMM], r_a = LDA;
-- L0108@0176 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
374 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  '0';
-- L0108@0177 0030.  data16 =  '0';
--  data16 = 0000000000110000;
375 => X"0030",

-- r_p = M[IMM], r_a = ADC;
-- L0109@0178 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
376 => X"1" & O"5" & O"0" & O"0" & O"0",

-- data16 =  0;
-- L0109@0179 0000.  data16 =  0;
--  data16 = 0000000000000000;
377 => X"0000",

-- r_p = STP2, r_s = M[PUSH];
-- L0110@017A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
378 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0110@017B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
379 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrintChr;
-- L0110@017C FFCA.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 1111111111001010;
380 => X"FFCA",

-- TYA, DEX,BRANCH;
-- L0111@017D 28F8.  LDA, Y, DEX,BRANCH;
--  r_p = 0010, r_a = 100, r_x = 011, r_y = 111, r_s = 000;
381 => X"2" & O"4" & O"3" & O"7" & O"0",

-- .relative  PrintBinLp;
-- L0111@017E FFF3.  data16 = !$ + 1 + @  PrintBinLp;
--  data16 = 1111111111110011;
382 => X"FFF3",

-- PUSHX;
-- L0134@017F 01C3.ParseInt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
383 => X"0" & O"0" & O"7" & O"0" & O"3",

-- r_p = M[IMM], r_a = AND;
-- L0135@0180 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
384 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0135@0181 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
385 => X"00FF",

-- r_p = STP2, r_s = M[PUSH];
-- L0136@0182 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
386 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0136@0183 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
387 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ToUpper;
-- L0136@0184 FF8F.  data16 = !$ + 1 + @  ToUpper;
--  data16 = 1111111110001111;
388 => X"FF8F",

-- PUSHA;
-- L0137@0185 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
389 => X"0" & O"7" & O"0" & O"0" & O"3",

-- CLRA;
-- L0138@0186 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
390 => X"0" & O"4" & O"0" & O"0" & O"0",

-- PUSHA;
-- L0139@0187 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
391 => X"0" & O"7" & O"0" & O"0" & O"3",

-- LDA, M[Y];
-- L0141@0188 0830.PIntGetChr:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
392 => X"0" & O"4" & O"0" & O"6" & O"0",

-- IF_A_EQ;
-- L0142@0189 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
393 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntExit;
-- L0142@018A 0175.  data16 = !$ + 1 + @  PIntExit;
--  data16 = 0000000101110101;
394 => X"0175",

-- r_p = STP2, r_s = M[PUSH];
-- L0143@018B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
395 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0143@018C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
396 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ToUpper;
-- L0143@018D FF86.  data16 = !$ + 1 + @  ToUpper;
--  data16 = 1111111110000110;
397 => X"FF86",

-- PUSHA;
-- L0144@018E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
398 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_x = LDX;
-- L0145@018F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
399 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  2;
-- L0145@0190 0002.  data16 =  2;
--  data16 = 0000000000000010;
400 => X"0002",

-- r_a = LDA, r_s = M[S];
-- L0147@0191 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
401 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0147@0192 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
402 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  ' ';
-- L0147@0193 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
403 => X"0020",

-- IF_A_EQ;
-- L0148@0194 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
404 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0148@0195 0003.  data16 = 3;
--  data16 = 0000000000000011;
405 => X"0003",

-- BRANCH;
-- L0148@0196 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
406 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntNosp;
-- L0148@0197 0012.  data16 = !$ + 1 + @  PIntNosp;
--  data16 = 0000000000010010;
407 => X"0012",

-- LDA, M[S+X];
-- L0150@0198 0986.PIntSpace:  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
408 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0151@0199 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
409 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b0110000000000000;
-- L0151@019A 6000.  data16 =  0b0110000000000000;
--  data16 = 0110000000000000;
410 => X"6000",

-- IF_A_EQ;
-- L0152@019B 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
411 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0152@019C 0003.  data16 = 3;
--  data16 = 0000000000000011;
412 => X"0003",

-- BRANCH;
-- L0152@019D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
413 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntOk;
-- L0152@019E 0168.  data16 = !$ + 1 + @  PIntOk;
--  data16 = 0000000101101000;
414 => X"0168",

-- LDA, M[S+X];
-- L0153@019F 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
415 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0154@01A0 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
416 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0154@01A1 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
417 => X"00FF",

-- IF_A_EQ;
-- L0155@01A2 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
418 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0155@01A3 0003.  data16 = 3;
--  data16 = 0000000000000011;
419 => X"0003",

-- BRANCH;
-- L0155@01A4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
420 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0155@01A5 0167.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000101100111;
421 => X"0167",

-- POPA;
-- L0156@01A6 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
422 => X"0" & O"4" & O"0" & O"0" & O"2",

-- INY,BRANCH;
-- L0157@01A7 2010.  INY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
423 => X"2" & O"0" & O"0" & O"2" & O"0",

-- .relative  PIntGetChr;
-- L0157@01A8 FFE0.  data16 = !$ + 1 + @  PIntGetChr;
--  data16 = 1111111111100000;
424 => X"FFE0",

-- r_a = LDA, r_s = M[S];
-- L0159@01A9 0806.PIntNosp:  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
425 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0159@01AA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
426 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  TAB;
-- L0159@01AB 0009.  data16 =  0x9;
--  data16 = 0000000000001001;
427 => X"0009",

-- IF_A_EQ;
-- L0160@01AC 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
428 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSpace;
-- L0160@01AD FFEB.  data16 = !$ + 1 + @  PIntSpace;
--  data16 = 1111111111101011;
429 => X"FFEB",

-- r_a = LDA, r_s = M[S];
-- L0162@01AE 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
430 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0162@01AF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
431 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '+';
-- L0162@01B0 002B.  data16 =  '+';
--  data16 = 0000000000101011;
432 => X"002B",

-- IF_A_EQ;
-- L0163@01B1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
433 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0163@01B2 0003.  data16 = 3;
--  data16 = 0000000000000011;
434 => X"0003",

-- BRANCH;
-- L0163@01B3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
435 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntNotPl;
-- L0163@01B4 0003.  data16 = !$ + 1 + @  PIntNotPl;
--  data16 = 0000000000000011;
436 => X"0003",

-- BRANCH;
-- L0165@01B5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
437 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSpace;
-- L0165@01B6 FFE2.  data16 = !$ + 1 + @  PIntSpace;
--  data16 = 1111111111100010;
438 => X"FFE2",

-- r_a = LDA, r_s = M[S];
-- L0167@01B7 0806.PIntNotPl:  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
439 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0167@01B8 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
440 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '-';
-- L0167@01B9 002D.  data16 =  '-';
--  data16 = 0000000000101101;
441 => X"002D",

-- IF_A_EQ;
-- L0168@01BA 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
442 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0168@01BB 0003.  data16 = 3;
--  data16 = 0000000000000011;
443 => X"0003",

-- BRANCH;
-- L0168@01BC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
444 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntNotMi;
-- L0168@01BD 0016.  data16 = !$ + 1 + @  PIntNotMi;
--  data16 = 0000000000010110;
445 => X"0016",

-- LDA, M[S+X];
-- L0170@01BE 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
446 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0171@01BF 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
447 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b0110000000000000;
-- L0171@01C0 6000.  data16 =  0b0110000000000000;
--  data16 = 0110000000000000;
448 => X"6000",

-- IF_A_EQ;
-- L0172@01C1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
449 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0172@01C2 0003.  data16 = 3;
--  data16 = 0000000000000011;
450 => X"0003",

-- BRANCH;
-- L0172@01C3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
451 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntOk;
-- L0172@01C4 0142.  data16 = !$ + 1 + @  PIntOk;
--  data16 = 0000000101000010;
452 => X"0142",

-- LDA, M[S+X];
-- L0173@01C5 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
453 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0174@01C6 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
454 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0174@01C7 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
455 => X"00FF",

-- IF_A_EQ;
-- L0175@01C8 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
456 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0175@01C9 0003.  data16 = 3;
--  data16 = 0000000000000011;
457 => X"0003",

-- BRANCH;
-- L0175@01CA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
458 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0175@01CB 0141.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000101000001;
459 => X"0141",

-- LDA, M[S+X];
-- L0176@01CC 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
460 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0177@01CD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
461 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  0b1000000000000000;
-- L0177@01CE 8000.  data16 =  0b1000000000000000;
--  data16 = 1000000000000000;
462 => X"8000",

-- STA, M[S+X];
-- L0178@01CF 0F86.PIntUState:  STA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 110;
463 => X"0" & O"7" & O"6" & O"0" & O"6",

-- POPA;
-- L0179@01D0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
464 => X"0" & O"4" & O"0" & O"0" & O"2",

-- INY,BRANCH;
-- L0180@01D1 2010.  INY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
465 => X"2" & O"0" & O"0" & O"2" & O"0",

-- .relative  PIntGetChr;
-- L0180@01D2 FFB6.  data16 = !$ + 1 + @  PIntGetChr;
--  data16 = 1111111110110110;
466 => X"FFB6",

-- r_a = LDA, r_s = M[S];
-- L0182@01D3 0806.PIntNotMi:  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
467 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0182@01D4 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
468 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'B';
-- L0182@01D5 0042.  data16 =  'B';
--  data16 = 0000000001000010;
469 => X"0042",

-- IF_A_EQ;
-- L0183@01D6 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
470 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0183@01D7 0003.  data16 = 3;
--  data16 = 0000000000000011;
471 => X"0003",

-- BRANCH;
-- L0183@01D8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
472 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntNotBin;
-- L0183@01D9 0020.  data16 = !$ + 1 + @  PIntNotBin;
--  data16 = 0000000000100000;
473 => X"0020",

-- r_p = M[IMM], r_x = LDX;
-- L0185@01DA 1100.PIntSetF:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
474 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  2;
-- L0185@01DB 0002.  data16 =  2;
--  data16 = 0000000000000010;
475 => X"0002",

-- LDA, M[S+X];
-- L0186@01DC 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
476 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0187@01DD 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
477 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0187@01DE 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
478 => X"00FF",

-- r_p = M[IMM], r_a = XOR;
-- L0188@01DF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
479 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'X';
-- L0188@01E0 0058.  data16 =  'X';
--  data16 = 0000000001011000;
480 => X"0058",

-- IF_A_EQ;
-- L0189@01E1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
481 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX1;
-- L0189@01E2 00BD.  data16 = !$ + 1 + @  PIntX1;
--  data16 = 0000000010111101;
482 => X"00BD",

-- LDA, M[S+X];
-- L0190@01E3 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
483 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0191@01E4 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
484 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b0110000000000000;
-- L0191@01E5 6000.  data16 =  0b0110000000000000;
--  data16 = 0110000000000000;
485 => X"6000",

-- r_p = M[IMM], r_a = XOR;
-- L0192@01E6 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
486 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  0b0010000000000000;
-- L0192@01E7 2000.  data16 =  0b0010000000000000;
--  data16 = 0010000000000000;
487 => X"2000",

-- IF_A_EQ;
-- L0193@01E8 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
488 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0193@01E9 0003.  data16 = 3;
--  data16 = 0000000000000011;
489 => X"0003",

-- BRANCH;
-- L0193@01EA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
490 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0193@01EB 0121.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000100100001;
491 => X"0121",

-- LDA, M[S+X];
-- L0194@01EC 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
492 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0195@01ED 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
493 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b1000000000000000;
-- L0195@01EE 8000.  data16 =  0b1000000000000000;
--  data16 = 1000000000000000;
494 => X"8000",

-- IF_A_EQ;
-- L0196@01EF 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
495 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntClrS;
-- L0196@01F0 0006.  data16 = !$ + 1 + @  PIntClrS;
--  data16 = 0000000000000110;
496 => X"0006",

-- LDA, M[S];
-- L0197@01F1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
497 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0198@01F2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
498 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  0b1000000000000000;
-- L0198@01F3 8000.  data16 =  0b1000000000000000;
--  data16 = 1000000000000000;
499 => X"8000",

-- BRANCH;
-- L0199@01F4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
500 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntUState;
-- L0199@01F5 FFDA.  data16 = !$ + 1 + @  PIntUState;
--  data16 = 1111111111011010;
501 => X"FFDA",

-- LDA, M[S];
-- L0200@01F6 0806.PIntClrS:  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
502 => X"0" & O"4" & O"0" & O"0" & O"6",

-- BRANCH;
-- L0201@01F7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
503 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntUState;
-- L0201@01F8 FFD7.  data16 = !$ + 1 + @  PIntUState;
--  data16 = 1111111111010111;
504 => X"FFD7",

-- r_a = LDA, r_s = M[S];
-- L0203@01F9 0806.PIntNotBin:  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
505 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0203@01FA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
506 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'O';
-- L0203@01FB 004F.  data16 =  'O';
--  data16 = 0000000001001111;
507 => X"004F",

-- IF_A_EQ;
-- L0204@01FC 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
508 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSetF;
-- L0204@01FD FFDD.  data16 = !$ + 1 + @  PIntSetF;
--  data16 = 1111111111011101;
509 => X"FFDD",

-- r_a = LDA, r_s = M[S];
-- L0206@01FE 0806.PIntNotOct:  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
510 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0206@01FF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
511 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'X';
-- L0206@0200 0058.  data16 =  'X';
--  data16 = 0000000001011000;
512 => X"0058",

-- IF_A_EQ;
-- L0207@0201 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
513 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSetF;
-- L0207@0202 FFD8.  data16 = !$ + 1 + @  PIntSetF;
--  data16 = 1111111111011000;
514 => X"FFD8",

-- r_a = LDA, r_s = M[S];
-- L0209@0203 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
515 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0209@0204 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
516 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '0';
-- L0209@0205 0030.  data16 =  '0';
--  data16 = 0000000000110000;
517 => X"0030",

-- IF_A_EQ;
-- L0210@0206 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
518 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0210@0207 0003.  data16 = 3;
--  data16 = 0000000000000011;
519 => X"0003",

-- BRANCH;
-- L0210@0208 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
520 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntNot0;
-- L0210@0209 00B0.  data16 = !$ + 1 + @  PIntNot0;
--  data16 = 0000000010110000;
521 => X"00B0",

-- LDA, M[S+X];
-- L0212@020A 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
522 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0213@020B 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
523 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x4000;
-- L0213@020C 4000.  data16 =  0x4000;
--  data16 = 0100000000000000;
524 => X"4000",

-- IF_A_EQ;
-- L0214@020D 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
525 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0214@020E 0003.  data16 = 3;
--  data16 = 0000000000000011;
526 => X"0003",

-- BRANCH;
-- L0214@020F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
527 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntBODX;
-- L0214@0210 0013.  data16 = !$ + 1 + @  PIntBODX;
--  data16 = 0000000000010011;
528 => X"0013",

-- INY,BRANCH;
-- L0215@0211 2010.  INY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
529 => X"2" & O"0" & O"0" & O"2" & O"0",

-- .relative  PIntGetChr;
-- L0215@0212 FF76.  data16 = !$ + 1 + @  PIntGetChr;
--  data16 = 1111111101110110;
530 => X"FF76",

-- LDA, M[S+X];
-- L0216@0213 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
531 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0217@0214 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
532 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b1101111111111111;
-- L0217@0215 DFFF.  data16 =  0b1101111111111111;
--  data16 = 1101111111111111;
533 => X"DFFF",

-- r_p = M[IMM], r_a = XOR;
-- L0218@0216 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
534 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  0b0010000000000000;
-- L0218@0217 2000.  data16 =  0b0010000000000000;
--  data16 = 0010000000000000;
535 => X"2000",

-- BRANCH;
-- L0219@0218 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
536 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntUState;
-- L0219@0219 FFB6.  data16 = !$ + 1 + @  PIntUState;
--  data16 = 1111111110110110;
537 => X"FFB6",

-- r_p = M[IMM], r_x = LDX;
-- L0221@021A 1100.ForceDec:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
538 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  2;
-- L0221@021B 0002.  data16 =  2;
--  data16 = 0000000000000010;
539 => X"0002",

-- LDA, M[S+X];
-- L0222@021C 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
540 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0223@021D 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
541 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0xFF00;
-- L0223@021E FF00.  data16 =  0xFF00;
--  data16 = 1111111100000000;
542 => X"FF00",

-- r_p = M[IMM], r_a = XOR;
-- L0224@021F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
543 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'D';
-- L0224@0220 0044.  data16 =  'D';
--  data16 = 0000000001000100;
544 => X"0044",

-- DEY,BRANCH;
-- L0225@0221 2018.  DEY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
545 => X"2" & O"0" & O"0" & O"3" & O"0",

-- .relative  PIntUState;
-- L0225@0222 FFAD.  data16 = !$ + 1 + @  PIntUState;
--  data16 = 1111111110101101;
546 => X"FFAD",

-- r_p = M[IMM], r_x = LDX;
-- L0227@0223 1100.PIntBODX:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
547 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  2;
-- L0227@0224 0002.  data16 =  2;
--  data16 = 0000000000000010;
548 => X"0002",

-- LDA, M[S+X];
-- L0228@0225 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
549 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0229@0226 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
550 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0229@0227 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
551 => X"00FF",

-- IF_A_EQ;
-- L0230@0228 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
552 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  ForceDec;
-- L0230@0229 FFF1.  data16 = !$ + 1 + @  ForceDec;
--  data16 = 1111111111110001;
553 => X"FFF1",

-- r_p = M[IMM], r_a = XOR;
-- L0231@022A 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
554 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'B';
-- L0231@022B 0042.  data16 =  'B';
--  data16 = 0000000001000010;
555 => X"0042",

-- IF_A_EQ;
-- L0232@022C 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
556 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0232@022D 0003.  data16 = 3;
--  data16 = 0000000000000011;
557 => X"0003",

-- BRANCH;
-- L0232@022E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
558 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0232@022F 0014.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 0000000000010100;
559 => X"0014",

-- DEX;
-- L0234@0230 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
560 => X"0" & O"0" & O"3" & O"0" & O"0",

-- DEX;
-- L0235@0231 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
561 => X"0" & O"0" & O"3" & O"0" & O"0",

-- LDA, M[S+X];
-- L0236@0232 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
562 => X"0" & O"4" & O"6" & O"0" & O"6",

-- INX, RRC;
-- L0237@0233 0680.  INX, RRC;
--  r_p = 0000, r_a = 011, r_x = 010, r_y = 000, r_s = 000;
563 => X"0" & O"3" & O"2" & O"0" & O"0",

-- LDA, M[S+X];
-- L0238@0234 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
564 => X"0" & O"4" & O"6" & O"0" & O"6",

-- STA, M[PUSH];
-- L0239@0235 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
565 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0239@0236 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
566 => X"0" & O"5" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0240@0237 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
567 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0240@0238 00D4.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000011010100;
568 => X"00D4",

-- STA, M[S+X];
-- L0241@0239 0F86.PIntSetV:  STA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 110;
569 => X"0" & O"7" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_x = LDX;
-- L0242@023A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
570 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  2;
-- L0242@023B 0002.  data16 =  2;
--  data16 = 0000000000000010;
571 => X"0002",

-- LDA, M[S+X];
-- L0243@023C 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
572 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0244@023D 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
573 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b1011111111111111;
-- L0244@023E BFFF.  data16 =  0b1011111111111111;
--  data16 = 1011111111111111;
574 => X"BFFF",

-- r_p = M[IMM], r_a = XOR;
-- L0245@023F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
575 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  0b0100000000000000;
-- L0245@0240 4000.  data16 =  0b0100000000000000;
--  data16 = 0100000000000000;
576 => X"4000",

-- BRANCH;
-- L0246@0241 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
577 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntUState;
-- L0246@0242 FF8D.  data16 = !$ + 1 + @  PIntUState;
--  data16 = 1111111110001101;
578 => X"FF8D",

-- LDA, M[S+X];
-- L0248@0243 0986.PIntODX:  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
579 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0249@0244 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
580 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0249@0245 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
581 => X"00FF",

-- IF_A_EQ;
-- L0250@0246 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
582 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  ForceDec;
-- L0250@0247 FFD3.  data16 = !$ + 1 + @  ForceDec;
--  data16 = 1111111111010011;
583 => X"FFD3",

-- r_p = M[IMM], r_a = XOR;
-- L0251@0248 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
584 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'O';
-- L0251@0249 004F.  data16 =  'O';
--  data16 = 0000000001001111;
585 => X"004F",

-- IF_A_EQ;
-- L0252@024A 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
586 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0252@024B 0003.  data16 = 3;
--  data16 = 0000000000000011;
587 => X"0003",

-- BRANCH;
-- L0252@024C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
588 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntDX;
-- L0252@024D 001C.  data16 = !$ + 1 + @  PIntDX;
--  data16 = 0000000000011100;
589 => X"001C",

-- DEX;
-- L0254@024E 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
590 => X"0" & O"0" & O"3" & O"0" & O"0",

-- LDA, M[S+X];
-- L0255@024F 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
591 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = STP2, r_s = M[PUSH];
-- L0256@0250 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
592 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0256@0251 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
593 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0256@0252 FEAA.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111010101010;
594 => X"FEAA",

-- STA, M[PUSH];
-- L0257@0253 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
595 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0257@0254 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
596 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0258@0255 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
597 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0258@0256 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
598 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0258@0257 FEA5.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111010100101;
599 => X"FEA5",

-- STA, M[PUSH];
-- L0259@0258 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
600 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0259@0259 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
601 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0260@025A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
602 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0260@025B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
603 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0260@025C FEA0.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111010100000;
604 => X"FEA0",

-- STA, M[PUSH];
-- L0261@025D 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
605 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0261@025E 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
606 => X"0" & O"5" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0262@025F 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
607 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0262@0260 00AC.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000010101100;
608 => X"00AC",

-- STA, M[S+X];
-- L0263@0261 0F86.  STA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 110;
609 => X"0" & O"7" & O"6" & O"0" & O"6",

-- DEX;
-- L0264@0262 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
610 => X"0" & O"0" & O"3" & O"0" & O"0",

-- LDA, M[S+X];
-- L0265@0263 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
611 => X"0" & O"4" & O"6" & O"0" & O"6",

-- INX,r_p = M[IMM], r_a = AND;
-- L0266@0264 1C80.  INX,r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 010, r_y = 000, r_s = 000;
612 => X"1" & O"6" & O"2" & O"0" & O"0",

-- data16 =  0x0007;
-- L0266@0265 0007.  data16 =  0x0007;
--  data16 = 0000000000000111;
613 => X"0007",

-- ADC, M[S+X];
-- L0267@0266 0B86.  ADC, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 101, r_x = 110, r_y = 000, r_s = 110;
614 => X"0" & O"5" & O"6" & O"0" & O"6",

-- BRANCH;
-- L0268@0267 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
615 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSetV;
-- L0268@0268 FFD1.  data16 = !$ + 1 + @  PIntSetV;
--  data16 = 1111111111010001;
616 => X"FFD1",

-- LDA, M[S+X];
-- L0270@0269 0986.PIntDX:  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
617 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0271@026A 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
618 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0271@026B 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
619 => X"00FF",

-- IF_A_EQ;
-- L0272@026C 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
620 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  ForceDec;
-- L0272@026D FFAD.  data16 = !$ + 1 + @  ForceDec;
--  data16 = 1111111110101101;
621 => X"FFAD",

-- r_p = M[IMM], r_a = XOR;
-- L0273@026E 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
622 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'D';
-- L0273@026F 0044.  data16 =  'D';
--  data16 = 0000000001000100;
623 => X"0044",

-- IF_A_EQ;
-- L0274@0270 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
624 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0274@0271 0003.  data16 = 3;
--  data16 = 0000000000000011;
625 => X"0003",

-- BRANCH;
-- L0274@0272 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
626 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX;
-- L0274@0273 0023.  data16 = !$ + 1 + @  PIntX;
--  data16 = 0000000000100011;
627 => X"0023",

-- DEX;
-- L0276@0274 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
628 => X"0" & O"0" & O"3" & O"0" & O"0",

-- LDA, M[S+X];
-- L0277@0275 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
629 => X"0" & O"4" & O"6" & O"0" & O"6",

-- LDX, A;
-- L0278@0276 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
630 => X"0" & O"7" & O"4" & O"0" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0279@0277 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
631 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0279@0278 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
632 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0279@0279 FE83.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111010000011;
633 => X"FE83",

-- STA, M[PUSH];
-- L0280@027A 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
634 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0280@027B 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
635 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0281@027C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
636 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0281@027D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
637 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0281@027E FE7E.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001111110;
638 => X"FE7E",

-- STA, M[PUSH];
-- L0282@027F 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
639 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0282@0280 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
640 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0283@0281 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
641 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0283@0282 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
642 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0283@0283 FE79.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001111001;
643 => X"FE79",

-- ADC, X;
-- L0284@0284 0BC0.  ADC, X;
--  r_p = 0000, r_a = 101, r_x = 111, r_y = 000, r_s = 000;
644 => X"0" & O"5" & O"7" & O"0" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0285@0285 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
645 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0285@0286 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
646 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0285@0287 FE75.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001110101;
647 => X"FE75",

-- STA, M[PUSH];
-- L0286@0288 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
648 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0286@0289 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
649 => X"0" & O"5" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0287@028A 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
650 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0287@028B 0081.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000010000001;
651 => X"0081",

-- r_p = M[IMM], r_x = LDX;
-- L0288@028C 1100.PIntSetDX:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
652 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  1;
-- L0288@028D 0001.  data16 =  1;
--  data16 = 0000000000000001;
653 => X"0001",

-- STA, M[S+X];
-- L0289@028E 0F86.  STA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 110;
654 => X"0" & O"7" & O"6" & O"0" & O"6",

-- DEX;
-- L0290@028F 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
655 => X"0" & O"0" & O"3" & O"0" & O"0",

-- LDA, M[S+X];
-- L0291@0290 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
656 => X"0" & O"4" & O"6" & O"0" & O"6",

-- INX,r_p = M[IMM], r_a = AND;
-- L0292@0291 1C80.  INX,r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 010, r_y = 000, r_s = 000;
657 => X"1" & O"6" & O"2" & O"0" & O"0",

-- data16 =  0x000F;
-- L0292@0292 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
658 => X"000F",

-- ADC, M[S+X];
-- L0293@0293 0B86.  ADC, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 101, r_x = 110, r_y = 000, r_s = 110;
659 => X"0" & O"5" & O"6" & O"0" & O"6",

-- BRANCH;
-- L0294@0294 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
660 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSetV;
-- L0294@0295 FFA4.  data16 = !$ + 1 + @  PIntSetV;
--  data16 = 1111111110100100;
661 => X"FFA4",

-- LDA, M[S+X];
-- L0296@0296 0986.PIntX:  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
662 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0297@0297 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
663 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0297@0298 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
664 => X"00FF",

-- r_p = M[IMM], r_a = XOR;
-- L0298@0299 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
665 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'X';
-- L0298@029A 0058.  data16 =  'X';
--  data16 = 0000000001011000;
666 => X"0058",

-- IF_A_EQ;
-- L0299@029B 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
667 => X"9" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0299@029C 0003.  data16 = 3;
--  data16 = 0000000000000011;
668 => X"0003",

-- BRANCH;
-- L0299@029D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
669 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0299@029E 006E.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000001101110;
670 => X"006E",

-- DEX;
-- L0301@029F 00C0.PIntX1:  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
671 => X"0" & O"0" & O"3" & O"0" & O"0",

-- LDA, M[S+X];
-- L0302@02A0 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
672 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = STP2, r_s = M[PUSH];
-- L0303@02A1 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
673 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0303@02A2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
674 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0303@02A3 FE59.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001011001;
675 => X"FE59",

-- STA, M[PUSH];
-- L0304@02A4 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
676 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0304@02A5 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
677 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0305@02A6 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
678 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0305@02A7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
679 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0305@02A8 FE54.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001010100;
680 => X"FE54",

-- STA, M[PUSH];
-- L0306@02A9 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
681 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0306@02AA 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
682 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0307@02AB 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
683 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0307@02AC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
684 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0307@02AD FE4F.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001001111;
685 => X"FE4F",

-- STA, M[PUSH];
-- L0308@02AE 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
686 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0308@02AF 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
687 => X"0" & O"5" & O"0" & O"0" & O"2",

-- r_p = STP2, r_s = M[PUSH];
-- L0309@02B0 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
688 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0309@02B1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
689 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0309@02B2 FE4A.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111001001010;
690 => X"FE4A",

-- STA, M[PUSH];
-- L0310@02B3 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
691 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0310@02B4 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
692 => X"0" & O"5" & O"0" & O"0" & O"2",

-- IF_A_GE;
-- L0311@02B5 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
693 => X"8" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0311@02B6 0056.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000001010110;
694 => X"0056",

-- BRANCH;
-- L0312@02B7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
695 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntSetDX;
-- L0312@02B8 FFD4.  data16 = !$ + 1 + @  PIntSetDX;
--  data16 = 1111111111010100;
696 => X"FFD4",

-- r_a = LDA, r_s = M[S];
-- L0314@02B9 0806.PIntNot0:  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
697 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0314@02BA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
698 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '1';
-- L0314@02BB 0031.  data16 =  '1';
--  data16 = 0000000000110001;
699 => X"0031",

-- IF_A_EQ;
-- L0315@02BC 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
700 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntBODX;
-- L0315@02BD FF66.  data16 = !$ + 1 + @  PIntBODX;
--  data16 = 1111111101100110;
701 => X"FF66",

-- r_a = LDA, r_s = M[S];
-- L0317@02BE 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
702 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0317@02BF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
703 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '2';
-- L0317@02C0 0032.  data16 =  '2';
--  data16 = 0000000000110010;
704 => X"0032",

-- IF_A_EQ;
-- L0318@02C1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
705 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0318@02C2 FF81.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 1111111110000001;
706 => X"FF81",

-- r_a = LDA, r_s = M[S];
-- L0320@02C3 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
707 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0320@02C4 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
708 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '3';
-- L0320@02C5 0033.  data16 =  '3';
--  data16 = 0000000000110011;
709 => X"0033",

-- IF_A_EQ;
-- L0321@02C6 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
710 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0321@02C7 FF7C.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 1111111101111100;
711 => X"FF7C",

-- r_a = LDA, r_s = M[S];
-- L0323@02C8 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
712 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0323@02C9 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
713 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '4';
-- L0323@02CA 0034.  data16 =  '4';
--  data16 = 0000000000110100;
714 => X"0034",

-- IF_A_EQ;
-- L0324@02CB 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
715 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0324@02CC FF77.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 1111111101110111;
716 => X"FF77",

-- r_a = LDA, r_s = M[S];
-- L0326@02CD 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
717 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0326@02CE 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
718 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '5';
-- L0326@02CF 0035.  data16 =  '5';
--  data16 = 0000000000110101;
719 => X"0035",

-- IF_A_EQ;
-- L0327@02D0 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
720 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0327@02D1 FF72.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 1111111101110010;
721 => X"FF72",

-- r_a = LDA, r_s = M[S];
-- L0329@02D2 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
722 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0329@02D3 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
723 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '6';
-- L0329@02D4 0036.  data16 =  '6';
--  data16 = 0000000000110110;
724 => X"0036",

-- IF_A_EQ;
-- L0330@02D5 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
725 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0330@02D6 FF6D.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 1111111101101101;
726 => X"FF6D",

-- r_a = LDA, r_s = M[S];
-- L0332@02D7 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
727 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0332@02D8 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
728 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '7';
-- L0332@02D9 0037.  data16 =  '7';
--  data16 = 0000000000110111;
729 => X"0037",

-- IF_A_EQ;
-- L0333@02DA 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
730 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntODX;
-- L0333@02DB FF68.  data16 = !$ + 1 + @  PIntODX;
--  data16 = 1111111101101000;
731 => X"FF68",

-- r_a = LDA, r_s = M[S];
-- L0335@02DC 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
732 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0335@02DD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
733 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '8';
-- L0335@02DE 0038.  data16 =  '8';
--  data16 = 0000000000111000;
734 => X"0038",

-- IF_A_EQ;
-- L0336@02DF 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
735 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntDX;
-- L0336@02E0 FF89.  data16 = !$ + 1 + @  PIntDX;
--  data16 = 1111111110001001;
736 => X"FF89",

-- r_a = LDA, r_s = M[S];
-- L0338@02E1 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
737 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0338@02E2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
738 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  '9';
-- L0338@02E3 0039.  data16 =  '9';
--  data16 = 0000000000111001;
739 => X"0039",

-- IF_A_EQ;
-- L0339@02E4 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
740 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntDX;
-- L0339@02E5 FF84.  data16 = !$ + 1 + @  PIntDX;
--  data16 = 1111111110000100;
741 => X"FF84",

-- r_a = LDA, r_s = M[S];
-- L0341@02E6 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
742 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0341@02E7 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
743 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'A';
-- L0341@02E8 0041.  data16 =  'A';
--  data16 = 0000000001000001;
744 => X"0041",

-- IF_A_EQ;
-- L0342@02E9 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
745 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX;
-- L0342@02EA FFAC.  data16 = !$ + 1 + @  PIntX;
--  data16 = 1111111110101100;
746 => X"FFAC",

-- r_a = LDA, r_s = M[S];
-- L0347@02EB 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
747 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0347@02EC 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
748 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'C';
-- L0347@02ED 0043.  data16 =  'C';
--  data16 = 0000000001000011;
749 => X"0043",

-- IF_A_EQ;
-- L0348@02EE 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
750 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX;
-- L0348@02EF FFA7.  data16 = !$ + 1 + @  PIntX;
--  data16 = 1111111110100111;
751 => X"FFA7",

-- r_a = LDA, r_s = M[S];
-- L0350@02F0 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
752 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0350@02F1 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
753 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'D';
-- L0350@02F2 0044.  data16 =  'D';
--  data16 = 0000000001000100;
754 => X"0044",

-- IF_A_EQ;
-- L0351@02F3 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
755 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX;
-- L0351@02F4 FFA2.  data16 = !$ + 1 + @  PIntX;
--  data16 = 1111111110100010;
756 => X"FFA2",

-- r_a = LDA, r_s = M[S];
-- L0353@02F5 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
757 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0353@02F6 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
758 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'E';
-- L0353@02F7 0045.  data16 =  'E';
--  data16 = 0000000001000101;
759 => X"0045",

-- IF_A_EQ;
-- L0354@02F8 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
760 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX;
-- L0354@02F9 FF9D.  data16 = !$ + 1 + @  PIntX;
--  data16 = 1111111110011101;
761 => X"FF9D",

-- r_a = LDA, r_s = M[S];
-- L0356@02FA 0806.  r_a = LDA, r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
762 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0356@02FB 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
763 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  'F';
-- L0356@02FC 0046.  data16 =  'F';
--  data16 = 0000000001000110;
764 => X"0046",

-- IF_A_EQ;
-- L0357@02FD 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
765 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntX;
-- L0357@02FE FF98.  data16 = !$ + 1 + @  PIntX;
--  data16 = 1111111110011000;
766 => X"FF98",

-- r_p = M[IMM], r_x = LDX;
-- L0362@02FF 1100.PIntExit:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
767 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  2;
-- L0362@0300 0002.  data16 =  2;
--  data16 = 0000000000000010;
768 => X"0002",

-- LDA, M[S+X];
-- L0363@0301 0986.  LDA, r_x = M[X], r_s = M[S];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 110;
769 => X"0" & O"4" & O"6" & O"0" & O"6",

-- r_p = M[IMM], r_a = AND;
-- L0364@0302 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
770 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0b0100000000000000;
-- L0364@0303 4000.  data16 =  0b0100000000000000;
--  data16 = 0100000000000000;
771 => X"4000",

-- IF_A_EQ;
-- L0365@0304 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
772 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  PIntErr;
-- L0365@0305 0007.  data16 = !$ + 1 + @  PIntErr;
--  data16 = 0000000000000111;
773 => X"0007",

-- POPA;
-- L0366@0306 0802.PIntOk:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
774 => X"0" & O"4" & O"0" & O"0" & O"2",

-- POPA;
-- L0367@0307 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
775 => X"0" & O"4" & O"0" & O"0" & O"2",

-- POPX;
-- L0368@0308 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
776 => X"0" & O"0" & O"4" & O"0" & O"2",

-- POPX;
-- L0369@0309 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
777 => X"0" & O"0" & O"4" & O"0" & O"2",

-- BRANCH;
-- L0370@030A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
778 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0370@030B FDF1.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111110111110001;
779 => X"FDF1",

-- POPA;
-- L0371@030C 0802.PIntErr:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
780 => X"0" & O"4" & O"0" & O"0" & O"2",

-- POPA;
-- L0372@030D 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
781 => X"0" & O"4" & O"0" & O"0" & O"2",

-- POPX;
-- L0373@030E 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
782 => X"0" & O"0" & O"4" & O"0" & O"2",

-- POPX;
-- L0374@030F 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
783 => X"0" & O"0" & O"4" & O"0" & O"2",

-- BRANCH;
-- L0375@0310 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
784 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SEC;
-- L0375@0311 FDF0.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111110111110000;
785 => X"FDF0",

-- r_p = M[IMM], r_y = LDY;
-- L0002@0312 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
786 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  UART_CONTROL;
-- L0002@0313 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
787 => X"2000",

-- r_p = M[IMM], r_a = LDA;
-- L0003@0314 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
788 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  3;
-- L0003@0315 0003.  data16 =  3;
--  data16 = 0000000000000011;
789 => X"0003",

-- STA, M[Y];
-- L0004@0316 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
790 => X"0" & O"7" & O"0" & O"6" & O"0",

-- r_p = M[IMM], r_a = LDA;
-- L0005@0317 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
791 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  0x10;
-- L0005@0318 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
792 => X"0010",

-- STA, M[Y];
-- L0006@0319 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
793 => X"0" & O"7" & O"0" & O"6" & O"0",

-- RTS;
-- L0007@031A 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
794 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHF;
-- L0010@031B 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
795 => X"0" & O"0" & O"0" & O"0" & O"3",

-- TRACEOFF;
-- L0011@031C 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
796 => X"7" & O"7" & O"7" & O"7" & O"7",

-- PUSHY;
-- L0012@031D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
797 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = M[IMM], r_y = LDY;
-- L0013@031E 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
798 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  UART_STATUS;
-- L0013@031F 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
799 => X"2000",

-- r_p = STP2, r_s = M[PUSH];
-- L0014@0320 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
800 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0014@0321 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
801 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetStatus;
-- L0014@0322 002B.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000101011;
802 => X"002B",

-- r_p = M[IMM], r_a = AND;
-- L0015@0323 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
803 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x0001;
-- L0015@0324 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
804 => X"0001",

-- IF_A_EQ;
-- L0016@0325 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
805 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  RdStatus0;
-- L0016@0326 FFFA.  data16 = !$ + 1 + @  RdStatus0;
--  data16 = 1111111111111010;
806 => X"FFFA",

-- INY;
-- L0017@0327 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
807 => X"0" & O"0" & O"0" & O"2" & O"0",

-- LDA, M[Y];
-- L0018@0328 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
808 => X"0" & O"4" & O"0" & O"6" & O"0",

-- r_p = M[IMM], r_a = AND;
-- L0019@0329 1C00.NoChar:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
809 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0019@032A 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
810 => X"00FF",

-- POPY;
-- L0020@032B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
811 => X"0" & O"0" & O"0" & O"4" & O"2",

-- POPF;
-- L0021@032C 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
812 => X"0" & O"0" & O"0" & O"0" & O"2",

-- RTS  ;
-- L0021@032D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
813 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHF;
-- L0024@032E 0003.UART_ChkChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
814 => X"0" & O"0" & O"0" & O"0" & O"3",

-- TRACEOFF;
-- L0025@032F 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
815 => X"7" & O"7" & O"7" & O"7" & O"7",

-- PUSHY;
-- L0026@0330 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
816 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = M[IMM], r_y = LDY;
-- L0027@0331 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
817 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  UART_STATUS;
-- L0027@0332 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
818 => X"2000",

-- r_p = STP2, r_s = M[PUSH];
-- L0028@0333 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
819 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0028@0334 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
820 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetStatus;
-- L0028@0335 0018.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000011000;
821 => X"0018",

-- r_p = M[IMM], r_a = AND;
-- L0029@0336 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
822 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x0001;
-- L0029@0337 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
823 => X"0001",

-- IF_A_EQ;
-- L0030@0338 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
824 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  NoChar;
-- L0030@0339 FFF0.  data16 = !$ + 1 + @  NoChar;
--  data16 = 1111111111110000;
825 => X"FFF0",

-- BRANCH;
-- L0031@033A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
826 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetChr;
-- L0031@033B FFEC.  data16 = !$ + 1 + @  GetChr;
--  data16 = 1111111111101100;
827 => X"FFEC",

-- r_p = M[IMM], r_a = LDA;
-- L0034@033C 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
828 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  BEL;
-- L0034@033D 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
829 => X"0007",

-- PUSHY;
-- L0035@033E 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
830 => X"0" & O"0" & O"0" & O"7" & O"3",

-- PUSHA;
-- L0036@033F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
831 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_y = LDY;
-- L0037@0340 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
832 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  UART_STATUS;
-- L0037@0341 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
833 => X"2000",

-- r_p = STP2, r_s = M[PUSH];
-- L0038@0342 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
834 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0038@0343 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
835 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetStatus;
-- L0038@0344 0009.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000001001;
836 => X"0009",

-- r_p = M[IMM], r_a = AND;
-- L0039@0345 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
837 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x0002;
-- L0039@0346 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
838 => X"0002",

-- IF_A_EQ;
-- L0040@0347 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
839 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  RdStatus1;
-- L0040@0348 FFFA.  data16 = !$ + 1 + @  RdStatus1;
--  data16 = 1111111111111010;
840 => X"FFFA",

-- INY, POPA;
-- L0041@0349 0812.OutChr:  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
841 => X"0" & O"4" & O"0" & O"2" & O"2",

-- STA, M[Y];
-- L0042@034A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
842 => X"0" & O"7" & O"0" & O"6" & O"0",

-- POPY;
-- L0043@034B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
843 => X"0" & O"0" & O"0" & O"4" & O"2",

-- RTS;
-- L0044@034C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
844 => X"4" & O"0" & O"0" & O"0" & O"2",

-- LDA, M[Y];
-- L0046@034D 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
845 => X"0" & O"4" & O"0" & O"6" & O"0",

-- PUSHA;
-- L0047@034E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
846 => X"0" & O"7" & O"0" & O"0" & O"3",

-- LDA, M[Y];
-- L0048@034F 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
847 => X"0" & O"4" & O"0" & O"6" & O"0",

-- XOR, M[S];
-- L0049@0350 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
848 => X"0" & O"2" & O"0" & O"0" & O"6",

-- IF_A_EQ;
-- L0050@0351 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
849 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  StIsStable;
-- L0050@0352 0004.  data16 = !$ + 1 + @  StIsStable;
--  data16 = 0000000000000100;
850 => X"0004",

-- POPA;
-- L0051@0353 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
851 => X"0" & O"4" & O"0" & O"0" & O"2",

-- BRANCH;
-- L0052@0354 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
852 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetStatus;
-- L0052@0355 FFF8.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 1111111111111000;
853 => X"FFF8",

-- POPA;
-- L0053@0356 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
854 => X"0" & O"4" & O"0" & O"0" & O"2",

-- RTS;
-- L0054@0357 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
855 => X"4" & O"0" & O"0" & O"0" & O"2",

-- r_p = M[IMM], r_a = LDA;
-- L0004@0358 1800.VGA_Init:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
856 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  CLS;
-- L0004@0359 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
857 => X"0001",

-- PUSHX;
-- L0008@035A 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
858 => X"0" & O"0" & O"7" & O"0" & O"3",

-- PUSHY;
-- L0009@035B 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
859 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = M[IMM], r_a = AND;
-- L0010@035C 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
860 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x00FF;
-- L0010@035D 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
861 => X"00FF",

-- PUSHA;
-- L0011@035E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
862 => X"0" & O"7" & O"0" & O"0" & O"3",

-- r_p = M[IMM], r_a = XOR;
-- L0013@035F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
863 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  HOME;
-- L0013@0360 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
864 => X"0002",

-- IF_A_EQ;
-- L0014@0361 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
865 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_HOME;
-- L0014@0362 00B9.  data16 = !$ + 1 + @  VGA_HOME;
--  data16 = 0000000010111001;
866 => X"00B9",

-- LDA, M[S];
-- L0016@0363 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
867 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0017@0364 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
868 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  CLS;
-- L0017@0365 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
869 => X"0001",

-- IF_A_EQ;
-- L0018@0366 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
870 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_CLS;
-- L0018@0367 009B.  data16 = !$ + 1 + @  VGA_CLS;
--  data16 = 0000000010011011;
871 => X"009B",

-- LDA, M[S];
-- L0020@0368 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
872 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0021@0369 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
873 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  BEL;
-- L0021@036A 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
874 => X"0007",

-- IF_A_EQ;
-- L0022@036B 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
875 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_Ignore;
-- L0022@036C 002E.  data16 = !$ + 1 + @  VGA_Ignore;
--  data16 = 0000000000101110;
876 => X"002E",

-- LDA, M[S];
-- L0024@036D 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
877 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0025@036E 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
878 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  ETX;
-- L0025@036F 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
879 => X"0003",

-- IF_A_EQ;
-- L0026@0370 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
880 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_Ignore;
-- L0026@0371 0029.  data16 = !$ + 1 + @  VGA_Ignore;
--  data16 = 0000000000101001;
881 => X"0029",

-- r_p = STP2, r_s = M[PUSH];
-- L0028@0372 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
882 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0028@0373 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
883 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetCursorXY;
-- L0028@0374 00B3.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000000010110011;
884 => X"00B3",

-- LDA, M[S];
-- L0030@0375 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
885 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0031@0376 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
886 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  CR;
-- L0031@0377 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
887 => X"000D",

-- IF_A_EQ;
-- L0032@0378 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
888 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_CR;
-- L0032@0379 0075.  data16 = !$ + 1 + @  VGA_CR;
--  data16 = 0000000001110101;
889 => X"0075",

-- LDA, M[S];
-- L0034@037A 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
890 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0035@037B 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
891 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  LF;
-- L0035@037C 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
892 => X"000A",

-- IF_A_EQ;
-- L0036@037D 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
893 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_LF;
-- L0036@037E 0081.  data16 = !$ + 1 + @  VGA_LF;
--  data16 = 0000000010000001;
894 => X"0081",

-- LDA, M[S];
-- L0038@037F 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
895 => X"0" & O"4" & O"0" & O"0" & O"6",

-- r_p = M[IMM], r_a = XOR;
-- L0039@0380 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
896 => X"1" & O"2" & O"0" & O"0" & O"0",

-- data16 =  BS;
-- L0039@0381 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
897 => X"0008",

-- IF_A_EQ;
-- L0040@0382 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
898 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_BS;
-- L0040@0383 006F.  data16 = !$ + 1 + @  VGA_BS;
--  data16 = 0000000001101111;
899 => X"006F",

-- POPA;
-- L0043@0384 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
900 => X"0" & O"4" & O"0" & O"0" & O"2",

-- PUSHY;
-- L0045@0385 003B.VGA_Print:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
901 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = STP2, r_s = M[PUSH];
-- L0046@0386 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
902 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0046@0387 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
903 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetRowBase;
-- L0046@0388 00A8.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000010101000;
904 => X"00A8",

-- STA, M[Y+X];
-- L0047@0389 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
905 => X"0" & O"7" & O"6" & O"6" & O"0",

-- INX, POPY;
-- L0048@038A 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
906 => X"0" & O"0" & O"2" & O"4" & O"2",

-- r_p = M[IMM], r_x = CPX;
-- L0049@038B 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
907 => X"1" & O"0" & O"1" & O"0" & O"0",

-- data16 =  VGA_COLS;
-- L0049@038C 0040.  data16 =  64;
--  data16 = 0000000001000000;
908 => X"0040",

-- IF_X_GE;
-- L0050@038D A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
909 => X"A" & O"0" & O"0" & O"0" & O"0",

-- .relative  NextRow;
-- L0050@038E 0019.  data16 = !$ + 1 + @  NextRow;
--  data16 = 0000000000011001;
910 => X"0019",

-- PUSHY;
-- L0051@038F 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
911 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = M[IMM], r_y = LDY;
-- L0052@0390 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
912 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  CURSOR_X;
-- L0052@0391 FF40.  data16 =  0xFF00 + 0x40;
--  data16 = 1111111101000000;
913 => X"FF40",

-- STX, M[Y];
-- L0053@0392 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
914 => X"0" & O"0" & O"7" & O"6" & O"0",

-- r_p = M[IMM], r_x = LDX;
-- L0054@0393 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
915 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  CURSOR_Y;
-- L0054@0394 FF41.  data16 =  0xFF00 + 0x41;
--  data16 = 1111111101000001;
916 => X"FF41",

-- POPY;
-- L0055@0395 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
917 => X"0" & O"0" & O"0" & O"4" & O"2",

-- STY, M[X];
-- L0056@0396 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
918 => X"0" & O"0" & O"6" & O"7" & O"0",

-- POPY;
-- L0058@0397 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
919 => X"0" & O"0" & O"0" & O"4" & O"2",

-- POPX;
-- L0059@0398 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
920 => X"0" & O"0" & O"4" & O"0" & O"2",

-- RTS;
-- L0060@0399 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
921 => X"4" & O"0" & O"0" & O"0" & O"2",

-- POPA;
-- L0062@039A 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
922 => X"0" & O"4" & O"0" & O"0" & O"2",

-- POPY;
-- L0063@039B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
923 => X"0" & O"0" & O"0" & O"4" & O"2",

-- POPX;
-- L0064@039C 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
924 => X"0" & O"0" & O"4" & O"0" & O"2",

-- RTS;
-- L0065@039D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
925 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHY;
-- L0067@039E 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
926 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = M[IMM], r_y = LDY;
-- L0068@039F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
927 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  CUR_OLDX;
-- L0068@03A0 FF42.  data16 =  0xFF00 + 0x42;
--  data16 = 1111111101000010;
928 => X"FF42",

-- STX, M[Y];
-- L0069@03A1 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
929 => X"0" & O"0" & O"7" & O"6" & O"0",

-- r_p = M[IMM], r_x = LDX;
-- L0070@03A2 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
930 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  CUR_OLDY;
-- L0070@03A3 FF43.  data16 =  0xFF00 + 0x43;
--  data16 = 1111111101000011;
931 => X"FF43",

-- POPY;
-- L0071@03A4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
932 => X"0" & O"0" & O"0" & O"4" & O"2",

-- STY, M[X];
-- L0072@03A5 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
933 => X"0" & O"0" & O"6" & O"7" & O"0",

-- RTS;
-- L0073@03A6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
934 => X"4" & O"0" & O"0" & O"0" & O"2",

-- CLRX;
-- L0075@03A7 0100.NextRow:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
935 => X"0" & O"0" & O"4" & O"0" & O"0",

-- INY;
-- L0076@03A8 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
936 => X"0" & O"0" & O"0" & O"2" & O"0",

-- r_p = M[IMM], r_y = CPY;
-- L0077@03A9 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
937 => X"1" & O"0" & O"0" & O"1" & O"0",

-- data16 =  VGA_ROWS;
-- L0077@03AA 0020.  data16 =  32;
--  data16 = 0000000000100000;
938 => X"0020",

-- IF_Y_GE;
-- L0078@03AB C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
939 => X"C" & O"0" & O"0" & O"0" & O"0",

-- .relative  ScrollUp;
-- L0078@03AC 0003.  data16 = !$ + 1 + @  ScrollUp;
--  data16 = 0000000000000011;
940 => X"0003",

-- BRANCH;
-- L0079@03AD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
941 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SetCursorXY;
-- L0079@03AE FFE1.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111111100001;
942 => X"FFE1",

-- r_p = M[IMM], r_a = LDA;
-- L0081@03AF 1800.ScrollUp:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
943 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  VGA_BASE;
-- L0081@03B0 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
944 => X"1000",

-- r_p = M[IMM], r_x = LDX;
-- L0082@03B1 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
945 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_DST;
-- L0082@03B2 FF49.  data16 =  0xFF00 + 0x49;
--  data16 = 1111111101001001;
946 => X"FF49",

-- STA, M[X];
-- L0083@03B3 0F80.  STA, M[X];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 000;
947 => X"0" & O"7" & O"6" & O"0" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0084@03B4 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
948 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0084@03B5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
949 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0084@03B6 FD46.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111110101000110;
950 => X"FD46",

-- r_p = M[IMM], r_a = ADC;
-- L0085@03B7 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
951 => X"1" & O"5" & O"0" & O"0" & O"0",

-- data16 =  VGA_COLS;
-- L0085@03B8 0040.  data16 =  64;
--  data16 = 0000000001000000;
952 => X"0040",

-- r_p = M[IMM], r_x = LDX;
-- L0086@03B9 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
953 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_SRC;
-- L0086@03BA FF48.  data16 =  0xFF00 + 0x48;
--  data16 = 1111111101001000;
954 => X"FF48",

-- STA, M[X];
-- L0087@03BB 0F80.  STA, M[X];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 000;
955 => X"0" & O"7" & O"6" & O"0" & O"0",

-- CLRY;
-- L0088@03BC 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
956 => X"0" & O"0" & O"0" & O"4" & O"0",

-- PUSHY;
-- L0090@03BD 003B.ScrollUpY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
957 => X"0" & O"0" & O"0" & O"7" & O"3",

-- CLRX;
-- L0091@03BE 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
958 => X"0" & O"0" & O"4" & O"0" & O"0",

-- PUSHX;
-- L0093@03BF 01C3.ScrollUpX:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
959 => X"0" & O"0" & O"7" & O"0" & O"3",

-- PUSHX;
-- L0094@03C0 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
960 => X"0" & O"0" & O"7" & O"0" & O"3",

-- r_p = M[IMM], r_x = LDX;
-- L0095@03C1 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
961 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_SRC;
-- L0095@03C2 FF48.  data16 =  0xFF00 + 0x48;
--  data16 = 1111111101001000;
962 => X"FF48",

-- LDY, M[X];
-- L0096@03C3 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
963 => X"0" & O"0" & O"6" & O"4" & O"0",

-- POPX;
-- L0097@03C4 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
964 => X"0" & O"0" & O"4" & O"0" & O"2",

-- LDA, M[Y+X];
-- L0098@03C5 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
965 => X"0" & O"4" & O"6" & O"6" & O"0",

-- r_p = M[IMM], r_x = LDX;
-- L0099@03C6 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
966 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_DST;
-- L0099@03C7 FF49.  data16 =  0xFF00 + 0x49;
--  data16 = 1111111101001001;
967 => X"FF49",

-- LDY, M[X];
-- L0100@03C8 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
968 => X"0" & O"0" & O"6" & O"4" & O"0",

-- POPX;
-- L0101@03C9 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
969 => X"0" & O"0" & O"4" & O"0" & O"2",

-- STA, M[Y+X];
-- L0102@03CA 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
970 => X"0" & O"7" & O"6" & O"6" & O"0",

-- INX;
-- L0103@03CB 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
971 => X"0" & O"0" & O"2" & O"0" & O"0",

-- r_p = M[IMM], r_x = CPX;
-- L0104@03CC 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
972 => X"1" & O"0" & O"1" & O"0" & O"0",

-- data16 =  VGA_COLS;
-- L0104@03CD 0040.  data16 =  64;
--  data16 = 0000000001000000;
973 => X"0040",

-- IF_X_GE;
-- L0105@03CE A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
974 => X"A" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0105@03CF 0003.  data16 = 3;
--  data16 = 0000000000000011;
975 => X"0003",

-- BRANCH;
-- L0105@03D0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
976 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ScrollUpX;
-- L0105@03D1 FFEE.  data16 = !$ + 1 + @  ScrollUpX;
--  data16 = 1111111111101110;
977 => X"FFEE",

-- r_p = M[IMM], r_x = LDX;
-- L0107@03D2 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
978 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_DST;
-- L0107@03D3 FF49.  data16 =  0xFF00 + 0x49;
--  data16 = 1111111101001001;
979 => X"FF49",

-- r_p = M[IMM], r_y = LDY;
-- L0108@03D4 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
980 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  VGA_SRC;
-- L0108@03D5 FF48.  data16 =  0xFF00 + 0x48;
--  data16 = 1111111101001000;
981 => X"FF48",

-- LDA, M[X];
-- L0109@03D6 0980.  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
982 => X"0" & O"4" & O"6" & O"0" & O"0",

-- STA, M[Y];
-- L0110@03D7 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
983 => X"0" & O"7" & O"0" & O"6" & O"0",

-- LDA, M[X];
-- L0111@03D8 0980.  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
984 => X"0" & O"4" & O"6" & O"0" & O"0",

-- r_p = STP2, r_s = M[PUSH];
-- L0112@03D9 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
985 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0112@03DA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
986 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0112@03DB FD21.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111110100100001;
987 => X"FD21",

-- r_p = M[IMM], r_a = ADC;
-- L0113@03DC 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
988 => X"1" & O"5" & O"0" & O"0" & O"0",

-- data16 =  VGA_COLS;
-- L0113@03DD 0040.  data16 =  64;
--  data16 = 0000000001000000;
989 => X"0040",

-- STA, M[X];
-- L0114@03DE 0F80.  STA, M[X];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 000, r_s = 000;
990 => X"0" & O"7" & O"6" & O"0" & O"0",

-- POPY;
-- L0116@03DF 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
991 => X"0" & O"0" & O"0" & O"4" & O"2",

-- INY;
-- L0117@03E0 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
992 => X"0" & O"0" & O"0" & O"2" & O"0",

-- r_p = M[IMM], r_y = CPY;
-- L0118@03E1 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
993 => X"1" & O"0" & O"0" & O"1" & O"0",

-- data16 =  VGA_ROWS - 1;
-- L0118@03E2 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
994 => X"001F",

-- IF_Y_GE;
-- L0119@03E3 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
995 => X"C" & O"0" & O"0" & O"0" & O"0",

-- data16 = 3;
-- L0119@03E4 0003.  data16 = 3;
--  data16 = 0000000000000011;
996 => X"0003",

-- BRANCH;
-- L0119@03E5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
997 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ScrollUpY;
-- L0119@03E6 FFD7.  data16 = !$ + 1 + @  ScrollUpY;
--  data16 = 1111111111010111;
998 => X"FFD7",

-- PUSHY;
-- L0121@03E7 003B.ClrLastRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
999 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = STP2, r_s = M[PUSH];
-- L0122@03E8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1000 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0122@03E9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1001 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ClearRow;
-- L0122@03EA 0028.  data16 = !$ + 1 + @  ClearRow;
--  data16 = 0000000000101000;
1002 => X"0028",

-- POPY;
-- L0123@03EB 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
1003 => X"0" & O"0" & O"0" & O"4" & O"2",

-- BRANCH;
-- L0124@03EC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1004 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SetX0;
-- L0124@03ED 0002.  data16 = !$ + 1 + @  SetX0;
--  data16 = 0000000000000010;
1005 => X"0002",

-- POPA;
-- L0126@03EE 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
1006 => X"0" & O"4" & O"0" & O"0" & O"2",

-- CLRX;
-- L0127@03EF 0100.SetX0:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1007 => X"0" & O"0" & O"4" & O"0" & O"0",

-- BRANCH;
-- L0128@03F0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1008 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SetCursorXY;
-- L0128@03F1 FF9E.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110011110;
1009 => X"FF9E",

-- POPA;
-- L0130@03F2 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
1010 => X"0" & O"4" & O"0" & O"0" & O"2",

-- CLRX;
-- L0131@03F3 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1011 => X"0" & O"0" & O"4" & O"0" & O"0",

-- IF_X_EQ;
-- L0132@03F4 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1012 => X"B" & O"0" & O"0" & O"0" & O"0",

-- .relative  PrevRow;
-- L0132@03F5 0003.  data16 = !$ + 1 + @  PrevRow;
--  data16 = 0000000000000011;
1013 => X"0003",

-- DEX,BRANCH;
-- L0133@03F6 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
1014 => X"2" & O"0" & O"3" & O"0" & O"0",

-- .relative  SetCursorXY;
-- L0133@03F7 FF98.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110011000;
1015 => X"FF98",

-- CHKY;
-- L0134@03F8 0008.PrevRow:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = CPY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
1016 => X"0" & O"0" & O"0" & O"1" & O"0",

-- IF_Y_EQ;
-- L0135@03F9 D000.  IF_Y_EQ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1017 => X"D" & O"0" & O"0" & O"0" & O"0",

-- .relative  SetCursorXY;
-- L0135@03FA FF95.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110010101;
1018 => X"FF95",

-- r_p = M[IMM], r_x = LDX;
-- L0136@03FB 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1019 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_COLS - 1;
-- L0136@03FC 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
1020 => X"003F",

-- DEY,BRANCH;
-- L0137@03FD 2018.  DEY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
1021 => X"2" & O"0" & O"0" & O"3" & O"0",

-- .relative  SetCursorXY;
-- L0137@03FE FF91.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110010001;
1022 => X"FF91",

-- POPA;
-- L0139@03FF 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
1023 => X"0" & O"4" & O"0" & O"0" & O"2",

-- BRANCH;
-- L0140@0400 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1024 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  NextRow1;
-- L0140@0401 FFA7.  data16 = !$ + 1 + @  NextRow1;
--  data16 = 1111111110100111;
1025 => X"FFA7",

-- POPA;
-- L0142@0402 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
1026 => X"0" & O"4" & O"0" & O"0" & O"2",

-- r_p = M[IMM], r_a = LDA;
-- L0143@0403 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
1027 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  ' ';
-- L0143@0404 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
1028 => X"0020",

-- CLRY;
-- L0144@0405 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
1029 => X"0" & O"0" & O"0" & O"4" & O"0",

-- PUSHY;
-- L0145@0406 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
1030 => X"0" & O"0" & O"0" & O"7" & O"3",

-- r_p = STP2, r_s = M[PUSH];
-- L0146@0407 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1031 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0146@0408 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1032 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ClearRow;
-- L0146@0409 0009.  data16 = !$ + 1 + @  ClearRow;
--  data16 = 0000000000001001;
1033 => X"0009",

-- POPY;
-- L0147@040A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
1034 => X"0" & O"0" & O"0" & O"4" & O"2",

-- INY;
-- L0148@040B 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
1035 => X"0" & O"0" & O"0" & O"2" & O"0",

-- r_p = M[IMM], r_y = CPY;
-- L0149@040C 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
1036 => X"1" & O"0" & O"0" & O"1" & O"0",

-- data16 =  VGA_ROWS;
-- L0149@040D 0020.  data16 =  32;
--  data16 = 0000000000100000;
1037 => X"0020",

-- IF_Y_GE;
-- L0150@040E C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1038 => X"C" & O"0" & O"0" & O"0" & O"0",

-- .relative  vga_home1;
-- L0150@040F 000D.  data16 = !$ + 1 + @  vga_home1;
--  data16 = 0000000000001101;
1039 => X"000D",

-- BRANCH;
-- L0151@0410 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1040 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  ClrNextRow;
-- L0151@0411 FFF5.  data16 = !$ + 1 + @  ClrNextRow;
--  data16 = 1111111111110101;
1041 => X"FFF5",

-- r_p = STP2, r_s = M[PUSH];
-- L0153@0412 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1042 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0153@0413 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1043 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetRowBase;
-- L0153@0414 001C.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000000011100;
1044 => X"001C",

-- r_p = M[IMM], r_a = LDA;
-- L0154@0415 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
1045 => X"1" & O"4" & O"0" & O"0" & O"0",

-- data16 =  ' ';
-- L0154@0416 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
1046 => X"0020",

-- r_p = M[IMM], r_x = LDX;
-- L0155@0417 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1047 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  VGA_COLS / 8;
-- L0155@0418 0008.  data16 =  64 / 8;
--  data16 = 0000000000001000;
1048 => X"0008",

-- BRANCH;
-- L0156@0419 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1049 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  MemFill;
-- L0156@041A FCEF.  data16 = !$ + 1 + @  MemFill;
--  data16 = 1111110011101111;
1050 => X"FCEF",

-- POPA;
-- L0158@041B 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
1051 => X"0" & O"4" & O"0" & O"0" & O"2",

-- CLRXY;
-- L0159@041C 0120.vga_home1:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
1052 => X"0" & O"0" & O"4" & O"4" & O"0",

-- BRANCH;
-- L0160@041D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1053 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  SetCursorXY;
-- L0160@041E FF71.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111101110001;
1054 => X"FF71",

-- r_p = M[IMM], r_y = LDY;
-- L0162@041F 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
1055 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  CUR_OLDX;
-- L0162@0420 FF42.  data16 =  0xFF00 + 0x42;
--  data16 = 1111111101000010;
1056 => X"FF42",

-- LDX, M[Y];
-- L0163@0421 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
1057 => X"0" & O"0" & O"4" & O"6" & O"0",

-- PUSHX;
-- L0164@0422 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
1058 => X"0" & O"0" & O"7" & O"0" & O"3",

-- r_p = M[IMM], r_x = LDX;
-- L0165@0423 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1059 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  CUR_OLDY;
-- L0165@0424 FF43.  data16 =  0xFF00 + 0x43;
--  data16 = 1111111101000011;
1060 => X"FF43",

-- BRANCH;
-- L0166@0425 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1061 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  GetCursorY;
-- L0166@0426 0007.  data16 = !$ + 1 + @  GetCursorY;
--  data16 = 0000000000000111;
1062 => X"0007",

-- r_p = M[IMM], r_y = LDY;
-- L0168@0427 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
1063 => X"1" & O"0" & O"0" & O"4" & O"0",

-- data16 =  CURSOR_X;
-- L0168@0428 FF40.  data16 =  0xFF00 + 0x40;
--  data16 = 1111111101000000;
1064 => X"FF40",

-- LDX, M[Y];
-- L0169@0429 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
1065 => X"0" & O"0" & O"4" & O"6" & O"0",

-- PUSHX;
-- L0170@042A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
1066 => X"0" & O"0" & O"7" & O"0" & O"3",

-- r_p = M[IMM], r_x = LDX;
-- L0171@042B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1067 => X"1" & O"0" & O"4" & O"0" & O"0",

-- data16 =  CURSOR_Y;
-- L0171@042C FF41.  data16 =  0xFF00 + 0x41;
--  data16 = 1111111101000001;
1068 => X"FF41",

-- LDY, M[X];
-- L0172@042D 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
1069 => X"0" & O"0" & O"6" & O"4" & O"0",

-- POPX;
-- L0173@042E 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
1070 => X"0" & O"0" & O"4" & O"0" & O"2",

-- RTS;
-- L0174@042F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
1071 => X"4" & O"0" & O"0" & O"0" & O"2",

-- PUSHA;
-- L0176@0430 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1072 => X"0" & O"7" & O"0" & O"0" & O"3",

-- TYA;
-- L0177@0431 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
1073 => X"0" & O"4" & O"0" & O"7" & O"0",

-- r_p = M[IMM], r_a = AND;
-- L0178@0432 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
1074 => X"1" & O"6" & O"0" & O"0" & O"0",

-- data16 =  0x001F;
-- L0178@0433 001F.  data16 =  0x001F;
--  data16 = 0000000000011111;
1075 => X"001F",

-- r_p = STP2, r_s = M[PUSH];
-- L0179@0434 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1076 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0179@0435 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1077 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  CLC;
-- L0179@0436 FCC6.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111110011000110;
1078 => X"FCC6",

-- STA, M[PUSH];
-- L0180@0437 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1079 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0180@0438 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
1080 => X"0" & O"5" & O"0" & O"0" & O"2",

-- STA, M[PUSH];
-- L0181@0439 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1081 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0181@043A 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
1082 => X"0" & O"5" & O"0" & O"0" & O"2",

-- STA, M[PUSH];
-- L0182@043B 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1083 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0182@043C 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
1084 => X"0" & O"5" & O"0" & O"0" & O"2",

-- STA, M[PUSH];
-- L0183@043D 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1085 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0183@043E 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
1086 => X"0" & O"5" & O"0" & O"0" & O"2",

-- STA, M[PUSH];
-- L0184@043F 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1087 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0184@0440 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
1088 => X"0" & O"5" & O"0" & O"0" & O"2",

-- STA, M[PUSH];
-- L0185@0441 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
1089 => X"0" & O"7" & O"0" & O"0" & O"3",

-- ADC, M[POP]  ;
-- L0185@0442 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
1090 => X"0" & O"5" & O"0" & O"0" & O"2",

-- TAY;
-- L0186@0443 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
1091 => X"0" & O"7" & O"0" & O"4" & O"0",

-- r_p = M[IMM], r_y = ADY;
-- L0187@0444 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
1092 => X"1" & O"0" & O"0" & O"5" & O"0",

-- data16 =  VGA_BASE;
-- L0187@0445 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
1093 => X"1000",

-- POPA;
-- L0188@0446 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
1094 => X"0" & O"4" & O"0" & O"0" & O"2",

-- RTS;
-- L0189@0447 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
1095 => X"4" & O"0" & O"0" & O"0" & O"2",

-- LDA, M[X];
-- L0191@0448 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
1096 => X"0" & O"4" & O"6" & O"0" & O"0",

-- IF_AZ;
-- L0192@0449 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1097 => X"9" & O"0" & O"0" & O"0" & O"0",

-- .relative OutStrDone;
-- L0193@044A 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
1098 => X"0006",

-- r_p = STP2, r_s = M[PUSH];
-- L0194@044B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1099 => X"6" & O"0" & O"0" & O"0" & O"3",

-- BRANCH;
-- L0194@044C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
1100 => X"2" & O"0" & O"0" & O"0" & O"0",

-- .relative  VGA_OutChr;
-- L0194@044D FF0D.  data16 = !$ + 1 + @  VGA_OutChr;
--  data16 = 1111111100001101;
1101 => X"FF0D",

-- INX, BRANCH;
-- L0195@044E 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
1102 => X"2" & O"0" & O"2" & O"0" & O"0",

-- .relative VGA_OutStr;
-- L0196@044F FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
1103 => X"FFF9",

-- RTS;
-- L0197@0450 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
1104 => X"4" & O"0" & O"0" & O"0" & O"2",

-- .data BEL;
-- L0003@0451 0007.StrBreak:  data16 =  0x7;
--  data16 = 0000000000000111;
1105 => X"0007",

-- .data CR;
-- L0004@0452 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
1106 => X"000D",

-- .data LF;
-- L0005@0453 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
1107 => X"000A",

-- .data '*';
-- L0006@0454 002A.  data16 =  '*';
--  data16 = 0000000000101010;
1108 => X"002A",

-- .data 'B';
-- L0007@0455 0042.  data16 =  'B';
--  data16 = 0000000001000010;
1109 => X"0042",

-- .data 'R';
-- L0008@0456 0052.  data16 =  'R';
--  data16 = 0000000001010010;
1110 => X"0052",

-- .data 'E';
-- L0009@0457 0045.  data16 =  'E';
--  data16 = 0000000001000101;
1111 => X"0045",

-- .data 'A';
-- L0010@0458 0041.  data16 =  'A';
--  data16 = 0000000001000001;
1112 => X"0041",

-- .data 'K';
-- L0011@0459 004B.  data16 =  'K';
--  data16 = 0000000001001011;
1113 => X"004B",

-- .data ' ';
-- L0012@045A 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
1114 => X"0020",

-- .data 0;
-- L0013@045B 0000.  data16 =  0;
--  data16 = 0000000000000000;
1115 => X"0000",

-- .data BEL;
-- L0015@045C 0007.StrError:  data16 =  0x7;
--  data16 = 0000000000000111;
1116 => X"0007",

-- .data CR;
-- L0016@045D 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
1117 => X"000D",

-- .data LF;
-- L0017@045E 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
1118 => X"000A",

-- .data '*';
-- L0018@045F 002A.  data16 =  '*';
--  data16 = 0000000000101010;
1119 => X"002A",

-- .data 'E';
-- L0019@0460 0045.  data16 =  'E';
--  data16 = 0000000001000101;
1120 => X"0045",

-- .data 'R';
-- L0020@0461 0052.  data16 =  'R';
--  data16 = 0000000001010010;
1121 => X"0052",

-- .data 'R';
-- L0021@0462 0052.  data16 =  'R';
--  data16 = 0000000001010010;
1122 => X"0052",

-- .data 'O';
-- L0022@0463 004F.  data16 =  'O';
--  data16 = 0000000001001111;
1123 => X"004F",

-- .data 'R';
-- L0023@0464 0052.  data16 =  'R';
--  data16 = 0000000001010010;
1124 => X"0052",

-- .data ' ';
-- L0024@0465 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
1125 => X"0020",

-- .data 0;
-- L0025@0466 0000.  data16 =  0;
--  data16 = 0000000000000000;
1126 => X"0000",

-- .data BEL;
-- L0027@0467 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
1127 => X"0007",

-- .data 0;
-- L0028@0468 0000.  data16 =  0;
--  data16 = 0000000000000000;
1128 => X"0000",

-- .data CLS;
-- L0030@0469 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
1129 => X"0001",

-- .data 0;
-- L0031@046A 0000.  data16 =  0;
--  data16 = 0000000000000000;
1130 => X"0000",

-- .data 'R';
-- L0033@046B 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
1131 => X"0052",

-- .data 'e';
-- L0034@046C 0065.  data16 =  'e';
--  data16 = 0000000001100101;
1132 => X"0065",

-- .data 'a';
-- L0035@046D 0061.  data16 =  'a';
--  data16 = 0000000001100001;
1133 => X"0061",

-- .data 'd';
-- L0036@046E 0064.  data16 =  'd';
--  data16 = 0000000001100100;
1134 => X"0064",

-- .data 'y';
-- L0037@046F 0079.  data16 =  'y';
--  data16 = 0000000001111001;
1135 => X"0079",

-- .data '.';
-- L0038@0470 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
1136 => X"002E",

-- .data CR;
-- L0039@0471 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
1137 => X"000D",

-- .data LF;
-- L0040@0472 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
1138 => X"000A",

-- .data 0;
-- L0041@0473 0000.  data16 =  0;
--  data16 = 0000000000000000;
1139 => X"0000",

-- .data '0';
-- L0043@0474 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
1140 => X"0030",

-- .data '1';
-- L0044@0475 0031.  data16 =  '1';
--  data16 = 0000000000110001;
1141 => X"0031",

-- .data '2';
-- L0045@0476 0032.  data16 =  '2';
--  data16 = 0000000000110010;
1142 => X"0032",

-- .data '3';
-- L0046@0477 0033.  data16 =  '3';
--  data16 = 0000000000110011;
1143 => X"0033",

-- .data '4';
-- L0047@0478 0034.  data16 =  '4';
--  data16 = 0000000000110100;
1144 => X"0034",

-- .data '5';
-- L0048@0479 0035.  data16 =  '5';
--  data16 = 0000000000110101;
1145 => X"0035",

-- .data '6';
-- L0049@047A 0036.  data16 =  '6';
--  data16 = 0000000000110110;
1146 => X"0036",

-- .data '7';
-- L0050@047B 0037.  data16 =  '7';
--  data16 = 0000000000110111;
1147 => X"0037",

-- .data '8';
-- L0051@047C 0038.  data16 =  '8';
--  data16 = 0000000000111000;
1148 => X"0038",

-- .data '9';
-- L0052@047D 0039.  data16 =  '9';
--  data16 = 0000000000111001;
1149 => X"0039",

-- .data 'A';
-- L0053@047E 0041.  data16 =  'A';
--  data16 = 0000000001000001;
1150 => X"0041",

-- .data 'B';
-- L0054@047F 0042.  data16 =  'B';
--  data16 = 0000000001000010;
1151 => X"0042",

-- .data 'C';
-- L0055@0480 0043.  data16 =  'C';
--  data16 = 0000000001000011;
1152 => X"0043",

-- .data 'D';
-- L0056@0481 0044.  data16 =  'D';
--  data16 = 0000000001000100;
1153 => X"0044",

-- .data 'E';
-- L0057@0482 0045.  data16 =  'E';
--  data16 = 0000000001000101;
1154 => X"0045",

-- .data 'F';
-- L0058@0483 0046.  data16 =  'F';
--  data16 = 0000000001000110;
1155 => X"0046",

-- 896 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 0484 .. 07FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end monitor_code;

