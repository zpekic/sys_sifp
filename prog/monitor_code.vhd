--------------------------------------------------------
-- mcc V1.4.0303 - Custom microcode compiler (c)2020-... 
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

-- L0021@0003 0037.  data16 = @  ColdStart;
--  data16 = 0000000000110111;
3 => X"0037",

-- L0027@0008 7FFF.IntHandler:  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
8 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0028@0009 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
9 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0029@000A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
10 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0030@000B 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
11 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0032@000C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
12 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0032@000D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0032@000E 0260.  data16 = !$ + 1 + @  GetOldCrsXY;
--  data16 = 0000001001100000;
14 => X"0260",

-- L0033@000F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
15 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0034@0010 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
16 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0035@0011 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
17 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0035@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@0013 026C.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000001001101100;
19 => X"026C",

-- L0036@0014 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0037@0015 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0037@0016 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
22 => X"FF7F",

-- L0038@0017 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
23 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0039@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0039@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@001A 025C.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000001001011100;
26 => X"025C",

-- L0040@001B 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
27 => X"0" & O"0" & O"1" & O"0" & O"2",

-- L0041@001C 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
28 => X"0" & O"0" & O"0" & O"1" & O"2",

-- L0042@001D B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0042@001E 0003.  data16 = 3;
--  data16 = 0000000000000011;
30 => X"0003",

-- L0042@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0042@0020 0003.  data16 = !$ + 1 + @  NoFlip;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0043@0021 D000.CheckY:  IF_Y_EQ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0043@0022 0006.  data16 = !$ + 1 + @  Flip;
--  data16 = 0000000000000110;
34 => X"0006",

-- L0044@0023 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
35 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0044@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@0025 01E2.  data16 = !$ + 1 + @  SetOldCrsXY;
--  data16 = 0000000111100010;
37 => X"01E2",

-- L0045@0026 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0027 000B.  data16 = !$ + 1 + @  IntExit;
--  data16 = 0000000000001011;
39 => X"000B",

-- L0047@0028 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
40 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0047@0029 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0047@002A 024C.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000001001001100;
42 => X"024C",

-- L0048@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0048@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@002D 0252.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000001001010010;
45 => X"0252",

-- L0049@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0050@002F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0050@0030 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
48 => X"0080",

-- L0051@0031 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0053@0032 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0054@0033 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
51 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@0034 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0056@0035 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0056@0036 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
54 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0059@0037 6003.ColdStart:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0059@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@0039 016F.  data16 = !$ + 1 + @  VGA_Init;
--  data16 = 0000000101101111;
57 => X"016F",

-- L0061@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0061@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0061@003C 0126.  data16 = !$ + 1 + @  UART_Init;
--  data16 = 0000000100100110;
60 => X"0126",

-- L0063@003D 6FFF.  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"6" & O"7" & O"7" & O"7" & O"7",

-- L0067@003E 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
62 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0067@003F 02A9.  data16 =  @StrReady;
--  data16 = 0000001010101001;
63 => X"02A9",

-- L0068@0040 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
64 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0068@0041 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
65 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0068@0042 00DF.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000011011111;
66 => X"00DF",

-- L0073@0043 1100.HotStart:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
67 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0073@0044 0040.  data16 =  0x0040;
--  data16 = 0000000001000000;
68 => X"0040",

-- L0074@0045 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
69 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0074@0046 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
70 => X"FF40",

-- L0075@0047 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
71 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0075@0048 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
72 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0075@0049 00A7.  data16 = !$ + 1 + @  MemClear;
--  data16 = 0000000010100111;
73 => X"00A7",

-- L0077@004A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
74 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0077@004B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
75 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@004C 0036.  data16 = !$ + 1 + @  CmdEdit;
--  data16 = 0000000000110110;
76 => X"0036",

-- L0078@004D 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
77 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0078@004E 000D.  data16 = !$ + 1 + @  ErrOrBrk;
--  data16 = 0000000000001101;
78 => X"000D",

-- L0081@004F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
79 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0081@0050 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
80 => X"FF40",

-- L0082@0051 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
81 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0082@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0082@0053 00CE.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000011001110;
83 => X"00CE",

-- L0085@0054 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
84 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0085@0055 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
85 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0085@0056 0028.  data16 = !$ + 1 + @  CmdExec;
--  data16 = 0000000000101000;
86 => X"0028",

-- L0086@0057 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
87 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0086@0058 0003.  data16 = !$ + 1 + @  ErrOrBrk;
--  data16 = 0000000000000011;
88 => X"0003",

-- L0089@0059 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
89 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0089@005A FFE9.  data16 = !$ + 1 + @  HotStart;
--  data16 = 1111111111101001;
90 => X"FFE9",

-- L0091@005B 0E03.ErrOrBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
91 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0092@005C 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
92 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0093@005D 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
93 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0093@005E 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
94 => X"0003",

-- L0094@005F 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
95 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0094@0060 0005.  data16 = !$ + 1 + @  BrkMsg;
--  data16 = 0000000000000101;
96 => X"0005",

-- L0095@0061 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
97 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0095@0062 029A.  data16 =  @StrError;
--  data16 = 0000001010011010;
98 => X"029A",

-- L0096@0063 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
99 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@0064 0003.  data16 = !$ + 1 + @  ErrMsg;
--  data16 = 0000000000000011;
100 => X"0003",

-- L0097@0065 1020.BrkMsg:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
101 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0097@0066 028F.  data16 =  @StrBreak;
--  data16 = 0000001010001111;
102 => X"028F",

-- L0098@0067 6003.ErrMsg:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
103 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0098@0068 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
104 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@0069 00B8.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010111000;
105 => X"00B8",

-- L0099@006A 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
106 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0100@006B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
107 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0100@006C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
108 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0100@006D 00C1.  data16 = !$ + 1 + @  PrintHex;
--  data16 = 0000000011000001;
109 => X"00C1",

-- L0101@006E 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
110 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0101@006F 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
111 => X"0020",

-- L0102@0070 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
112 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0102@0071 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
113 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@0072 00B8.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000010111000;
114 => X"00B8",

-- L0103@0073 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
115 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0104@0074 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
116 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0104@0075 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
117 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0104@0076 00D9.  data16 = !$ + 1 + @  PrintBin;
--  data16 = 0000000011011001;
118 => X"00D9",

-- L0105@0077 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
119 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0105@0078 02AF.  data16 =  @StrEnd;
--  data16 = 0000001010101111;
120 => X"02AF",

-- L0106@0079 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
121 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0106@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0106@007B 00A6.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010100110;
123 => X"00A6",

-- L0107@007C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0107@007D FFC6.  data16 = !$ + 1 + @  HotStart;
--  data16 = 1111111111000110;
125 => X"FFC6",

-- L0112@007E 1800.CmdExec:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
126 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0112@007F FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
127 => X"FFFF",

-- L0113@0080 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
128 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0113@0081 0068.  data16 = !$ + 1 + @  SEC;
--  data16 = 0000000001101000;
129 => X"0068",

-- L0119@0082 0100.CmdEdit:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
130 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0120@0083 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
131 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0120@0084 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
132 => X"FF40",

-- L0122@0085 6003.EditLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
133 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0122@0086 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
134 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0122@0087 00E4.  data16 = !$ + 1 + @  UART_GetChr;
--  data16 = 0000000011100100;
135 => X"00E4",

-- L0123@0088 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
136 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0125@0089 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
137 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0125@008A 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
138 => X"000D",

-- L0126@008B 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
139 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0126@008C 0003.  data16 = 3;
--  data16 = 0000000000000011;
140 => X"0003",

-- L0126@008D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
141 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0126@008E 000B.  data16 = !$ + 1 + @  NotEnter;
--  data16 = 0000000000001011;
142 => X"000B",

-- L0127@008F 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
143 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0128@0090 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
144 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0128@0091 02AF.  data16 =  @StrEnd;
--  data16 = 0000001010101111;
145 => X"02AF",

-- L0129@0092 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
146 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0129@0093 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
147 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0129@0094 008D.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010001101;
148 => X"008D",

-- L0130@0095 1800.EditExOk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
149 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0130@0096 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
150 => X"000D",

-- L0131@0097 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
151 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0131@0098 004C.  data16 = !$ + 1 + @  CLC;
--  data16 = 0000000001001100;
152 => X"004C",

-- L0133@0099 09B0.NotEnter:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
153 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0134@009A 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
154 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0134@009B 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
155 => X"0003",

-- L0135@009C 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0135@009D 0003.  data16 = 3;
--  data16 = 0000000000000011;
157 => X"0003",

-- L0135@009E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0135@009F 0009.  data16 = !$ + 1 + @  NotBreak;
--  data16 = 0000000000001001;
159 => X"0009",

-- L0136@00A0 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
160 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0137@00A1 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
161 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0137@00A2 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
162 => X"0003",

-- L0138@00A3 6003.EditExErr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
163 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0138@00A4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
164 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00A5 0085.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000010000101;
165 => X"0085",

-- L0139@00A6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
166 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0139@00A7 0042.  data16 = !$ + 1 + @  SEC;
--  data16 = 0000000001000010;
167 => X"0042",

-- L0141@00A8 09B0.NotBreak:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
168 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0142@00A9 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
169 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0142@00AA 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
170 => X"0001",

-- L0143@00AB 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
171 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0143@00AC 0003.  data16 = 3;
--  data16 = 0000000000000011;
172 => X"0003",

-- L0143@00AD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0143@00AE 0006.  data16 = !$ + 1 + @  NotCls;
--  data16 = 0000000000000110;
174 => X"0006",

-- L0144@00AF 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
175 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0145@00B0 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
176 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0145@00B1 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
177 => X"0001",

-- L0146@00B2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@00B3 FFF0.  data16 = !$ + 1 + @  EditExErr;
--  data16 = 1111111111110000;
179 => X"FFF0",

-- L0148@00B4 09B0.NotCls:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
180 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0149@00B5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
181 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0149@00B6 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
182 => X"0002",

-- L0150@00B7 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0150@00B8 0003.  data16 = 3;
--  data16 = 0000000000000011;
184 => X"0003",

-- L0150@00B9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
185 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0150@00BA 0006.  data16 = !$ + 1 + @  NotHome;
--  data16 = 0000000000000110;
186 => X"0006",

-- L0151@00BB 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
187 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0152@00BC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
188 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0152@00BD 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
189 => X"0002",

-- L0153@00BE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0153@00BF FFE4.  data16 = !$ + 1 + @  EditExErr;
--  data16 = 1111111111100100;
191 => X"FFE4",

-- L0155@00C0 09B0.NotHome:  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
192 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0156@00C1 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
193 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0156@00C2 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
194 => X"0008",

-- L0157@00C3 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
195 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0157@00C4 0003.  data16 = 3;
--  data16 = 0000000000000011;
196 => X"0003",

-- L0157@00C5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
197 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0157@00C6 0014.  data16 = !$ + 1 + @  NotBS;
--  data16 = 0000000000010100;
198 => X"0014",

-- L0158@00C7 0040.  r_p = NOP, r_a = NOA, r_x = CPX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
199 => X"0" & O"0" & O"1" & O"0" & O"0",

-- L0159@00C8 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
200 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0159@00C9 0008.  data16 = !$ + 1 + @  Bumper;
--  data16 = 0000000000001000;
201 => X"0008",

-- L0160@00CA 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
202 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0160@00CB 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
203 => X"0008",

-- L0161@00CC 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
204 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0161@00CD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
205 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0161@00CE 005C.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001011100;
206 => X"005C",

-- L0162@00CF 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
207 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0162@00D0 0006.  data16 = !$ + 1 + @  EditNext;
--  data16 = 0000000000000110;
208 => X"0006",

-- L0164@00D1 1800.Bumper:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
209 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0164@00D2 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
210 => X"0007",

-- L0165@00D3 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
211 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0165@00D4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
212 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@00D5 0055.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001010101;
213 => X"0055",

-- L0166@00D6 0800.EditNext:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
214 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0167@00D7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
215 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0168@00D8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
216 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0168@00D9 FFAC.  data16 = !$ + 1 + @  EditLoop;
--  data16 = 1111111110101100;
217 => X"FFAC",

-- L0171@00DA 1040.NotBS:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
218 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0171@00DB 003F.  data16 =  0x0040 - 1;
--  data16 = 0000000000111111;
219 => X"003F",

-- L0172@00DC A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0172@00DD FFF4.  data16 = !$ + 1 + @  Bumper;
--  data16 = 1111111111110100;
221 => X"FFF4",

-- L0173@00DE 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
222 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0174@00DF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
223 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0174@00E0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
224 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0174@00E1 0049.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001001001;
225 => X"0049",

-- L0175@00E2 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
226 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0175@00E3 FFF3.  data16 = !$ + 1 + @  EditNext;
--  data16 = 1111111111110011;
227 => X"FFF3",

-- L0003@00E4 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
228 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@00E5 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
229 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0005@00E6 0600.ACSet:  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
230 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0006@00E7 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
231 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0007@00E8 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
232 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@00E9 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
233 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0011@00EA FFFE.  data16 = !$ + 1 + @ ACDone;
--  data16 = 1111111111111110;
234 => X"FFFE",

-- L0012@00EB 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
235 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0013@00EC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
236 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0013@00ED FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
237 => X"FFFF",

-- L0014@00EE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
238 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0014@00EF FFF7.  data16 = !$ + 1 + @  ACSet;
--  data16 = 1111111111110111;
239 => X"FFF7",

-- L0019@00F0 0800.MemClear:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
240 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0020@00F1 01C3.MemFill:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
241 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0021@00F2 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
242 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0022@00F3 0046.MemCFLoop:  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
243 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0023@00F4 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
244 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0023@00F5 0004.  data16 = !$ + 1 + @  MemCFExit;
--  data16 = 0000000000000100;
245 => X"0004",

-- L0024@00F6 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
246 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0025@00F7 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
247 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0025@00F8 FFFB.  data16 = !$ + 1 + @  MemCFLoop;
--  data16 = 1111111111111011;
248 => X"FFFB",

-- L0026@00F9 0102.MemCFExit:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
249 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0027@00FA 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
250 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@00FB 1C00.ToUpper:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
251 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0032@00FC 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
252 => X"00FF",

-- L0033@00FD 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
253 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@00FE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
254 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@00FF FFEA.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111101010;
255 => X"FFEA",

-- L0034@0100 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
256 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0035@0101 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
257 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0035@0102 0061.  data16 =  'a';
--  data16 = 0000000001100001;
258 => X"0061",

-- L0036@0103 8802.  r_a = LDA, r_s = M[POP],IF_A_GE;
--  r_p = 1000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
259 => X"8" & O"4" & O"0" & O"0" & O"2",

-- L0036@0104 0002.  data16 = !$ + 1 + @  ToUpper1;
--  data16 = 0000000000000010;
260 => X"0002",

-- L0037@0105 4002.ToUpperEx:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
261 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0038@0106 0E03.ToUpper1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
262 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0039@0107 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
263 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0039@0108 007B.  data16 =  '{';
--  data16 = 0000000001111011;
264 => X"007B",

-- L0040@0109 8802.  r_a = LDA, r_s = M[POP],IF_A_GE;
--  r_p = 1000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
265 => X"8" & O"4" & O"0" & O"0" & O"2",

-- L0040@010A FFFB.  data16 = !$ + 1 + @  ToUpperEx;
--  data16 = 1111111111111011;
266 => X"FFFB",

-- L0041@010B 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
267 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0041@010C 001F.  data16 =  'a' - 'A' - 1;
--  data16 = 0000000000011111;
268 => X"001F",

-- L0042@010D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
269 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0047@010E 1C00.ToLower:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
270 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0047@010F 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
271 => X"00FF",

-- L0048@0110 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
272 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0048@0111 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
273 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@0112 FFD7.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111010111;
274 => X"FFD7",

-- L0049@0113 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
275 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0050@0114 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
276 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0050@0115 0041.  data16 =  'A';
--  data16 = 0000000001000001;
277 => X"0041",

-- L0051@0116 8802.  r_a = LDA, r_s = M[POP],IF_A_GE;
--  r_p = 1000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
278 => X"8" & O"4" & O"0" & O"0" & O"2",

-- L0051@0117 0002.  data16 = !$ + 1 + @  ToLower1;
--  data16 = 0000000000000010;
279 => X"0002",

-- L0052@0118 4002.ToLowerEx:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
280 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0053@0119 0E03.ToLower1:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
281 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0054@011A 1200.  r_p = M[IMM], r_a = SBC;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
282 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0054@011B 005B.  data16 =  '[';
--  data16 = 0000000001011011;
283 => X"005B",

-- L0055@011C 8802.  r_a = LDA, r_s = M[POP],IF_A_GE;
--  r_p = 1000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
284 => X"8" & O"4" & O"0" & O"0" & O"2",

-- L0055@011D FFFB.  data16 = !$ + 1 + @  ToLowerEx;
--  data16 = 1111111111111011;
285 => X"FFFB",

-- L0056@011E 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
286 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0056@011F FFE0.  data16 =  'A' - 'a';
--  data16 = 1111111111100000;
287 => X"FFE0",

-- L0057@0120 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
288 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0059@0121 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
289 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0060@0122 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0060@0123 0006.  data16 = !$ + 1 + @  PrintDone;
--  data16 = 0000000000000110;
291 => X"0006",

-- L0061@0124 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
292 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0061@0125 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
293 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0061@0126 0004.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000000000100;
294 => X"0004",

-- L0062@0127 2010.  INY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
295 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0062@0128 FFF9.  data16 = !$ + 1 + @  Print;
--  data16 = 1111111111111001;
296 => X"FFF9",

-- L0063@0129 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
297 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0065@012A 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
298 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0065@012B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
299 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0065@012C 0062.  data16 = !$ + 1 + @  UART_OutChr;
--  data16 = 0000000001100010;
300 => X"0062",

-- L0067@012D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
301 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0072@012E 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
302 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0073@012F 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
303 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0074@0130 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
304 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0075@0131 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
305 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0075@0132 0003.  data16 =  3;
--  data16 = 0000000000000011;
306 => X"0003",

-- L0076@0133 B000.PushNibLp:  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
307 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0076@0134 0008.  data16 = !$ + 1 + @  PrintHexLp;
--  data16 = 0000000000001000;
308 => X"0008",

-- L0077@0135 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
309 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0078@0136 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
310 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0079@0137 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
311 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0080@0138 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
312 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0081@0139 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
313 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0082@013A 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
314 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0082@013B FFF8.  data16 = !$ + 1 + @  PushNibLp;
--  data16 = 1111111111111000;
315 => X"FFF8",

-- L0083@013C 1040.PrintHexLp:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
316 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0083@013D 0004.  data16 =  4;
--  data16 = 0000000000000100;
317 => X"0004",

-- L0084@013E A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0084@013F 000D.  data16 = !$ + 1 + @  PrintHexEx;
--  data16 = 0000000000001101;
319 => X"000D",

-- L0085@0140 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
320 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0086@0141 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
321 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0086@0142 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
322 => X"000F",

-- L0087@0143 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
323 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0087@0144 02B2.  data16 =  @StrHex;
--  data16 = 0000001010110010;
324 => X"02B2",

-- L0088@0145 0E28.  ADY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 101, r_s = 000;
325 => X"0" & O"7" & O"0" & O"5" & O"0",

-- L0089@0146 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
326 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0090@0147 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
327 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0090@0148 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
328 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@0149 FFE1.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 1111111111100001;
329 => X"FFE1",

-- L0091@014A 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
330 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0091@014B FFF1.  data16 = !$ + 1 + @  PrintHexLp;
--  data16 = 1111111111110001;
331 => X"FFF1",

-- L0092@014C 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
332 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0093@014D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
333 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0094@014E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
334 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0099@014F 003B.PrintBin:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
335 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0100@0150 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
336 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0101@0151 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
337 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0101@0152 0010.  data16 =  16;
--  data16 = 0000000000010000;
338 => X"0010",

-- L0102@0153 B000.PrintBinLp:  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
339 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0102@0154 FFF8.  data16 = !$ + 1 + @  PrintHexEx;
--  data16 = 1111111111111000;
340 => X"FFF8",

-- L0103@0155 0E03.  STA, M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
341 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0103@0156 0A02.  ADC, M[POP]  ;
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 010;
342 => X"0" & O"5" & O"0" & O"0" & O"2",

-- L0104@0157 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
343 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0105@0158 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
344 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0105@0159 0030.  data16 =  '0';
--  data16 = 0000000000110000;
345 => X"0030",

-- L0106@015A 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
346 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0106@015B 0000.  data16 =  0;
--  data16 = 0000000000000000;
347 => X"0000",

-- L0107@015C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
348 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0107@015D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
349 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0107@015E FFCC.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 1111111111001100;
350 => X"FFCC",

-- L0108@015F 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
351 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0109@0160 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
352 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0109@0161 FFF2.  data16 = !$ + 1 + @  PrintBinLp;
--  data16 = 1111111111110010;
353 => X"FFF2",

-- L0002@0162 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
354 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0002@0163 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
355 => X"2000",

-- L0003@0164 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
356 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0003@0165 0003.  data16 =  3;
--  data16 = 0000000000000011;
357 => X"0003",

-- L0004@0166 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
358 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0005@0167 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
359 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0168 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
360 => X"0010",

-- L0006@0169 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
361 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@016A 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
362 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@016B 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
363 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0011@016C 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
364 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0012@016D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
365 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@016E 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
366 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0013@016F 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
367 => X"2000",

-- L0014@0170 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
368 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0014@0171 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
369 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0014@0172 002B.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000101011;
370 => X"002B",

-- L0015@0173 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
371 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0015@0174 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
372 => X"0001",

-- L0016@0175 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
373 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0016@0176 FFFA.  data16 = !$ + 1 + @  RdStatus0;
--  data16 = 1111111111111010;
374 => X"FFFA",

-- L0017@0177 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
375 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0018@0178 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
376 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0019@0179 1C00.NoChar:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
377 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0019@017A 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
378 => X"00FF",

-- L0020@017B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
379 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0021@017C 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
380 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0021@017D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
381 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0024@017E 0003.UART_ChkChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
382 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0025@017F 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
383 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0026@0180 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
384 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0027@0181 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
385 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0027@0182 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
386 => X"2000",

-- L0028@0183 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
387 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0028@0184 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
388 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0028@0185 0018.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000011000;
389 => X"0018",

-- L0029@0186 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
390 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0029@0187 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
391 => X"0001",

-- L0030@0188 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
392 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0030@0189 FFF0.  data16 = !$ + 1 + @  NoChar;
--  data16 = 1111111111110000;
393 => X"FFF0",

-- L0031@018A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
394 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@018B FFEC.  data16 = !$ + 1 + @  GetChr;
--  data16 = 1111111111101100;
395 => X"FFEC",

-- L0034@018C 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
396 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0034@018D 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
397 => X"0007",

-- L0035@018E 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
398 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0036@018F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
399 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0037@0190 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
400 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0037@0191 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
401 => X"2000",

-- L0038@0192 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
402 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0038@0193 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
403 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@0194 0009.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000001001;
404 => X"0009",

-- L0039@0195 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
405 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0039@0196 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
406 => X"0002",

-- L0040@0197 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
407 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0040@0198 FFFA.  data16 = !$ + 1 + @  RdStatus1;
--  data16 = 1111111111111010;
408 => X"FFFA",

-- L0041@0199 0812.OutChr:  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
409 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0042@019A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
410 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0043@019B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
411 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0044@019C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
412 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0046@019D 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
413 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0047@019E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
414 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0048@019F 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
415 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0049@01A0 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
416 => X"0" & O"2" & O"0" & O"0" & O"6",

-- L0050@01A1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
417 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0050@01A2 0004.  data16 = !$ + 1 + @  StIsStable;
--  data16 = 0000000000000100;
418 => X"0004",

-- L0051@01A3 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
419 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0052@01A4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
420 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@01A5 FFF8.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 1111111111111000;
421 => X"FFF8",

-- L0053@01A6 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
422 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0054@01A7 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
423 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@01A8 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
424 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0010@01A9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
425 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@01AA FF3A.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111100111010;
426 => X"FF3A",

-- L0011@01AB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
427 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0011@01AC 0040.  data16 =  64;
--  data16 = 0000000001000000;
428 => X"0040",

-- L0012@01AD 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
429 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0013@01AE 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
430 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0013@01AF 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
431 => X"1000",

-- L0014@01B0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
432 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0014@01B1 0020.  data16 =  32;
--  data16 = 0000000000100000;
433 => X"0020",

-- L0015@01B2 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
434 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0015@01B3 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
435 => X"FF00",

-- L0016@01B4 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
436 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0017@01B5 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
437 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0018@01B6 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
438 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0019@01B7 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
439 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0020@01B8 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
440 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0020@01B9 0003.  data16 = 3;
--  data16 = 0000000000000011;
441 => X"0003",

-- L0020@01BA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
442 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@01BB FFFA.  data16 = !$ + 1 + @  RowOffLoop;
--  data16 = 1111111111111010;
443 => X"FFFA",

-- L0021@01BC 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
444 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0022@01BD 0120.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
445 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0023@01BE 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
446 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0023@01BF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
447 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@01C0 0047.  data16 = !$ + 1 + @  SetOldCrsXY;
--  data16 = 0000000001000111;
448 => X"0047",

-- L0024@01C1 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
449 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0024@01C2 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
450 => X"0001",

-- L0028@01C3 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
451 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0029@01C4 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
452 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0030@01C5 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
453 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0030@01C6 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
454 => X"00FF",

-- L0031@01C7 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
455 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0033@01C8 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
456 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0033@01C9 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
457 => X"0002",

-- L0034@01CA 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
458 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0034@01CB 009F.  data16 = !$ + 1 + @  VGA_HOME;
--  data16 = 0000000010011111;
459 => X"009F",

-- L0036@01CC 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
460 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0037@01CD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
461 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0037@01CE 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
462 => X"0001",

-- L0038@01CF 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
463 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0038@01D0 0081.  data16 = !$ + 1 + @  VGA_CLS;
--  data16 = 0000000010000001;
464 => X"0081",

-- L0040@01D1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
465 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0041@01D2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
466 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0041@01D3 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
467 => X"0007",

-- L0042@01D4 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
468 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0042@01D5 002E.  data16 = !$ + 1 + @  VGA_Ignore;
--  data16 = 0000000000101110;
469 => X"002E",

-- L0044@01D6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
470 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0045@01D7 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
471 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0045@01D8 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
472 => X"0003",

-- L0046@01D9 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
473 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0046@01DA 0029.  data16 = !$ + 1 + @  VGA_Ignore;
--  data16 = 0000000000101001;
474 => X"0029",

-- L0048@01DB 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
475 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0048@01DC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
476 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@01DD 0099.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000000010011001;
477 => X"0099",

-- L0050@01DE 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
478 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0051@01DF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
479 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0051@01E0 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
480 => X"000D",

-- L0052@01E1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
481 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0052@01E2 005B.  data16 = !$ + 1 + @  VGA_CR;
--  data16 = 0000000001011011;
482 => X"005B",

-- L0054@01E3 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
483 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0055@01E4 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
484 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0055@01E5 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
485 => X"000A",

-- L0056@01E6 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
486 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0056@01E7 0067.  data16 = !$ + 1 + @  VGA_LF;
--  data16 = 0000000001100111;
487 => X"0067",

-- L0058@01E8 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
488 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0059@01E9 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
489 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0059@01EA 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
490 => X"0008",

-- L0060@01EB 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
491 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0060@01EC 0055.  data16 = !$ + 1 + @  VGA_BS;
--  data16 = 0000000001010101;
492 => X"0055",

-- L0063@01ED 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
493 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0065@01EE 003B.VGA_Print:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
494 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0066@01EF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
495 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0066@01F0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
496 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@01F1 008E.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000010001110;
497 => X"008E",

-- L0067@01F2 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
498 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0068@01F3 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
499 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0069@01F4 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
500 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0069@01F5 0040.  data16 =  64;
--  data16 = 0000000001000000;
501 => X"0040",

-- L0070@01F6 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
502 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0070@01F7 0019.  data16 = !$ + 1 + @  NextRow;
--  data16 = 0000000000011001;
503 => X"0019",

-- L0071@01F8 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
504 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@01F9 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
505 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0072@01FA FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
506 => X"FF3E",

-- L0073@01FB 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
507 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0074@01FC 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
508 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0074@01FD FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
509 => X"FF3F",

-- L0075@01FE 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
510 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0076@01FF 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
511 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0078@0200 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
512 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0079@0201 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
513 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0080@0202 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
514 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0082@0203 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
515 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0083@0204 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
516 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0084@0205 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
517 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0085@0206 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
518 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0087@0207 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
519 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0088@0208 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
520 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0088@0209 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
521 => X"FF3C",

-- L0089@020A 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
522 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0090@020B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
523 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0090@020C FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
524 => X"FF3D",

-- L0091@020D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
525 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@020E 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
526 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0093@020F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
527 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0095@0210 0100.NextRow:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
528 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0096@0211 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
529 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0097@0212 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
530 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0097@0213 0020.  data16 =  32;
--  data16 = 0000000000100000;
531 => X"0020",

-- L0098@0214 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
532 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0098@0215 0003.  data16 = !$ + 1 + @  ScrollUp;
--  data16 = 0000000000000011;
533 => X"0003",

-- L0099@0216 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
534 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0099@0217 FFE1.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111111100001;
535 => X"FFE1",

-- L0101@0218 0020.ScrollUp:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
536 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0102@0219 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
537 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0103@021A 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
538 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0104@021B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
539 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0104@021C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
540 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0104@021D 0062.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000001100010;
541 => X"0062",

-- L0105@021E 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
542 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0106@021F 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
543 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0106@0220 0040.  data16 =  64;
--  data16 = 0000000001000000;
544 => X"0040",

-- L0107@0221 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
545 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0108@0222 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
546 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0109@0223 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
547 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0110@0224 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
548 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0111@0225 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
549 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0111@0226 0040.  data16 =  64;
--  data16 = 0000000001000000;
550 => X"0040",

-- L0112@0227 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
551 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@0228 0003.  data16 = !$ + 1 + @  ChkRow;
--  data16 = 0000000000000011;
552 => X"0003",

-- L0113@0229 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
553 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0113@022A FFF4.  data16 = !$ + 1 + @  NxtCol;
--  data16 = 1111111111110100;
554 => X"FFF4",

-- L0114@022B 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
555 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0115@022C 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
556 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0116@022D 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
557 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0116@022E 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
558 => X"001F",

-- L0117@022F C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
559 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0117@0230 0003.  data16 = !$ + 1 + @  ClrLastRow;
--  data16 = 0000000000000011;
560 => X"0003",

-- L0118@0231 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
561 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0118@0232 FFE7.  data16 = !$ + 1 + @  NxtRow;
--  data16 = 1111111111100111;
562 => X"FFE7",

-- L0120@0233 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
563 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0121@0234 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
564 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0121@0235 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
565 => X"001F",

-- L0122@0236 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
566 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0123@0237 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
567 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0123@0238 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
568 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@0239 0028.  data16 = !$ + 1 + @  ClearRow;
--  data16 = 0000000000101000;
569 => X"0028",

-- L0124@023A 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
570 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0125@023B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
571 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0125@023C 0002.  data16 = !$ + 1 + @  SetX0;
--  data16 = 0000000000000010;
572 => X"0002",

-- L0127@023D 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
573 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0128@023E 0100.SetX0:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
574 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0129@023F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
575 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0129@0240 FFB8.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110111000;
576 => X"FFB8",

-- L0131@0241 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
577 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0132@0242 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
578 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0133@0243 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
579 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0133@0244 0003.  data16 = !$ + 1 + @  PrevRow;
--  data16 = 0000000000000011;
580 => X"0003",

-- L0134@0245 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
581 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0134@0246 FFB2.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110110010;
582 => X"FFB2",

-- L0135@0247 0008.PrevRow:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = CPY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
583 => X"0" & O"0" & O"0" & O"1" & O"0",

-- L0136@0248 D000.  IF_Y_EQ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
584 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0136@0249 FFAF.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110101111;
585 => X"FFAF",

-- L0137@024A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
586 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0137@024B 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
587 => X"003F",

-- L0138@024C 2018.  DEY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
588 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0138@024D FFAB.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110101011;
589 => X"FFAB",

-- L0140@024E 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
590 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0141@024F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
591 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0141@0250 FFC1.  data16 = !$ + 1 + @  NextRow1;
--  data16 = 1111111111000001;
592 => X"FFC1",

-- L0143@0251 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
593 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0144@0252 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
594 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0144@0253 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
595 => X"0020",

-- L0145@0254 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
596 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0146@0255 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
597 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0147@0256 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
598 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0147@0257 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
599 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0147@0258 0009.  data16 = !$ + 1 + @  ClearRow;
--  data16 = 0000000000001001;
600 => X"0009",

-- L0148@0259 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
601 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0149@025A 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
602 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0150@025B 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
603 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0150@025C 0020.  data16 =  32;
--  data16 = 0000000000100000;
604 => X"0020",

-- L0151@025D C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
605 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0151@025E 000D.  data16 = !$ + 1 + @  vga_home1;
--  data16 = 0000000000001101;
606 => X"000D",

-- L0152@025F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
607 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0152@0260 FFF5.  data16 = !$ + 1 + @  ClrNextRow;
--  data16 = 1111111111110101;
608 => X"FFF5",

-- L0154@0261 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
609 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0154@0262 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
610 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0154@0263 001C.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000000011100;
611 => X"001C",

-- L0155@0264 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
612 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0155@0265 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
613 => X"0020",

-- L0156@0266 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
614 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0156@0267 0008.  data16 =  64 / 8;
--  data16 = 0000000000001000;
615 => X"0008",

-- L0157@0268 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
616 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0157@0269 FE88.  data16 = !$ + 1 + @  MemFill;
--  data16 = 1111111010001000;
617 => X"FE88",

-- L0159@026A 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
618 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0160@026B 0120.vga_home1:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
619 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0161@026C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
620 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0161@026D FF8B.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110001011;
621 => X"FF8B",

-- L0163@026E 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
622 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0163@026F FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
623 => X"FF3C",

-- L0164@0270 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
624 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0165@0271 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
625 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0166@0272 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
626 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0166@0273 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
627 => X"FF3D",

-- L0167@0274 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
628 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0167@0275 0007.  data16 = !$ + 1 + @  GetCursorY;
--  data16 = 0000000000000111;
629 => X"0007",

-- L0169@0276 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
630 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0169@0277 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
631 => X"FF3E",

-- L0170@0278 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
632 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0171@0279 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
633 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0172@027A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
634 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0172@027B FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
635 => X"FF3F",

-- L0173@027C 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
636 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0174@027D 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
637 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0175@027E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
638 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0177@027F 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
639 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0178@0280 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
640 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0178@0281 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
641 => X"FF00",

-- L0179@0282 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
642 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0180@0283 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
643 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0181@0284 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
644 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0182@0285 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
645 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0184@0286 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
646 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0185@0287 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
647 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0186@0288 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
648 => X"0006",

-- L0187@0289 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
649 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0187@028A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
650 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0187@028B FF38.  data16 = !$ + 1 + @  VGA_OutChr;
--  data16 = 1111111100111000;
651 => X"FF38",

-- L0188@028C 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
652 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0189@028D FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
653 => X"FFF9",

-- L0190@028E 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
654 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@028F 0007.StrBreak:  data16 =  0x7;
--  data16 = 0000000000000111;
655 => X"0007",

-- L0004@0290 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
656 => X"000D",

-- L0005@0291 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
657 => X"000A",

-- L0006@0292 002A.  data16 =  '*';
--  data16 = 0000000000101010;
658 => X"002A",

-- L0007@0293 0042.  data16 =  'B';
--  data16 = 0000000001000010;
659 => X"0042",

-- L0008@0294 0052.  data16 =  'R';
--  data16 = 0000000001010010;
660 => X"0052",

-- L0009@0295 0045.  data16 =  'E';
--  data16 = 0000000001000101;
661 => X"0045",

-- L0010@0296 0041.  data16 =  'A';
--  data16 = 0000000001000001;
662 => X"0041",

-- L0011@0297 004B.  data16 =  'K';
--  data16 = 0000000001001011;
663 => X"004B",

-- L0012@0298 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
664 => X"0020",

-- L0013@0299 0000.  data16 =  0;
--  data16 = 0000000000000000;
665 => X"0000",

-- L0015@029A 0007.StrError:  data16 =  0x7;
--  data16 = 0000000000000111;
666 => X"0007",

-- L0016@029B 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
667 => X"000D",

-- L0017@029C 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
668 => X"000A",

-- L0018@029D 002A.  data16 =  '*';
--  data16 = 0000000000101010;
669 => X"002A",

-- L0019@029E 0045.  data16 =  'E';
--  data16 = 0000000001000101;
670 => X"0045",

-- L0020@029F 0052.  data16 =  'R';
--  data16 = 0000000001010010;
671 => X"0052",

-- L0021@02A0 0052.  data16 =  'R';
--  data16 = 0000000001010010;
672 => X"0052",

-- L0022@02A1 004F.  data16 =  'O';
--  data16 = 0000000001001111;
673 => X"004F",

-- L0023@02A2 0052.  data16 =  'R';
--  data16 = 0000000001010010;
674 => X"0052",

-- L0024@02A3 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
675 => X"0020",

-- L0025@02A4 0000.  data16 =  0;
--  data16 = 0000000000000000;
676 => X"0000",

-- L0027@02A5 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
677 => X"0007",

-- L0028@02A6 0000.  data16 =  0;
--  data16 = 0000000000000000;
678 => X"0000",

-- L0030@02A7 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
679 => X"0001",

-- L0031@02A8 0000.  data16 =  0;
--  data16 = 0000000000000000;
680 => X"0000",

-- L0033@02A9 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
681 => X"0052",

-- L0034@02AA 0065.  data16 =  'e';
--  data16 = 0000000001100101;
682 => X"0065",

-- L0035@02AB 0061.  data16 =  'a';
--  data16 = 0000000001100001;
683 => X"0061",

-- L0036@02AC 0064.  data16 =  'd';
--  data16 = 0000000001100100;
684 => X"0064",

-- L0037@02AD 0079.  data16 =  'y';
--  data16 = 0000000001111001;
685 => X"0079",

-- L0038@02AE 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
686 => X"002E",

-- L0039@02AF 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
687 => X"000D",

-- L0040@02B0 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
688 => X"000A",

-- L0041@02B1 0000.  data16 =  0;
--  data16 = 0000000000000000;
689 => X"0000",

-- L0043@02B2 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
690 => X"0030",

-- L0044@02B3 0031.  data16 =  '1';
--  data16 = 0000000000110001;
691 => X"0031",

-- L0045@02B4 0032.  data16 =  '2';
--  data16 = 0000000000110010;
692 => X"0032",

-- L0046@02B5 0033.  data16 =  '3';
--  data16 = 0000000000110011;
693 => X"0033",

-- L0047@02B6 0034.  data16 =  '4';
--  data16 = 0000000000110100;
694 => X"0034",

-- L0048@02B7 0035.  data16 =  '5';
--  data16 = 0000000000110101;
695 => X"0035",

-- L0049@02B8 0036.  data16 =  '6';
--  data16 = 0000000000110110;
696 => X"0036",

-- L0050@02B9 0037.  data16 =  '7';
--  data16 = 0000000000110111;
697 => X"0037",

-- L0051@02BA 0038.  data16 =  '8';
--  data16 = 0000000000111000;
698 => X"0038",

-- L0052@02BB 0039.  data16 =  '9';
--  data16 = 0000000000111001;
699 => X"0039",

-- L0053@02BC 0041.  data16 =  'A';
--  data16 = 0000000001000001;
700 => X"0041",

-- L0054@02BD 0042.  data16 =  'B';
--  data16 = 0000000001000010;
701 => X"0042",

-- L0055@02BE 0043.  data16 =  'C';
--  data16 = 0000000001000011;
702 => X"0043",

-- L0056@02BF 0044.  data16 =  'D';
--  data16 = 0000000001000100;
703 => X"0044",

-- L0057@02C0 0045.  data16 =  'E';
--  data16 = 0000000001000101;
704 => X"0045",

-- L0058@02C1 0046.  data16 =  'F';
--  data16 = 0000000001000110;
705 => X"0046",

-- 3394 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02C2 .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end monitor_code;

