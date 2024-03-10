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

-- L0021@0003 0037.  data16 = @  Init;
--  data16 = 0000000000110111;
3 => X"0037",

-- L0027@0008 0E03.IntHandler:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
8 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0009 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
9 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0029@000A 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
10 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0031@000B 6FFF.  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
11 => X"6" & O"7" & O"7" & O"7" & O"7",

-- L0033@000C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
12 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@000D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@000E 0247.  data16 = !$ + 1 + @  GetOldCrsXY;
--  data16 = 0000001001000111;
14 => X"0247",

-- L0034@000F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
15 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0035@0010 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
16 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0036@0011 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
17 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0036@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0013 0253.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000001001010011;
19 => X"0253",

-- L0037@0014 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0038@0015 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0038@0016 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
22 => X"FF7F",

-- L0039@0017 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
23 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0040@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0040@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0040@001A 0243.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000001001000011;
26 => X"0243",

-- L0041@001B 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
27 => X"0" & O"0" & O"1" & O"0" & O"2",

-- L0042@001C 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
28 => X"0" & O"0" & O"0" & O"1" & O"2",

-- L0043@001D B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0043@001E 0003.  data16 = 3;
--  data16 = 0000000000000011;
30 => X"0003",

-- L0043@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0043@0020 0003.  data16 = !$ + 1 + @  NoFlip;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0044@0021 D000.CheckY:  IF_Y_EQ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0044@0022 0006.  data16 = !$ + 1 + @  Flip;
--  data16 = 0000000000000110;
34 => X"0006",

-- L0045@0023 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
35 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0045@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0025 01C5.  data16 = !$ + 1 + @  SetOldCrsXY;
--  data16 = 0000000111000101;
37 => X"01C5",

-- L0046@0026 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0046@0027 000B.  data16 = !$ + 1 + @  IntExit;
--  data16 = 0000000000001011;
39 => X"000B",

-- L0048@0028 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
40 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0048@0029 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@002A 0233.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000001000110011;
42 => X"0233",

-- L0049@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0049@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0049@002D 0239.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000001000111001;
45 => X"0239",

-- L0050@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0051@002F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0051@0030 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
48 => X"0080",

-- L0052@0031 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0054@0032 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0055@0033 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
51 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0056@0034 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0057@0035 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0057@0036 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
54 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0060@0037 6003.Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0060@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0060@0039 0158.  data16 = !$ + 1 + @  VGA_Init;
--  data16 = 0000000101011000;
57 => X"0158",

-- L0062@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0062@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0062@003C 00F9.  data16 = !$ + 1 + @  UART_Init;
--  data16 = 0000000011111001;
60 => X"00F9",

-- L0065@003D 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0066@003E 6003.PrintLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0066@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@0040 00FE.  data16 = !$ + 1 + @  UART_GetChr;
--  data16 = 0000000011111110;
64 => X"00FE",

-- L0067@0041 6003.PrintLoop1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0067@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0067@0043 00CA.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000011001010;
67 => X"00CA",

-- L0068@0044 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0069@0045 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
69 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0069@0046 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
70 => X"0003",

-- L0070@0047 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
71 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0070@0048 000F.  data16 = !$ + 1 + @  Continue;
--  data16 = 0000000000001111;
72 => X"000F",

-- L0071@0049 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
73 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0072@004A 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0072@004B 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
75 => X"000D",

-- L0073@004C 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0073@004D 0003.  data16 = !$ + 1 + @  PrintLF;
--  data16 = 0000000000000011;
77 => X"0003",

-- L0074@004E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0074@004F FFEF.  data16 = !$ + 1 + @  PrintLoop;
--  data16 = 1111111111101111;
79 => X"FFEF",

-- L0075@0050 1020.PrintLF:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
80 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0075@0051 0295.  data16 =  @StrEnd;
--  data16 = 0000001010010101;
81 => X"0295",

-- L0076@0052 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
82 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0076@0053 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
83 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0076@0054 00B0.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010110000;
84 => X"00B0",

-- L0077@0055 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
85 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@0056 FFEB.  data16 = !$ + 1 + @  PrintLoop1;
--  data16 = 1111111111101011;
86 => X"FFEB",

-- L0079@0057 0802.Continue:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
87 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0080@0058 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
88 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0080@0059 028F.  data16 =  @StrReady;
--  data16 = 0000001010001111;
89 => X"028F",

-- L0081@005A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
90 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0081@005B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0081@005C 00B1.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000010110001;
92 => X"00B1",

-- L0083@005D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
93 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0083@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0083@005F 01FE.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000000111111110;
95 => X"01FE",

-- L0084@0060 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
96 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0084@0061 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
97 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0084@0062 0188.  data16 = !$ + 1 + @  SetOldCrsXY;
--  data16 = 0000000110001000;
98 => X"0188",

-- L0086@0063 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
99 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0086@0064 89AB.  data16 =  0x89AB;
--  data16 = 1000100110101011;
100 => X"89AB",

-- L0087@0065 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
101 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0087@0066 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
102 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0087@0067 00AB.  data16 = !$ + 1 + @  PrintHex;
--  data16 = 0000000010101011;
103 => X"00AB",

-- L0089@0068 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
104 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0094@0069 1020.MainLoop:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
105 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0094@006A FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
106 => X"FF40",

-- L0097@006B 0900.  r_p = NOP, r_a = LDA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 100, r_y = 000, r_s = 000;
107 => X"0" & O"4" & O"4" & O"0" & O"0",

-- L0098@006C 0FB0.TxtClear:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
108 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0099@006D 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
109 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0099@006E 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
110 => X"0010",

-- L0100@006F A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
111 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0100@0070 0003.  data16 = !$ + 1 + @  TxtCleared;
--  data16 = 0000000000000011;
112 => X"0003",

-- L0101@0071 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
113 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0101@0072 FFFA.  data16 = !$ + 1 + @  TxtClear;
--  data16 = 1111111111111010;
114 => X"FFFA",

-- L0103@0073 0100.TxtCleared:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
115 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0105@0074 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
116 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0105@0075 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
117 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0105@0076 002A.  data16 = !$ + 1 + @  CmdEdit;
--  data16 = 0000000000101010;
118 => X"002A",

-- L0106@0077 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
119 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0106@0078 0013.  data16 = !$ + 1 + @  ErrOrBrk;
--  data16 = 0000000000010011;
120 => X"0013",

-- L0109@0079 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
121 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0109@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0109@007B 0089.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000010001001;
123 => X"0089",

-- L0112@007C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
124 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0112@007D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
125 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0112@007E 0005.  data16 = !$ + 1 + @  CmdExec;
--  data16 = 0000000000000101;
126 => X"0005",

-- L0113@007F 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
127 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0113@0080 000B.  data16 = !$ + 1 + @  ErrOrBrk;
--  data16 = 0000000000001011;
128 => X"000B",

-- L0116@0081 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0116@0082 FFE7.  data16 = !$ + 1 + @  MainLoop;
--  data16 = 1111111111100111;
130 => X"FFE7",

-- L0121@0083 6003.CmdExec:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
131 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0121@0084 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
132 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@0085 00CC.  data16 = !$ + 1 + @  UART_IsBrk;
--  data16 = 0000000011001100;
133 => X"00CC",

-- L0122@0086 8000.  IF_A_GE;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
134 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0122@0087 0003.  data16 = !$ + 1 + @  CmdBreak;
--  data16 = 0000000000000011;
135 => X"0003",

-- L0123@0088 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
136 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0123@0089 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
137 => X"FFFF",

-- L0124@008A 4602.CmdBreak:  RRC, r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 011, r_x = 000, r_y = 000, r_s = 010;
138 => X"4" & O"3" & O"0" & O"0" & O"2",

-- L0126@008B 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
139 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0126@008C 0276.  data16 =  @StrBreak;
--  data16 = 0000001001110110;
140 => X"0276",

-- L0127@008D 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
141 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0127@008E 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
142 => X"0003",

-- L0128@008F 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
143 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0129@0090 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
144 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0129@0091 0073.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000001110011;
145 => X"0073",

-- L0130@0092 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
146 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0131@0093 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
147 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0131@0094 0280.  data16 =  @StrError;
--  data16 = 0000001010000000;
148 => X"0280",

-- L0132@0095 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
149 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0132@0096 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@0097 006D.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000001101101;
151 => X"006D",

-- L0133@0098 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
152 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0134@0099 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
153 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0134@009A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
154 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0134@009B FF64.  data16 = !$ + 1 + @  PrintHexA;
--  data16 = 1111111101100100;
155 => X"FF64",

-- L0135@009C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
156 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0135@009D 0295.  data16 =  @StrEnd;
--  data16 = 0000001010010101;
157 => X"0295",

-- L0136@009E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0136@009F 0065.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000001100101;
159 => X"0065",

-- L0138@00A0 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
160 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0138@00A1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
161 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00A2 009C.  data16 = !$ + 1 + @  UART_GetChr;
--  data16 = 0000000010011100;
162 => X"009C",

-- L0139@00A3 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
163 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0141@00A4 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
164 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0141@00A5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
165 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0141@00A6 0067.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000001100111;
166 => X"0067",

-- L0143@00A7 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
167 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0144@00A8 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
168 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0144@00A9 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
169 => X"000D",

-- L0145@00AA 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
170 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0145@00AB 0026.  data16 = !$ + 1 + @  LeaveEdit;
--  data16 = 0000000000100110;
171 => X"0026",

-- L0147@00AC 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
172 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0148@00AD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
173 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0148@00AE 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
174 => X"0003",

-- L0149@00AF 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
175 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0149@00B0 001A.  data16 = !$ + 1 + @  BrkEdit;
--  data16 = 0000000000011010;
176 => X"001A",

-- L0151@00B1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
177 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0152@00B2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
178 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0152@00B3 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
179 => X"0001",

-- L0153@00B4 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
180 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0153@00B5 0015.  data16 = !$ + 1 + @  BrkEdit;
--  data16 = 0000000000010101;
181 => X"0015",

-- L0155@00B6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
182 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0156@00B7 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
183 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0156@00B8 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
184 => X"0002",

-- L0157@00B9 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
185 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0157@00BA 0010.  data16 = !$ + 1 + @  BrkEdit;
--  data16 = 0000000000010000;
186 => X"0010",

-- L0159@00BB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
187 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0160@00BC 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
188 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0160@00BD 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
189 => X"0008",

-- L0161@00BE 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0161@00BF 0016.  data16 = !$ + 1 + @  BSEdit;
--  data16 = 0000000000010110;
191 => X"0016",

-- L0164@00C0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
192 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0165@00C1 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
193 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0166@00C2 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
194 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0166@00C3 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
195 => X"0010",

-- L0167@00C4 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
196 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0167@00C5 0023.  data16 = !$ + 1 + @  BumpEnd;
--  data16 = 0000000000100011;
197 => X"0023",

-- L0168@00C6 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
198 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0169@00C7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
199 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0170@00C8 2080.  INX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
200 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0170@00C9 FFD7.  data16 = !$ + 1 + @  CmdEdit;
--  data16 = 1111111111010111;
201 => X"FFD7",

-- L0173@00CA 0802.BrkEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
202 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0174@00CB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
203 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0174@00CC 0001.  data16 =  1;
--  data16 = 0000000000000001;
204 => X"0001",

-- L0175@00CD 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
205 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0176@00CE 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
206 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0176@00CF 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
207 => X"0003",

-- L0177@00D0 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
208 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0180@00D1 0802.LeaveEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
209 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0181@00D2 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
210 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0182@00D3 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
211 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0183@00D4 4602.  RRC, r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 011, r_x = 000, r_y = 000, r_s = 010;
212 => X"4" & O"3" & O"0" & O"0" & O"2",

-- L0186@00D5 0802.BSEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
213 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0187@00D6 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
214 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0188@00D7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
215 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0189@00D8 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
216 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0190@00D9 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0190@00DA 0003.  data16 = !$ + 1 + @  BumpStart;
--  data16 = 0000000000000011;
218 => X"0003",

-- L0191@00DB 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
219 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0191@00DC FFC4.  data16 = !$ + 1 + @  CmdEdit;
--  data16 = 1111111111000100;
220 => X"FFC4",

-- L0193@00DD 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
221 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0194@00DE 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
222 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0195@00DF 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
223 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0195@00E0 0288.  data16 =  @StrBeep;
--  data16 = 0000001010001000;
224 => X"0288",

-- L0196@00E1 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
225 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0196@00E2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
226 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0196@00E3 0021.  data16 = !$ + 1 + @  Print;
--  data16 = 0000000000100001;
227 => X"0021",

-- L0197@00E4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
228 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0198@00E5 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
229 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0199@00E6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0199@00E7 FFB9.  data16 = !$ + 1 + @  CmdEdit;
--  data16 = 1111111110111001;
231 => X"FFB9",

-- L0201@00E8 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
232 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0202@00E9 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
233 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0203@00EA 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
234 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0203@00EB 028A.  data16 =  @StrBack;
--  data16 = 0000001010001010;
235 => X"028A",

-- L0204@00EC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
236 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0204@00ED FFF4.  data16 = !$ + 1 + @  Bumped;
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

-- L0013@00F7 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
247 => X"FFFF",

-- L0014@00F8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
248 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0014@00F9 FFF7.  data16 = !$ + 1 + @  ACSet;
--  data16 = 1111111111110111;
249 => X"FFF7",

-- L0018@00FA 1C00.ToUpper:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
250 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0018@00FB 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
251 => X"00FF",

-- L0019@00FC 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
252 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0020@00FD 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
253 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0020@00FE 0061.  data16 =  'a';
--  data16 = 0000000001100001;
254 => X"0061",

-- L0021@00FF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
255 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0021@0100 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
256 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0021@0101 FFF2.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111110010;
257 => X"FFF2",

-- L0022@0102 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
258 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0023@0103 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
259 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0025@0104 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
260 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@0105 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
261 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0027@0106 0006.  data16 = !$ + 1 + @ PrintDone;
--  data16 = 0000000000000110;
262 => X"0006",

-- L0028@0107 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
263 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0028@0108 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
264 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0028@0109 0004.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 0000000000000100;
265 => X"0004",

-- L0029@010A 2010.  INY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
266 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0029@010B FFF9.  data16 = !$ + 1 + @  Print;
--  data16 = 1111111111111001;
267 => X"FFF9",

-- L0030@010C 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
268 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@010D 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
269 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0032@010E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
270 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0032@010F 009D.  data16 = !$ + 1 + @  VGA_OutChr;
--  data16 = 0000000010011101;
271 => X"009D",

-- L0033@0110 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
272 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@0111 005D.  data16 = !$ + 1 + @  UART_OutChr;
--  data16 = 0000000001011101;
273 => X"005D",

-- L0036@0112 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
274 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0037@0113 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
275 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0038@0114 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
276 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0038@0115 0298.  data16 =  @StrHex;
--  data16 = 0000001010011000;
277 => X"0298",

-- L0040@0116 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
278 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0040@0117 000C.  data16 =  12;
--  data16 = 0000000000001100;
279 => X"000C",

-- L0041@0118 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
280 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0042@0119 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
281 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0044@011A 0040.SrcLoopX:  r_p = NOP, r_a = NOA, r_x = CPX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
282 => X"0" & O"0" & O"1" & O"0" & O"0",

-- L0045@011B B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
283 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0046@011C 0003.  data16 = !$ + 1 + @ PrintNib;
--  data16 = 0000000000000011;
284 => X"0003",

-- L0047@011D 26C0.  DEX, RRC,BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
285 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0047@011E FFFC.  data16 = !$ + 1 + @  SrcLoopX;
--  data16 = 1111111111111100;
286 => X"FFFC",

-- L0049@011F 1C00.PrintNib:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
287 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0049@0120 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
288 => X"000F",

-- L0050@0121 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
289 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0051@0122 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
290 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0052@0123 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
291 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0052@0124 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
292 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@0125 FFE8.  data16 = !$ + 1 + @  PrintChr;
--  data16 = 1111111111101000;
293 => X"FFE8",

-- L0054@0126 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
294 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0055@0127 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
295 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0056@0128 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
296 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0057@0129 0009.  data16 = !$ + 1 + @ PrintHexEx;
--  data16 = 0000000000001001;
297 => X"0009",

-- L0058@012A 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
298 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0059@012B 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
299 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0060@012C 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
300 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0061@012D 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
301 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0062@012E 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
302 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0063@012F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
303 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0064@0130 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
304 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0064@0131 FFE9.  data16 = !$ + 1 + @  SrcLoopX;
--  data16 = 1111111111101001;
305 => X"FFE9",

-- L0066@0132 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
306 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0067@0133 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
307 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0068@0134 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
308 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0135 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
309 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0002@0136 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
310 => X"2000",

-- L0003@0137 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
311 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0003@0138 0003.  data16 =  3;
--  data16 = 0000000000000011;
312 => X"0003",

-- L0004@0139 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
313 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0005@013A 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
314 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@013B 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
315 => X"0010",

-- L0006@013C 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
316 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@013D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
317 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0009@013E 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
318 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0010@013F 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
319 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0011@0140 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
320 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0012@0141 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
321 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0012@0142 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
322 => X"2000",

-- L0013@0143 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
323 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0013@0144 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
324 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0013@0145 0038.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000111000;
325 => X"0038",

-- L0014@0146 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
326 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0014@0147 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
327 => X"0001",

-- L0015@0148 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
328 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0015@0149 FFFA.  data16 = !$ + 1 + @  RdStatus0;
--  data16 = 1111111111111010;
329 => X"FFFA",

-- L0016@014A 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
330 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0017@014B 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
331 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0018@014C 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
332 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0018@014D 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
333 => X"00FF",

-- L0019@014E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
334 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0020@014F 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
335 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0020@0150 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
336 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0022@0151 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
337 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0023@0152 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
338 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0024@0153 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
339 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0024@0154 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
340 => X"2000",

-- L0025@0155 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
341 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0025@0156 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
342 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0025@0157 0026.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000100110;
343 => X"0026",

-- L0026@0158 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
344 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0026@0159 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
345 => X"0001",

-- L0027@015A 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
346 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0027@015B 0009.  data16 = !$ + 1 + @  NoBrk;
--  data16 = 0000000000001001;
347 => X"0009",

-- L0029@015C 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
348 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0030@015D 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
349 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0031@015E 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
350 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0031@015F 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
351 => X"00FF",

-- L0032@0160 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
352 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0032@0161 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
353 => X"0003",

-- L0033@0162 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
354 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0033@0163 0004.  data16 = !$ + 1 + @  Brk;
--  data16 = 0000000000000100;
355 => X"0004",

-- L0035@0164 0800.NoBrk:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
356 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0036@0165 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
357 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@0166 0003.  data16 = !$ + 1 + @  BrkExit;
--  data16 = 0000000000000011;
358 => X"0003",

-- L0037@0167 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
359 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0037@0168 0001.  data16 =  1;
--  data16 = 0000000000000001;
360 => X"0001",

-- L0038@0169 0622.BrkExit:  RRC, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 100, r_s = 010;
361 => X"0" & O"3" & O"0" & O"4" & O"2",

-- L0039@016A 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
362 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0040@016B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
363 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0042@016C 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
364 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0042@016D 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
365 => X"0007",

-- L0043@016E 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
366 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0044@016F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
367 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0045@0170 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
368 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0045@0171 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
369 => X"2000",

-- L0046@0172 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
370 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0046@0173 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
371 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0046@0174 0009.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 0000000000001001;
372 => X"0009",

-- L0047@0175 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
373 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0047@0176 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
374 => X"0002",

-- L0048@0177 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
375 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@0178 FFFA.  data16 = !$ + 1 + @  RdStatus1;
--  data16 = 1111111111111010;
376 => X"FFFA",

-- L0049@0179 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
377 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0050@017A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
378 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0051@017B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
379 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0052@017C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
380 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0054@017D 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
381 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0055@017E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
382 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0056@017F 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
383 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0057@0180 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
384 => X"0" & O"2" & O"0" & O"0" & O"6",

-- L0058@0181 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
385 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0058@0182 0004.  data16 = !$ + 1 + @  StIsStable;
--  data16 = 0000000000000100;
386 => X"0004",

-- L0059@0183 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
387 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0060@0184 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
388 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0060@0185 FFF8.  data16 = !$ + 1 + @  GetStatus;
--  data16 = 1111111111111000;
389 => X"FFF8",

-- L0061@0186 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
390 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0062@0187 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
391 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0064@0188 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
392 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0065@0189 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
393 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0066@018A 0006.  data16 = !$ + 1 + @ UART_Done;
--  data16 = 0000000000000110;
394 => X"0006",

-- L0067@018B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
395 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0067@018C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
396 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0067@018D FFE1.  data16 = !$ + 1 + @  UART_OutChr;
--  data16 = 1111111111100001;
397 => X"FFE1",

-- L0068@018E 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
398 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0069@018F FFF9.  data16 = !$ + 1 + @ UART_OutStr;
--  data16 = 1111111111111001;
399 => X"FFF9",

-- L0070@0190 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
400 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@0191 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
401 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0010@0192 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
402 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@0193 FF5B.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111101011011;
403 => X"FF5B",

-- L0011@0194 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
404 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0011@0195 0040.  data16 =  64;
--  data16 = 0000000001000000;
405 => X"0040",

-- L0012@0196 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
406 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0013@0197 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
407 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0013@0198 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
408 => X"1000",

-- L0014@0199 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
409 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0014@019A 0020.  data16 =  32;
--  data16 = 0000000000100000;
410 => X"0020",

-- L0015@019B 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
411 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0015@019C FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
412 => X"FF00",

-- L0016@019D 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
413 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0017@019E 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
414 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0018@019F 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
415 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0019@01A0 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
416 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0020@01A1 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
417 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0020@01A2 0003.  data16 = 3;
--  data16 = 0000000000000011;
418 => X"0003",

-- L0020@01A3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
419 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@01A4 FFFA.  data16 = !$ + 1 + @  RowOffLoop;
--  data16 = 1111111111111010;
420 => X"FFFA",

-- L0021@01A5 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
421 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0022@01A6 0120.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
422 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0023@01A7 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
423 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0023@01A8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
424 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@01A9 0041.  data16 = !$ + 1 + @  SetOldCrsXY;
--  data16 = 0000000001000001;
425 => X"0041",

-- L0024@01AA 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
426 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0024@01AB 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
427 => X"0001",

-- L0028@01AC 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
428 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0029@01AD 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
429 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0030@01AE 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
430 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0032@01AF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
431 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0032@01B0 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
432 => X"0002",

-- L0033@01B1 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
433 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0033@01B2 009F.  data16 = !$ + 1 + @  VGA_HOME;
--  data16 = 0000000010011111;
434 => X"009F",

-- L0035@01B3 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
435 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0036@01B4 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
436 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0036@01B5 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
437 => X"0001",

-- L0037@01B6 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
438 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0037@01B7 007D.  data16 = !$ + 1 + @  VGA_CLS;
--  data16 = 0000000001111101;
439 => X"007D",

-- L0039@01B8 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
440 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0040@01B9 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
441 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0040@01BA 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
442 => X"0007",

-- L0041@01BB 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
443 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0041@01BC 002A.  data16 = !$ + 1 + @  VGA_Ignore;
--  data16 = 0000000000101010;
444 => X"002A",

-- L0043@01BD 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
445 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0043@01BE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
446 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0043@01BF 009E.  data16 = !$ + 1 + @  GetCursorXY;
--  data16 = 0000000010011110;
447 => X"009E",

-- L0045@01C0 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
448 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0046@01C1 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
449 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0046@01C2 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
450 => X"000D",

-- L0047@01C3 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
451 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0047@01C4 005C.  data16 = !$ + 1 + @  VGA_CR;
--  data16 = 0000000001011100;
452 => X"005C",

-- L0049@01C5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
453 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0050@01C6 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
454 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0050@01C7 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
455 => X"000A",

-- L0051@01C8 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
456 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0051@01C9 0068.  data16 = !$ + 1 + @  VGA_LF;
--  data16 = 0000000001101000;
457 => X"0068",

-- L0053@01CA 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
458 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0054@01CB 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
459 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0054@01CC 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
460 => X"0008",

-- L0055@01CD 9000.  IF_A_EQ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
461 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0055@01CE 0056.  data16 = !$ + 1 + @  VGA_BS;
--  data16 = 0000000001010110;
462 => X"0056",

-- L0058@01CF 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
463 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0060@01D0 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
464 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0061@01D1 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
465 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0062@01D2 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
466 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0062@01D3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
467 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0062@01D4 0092.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000010010010;
468 => X"0092",

-- L0063@01D5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
469 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0064@01D6 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
470 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0065@01D7 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
471 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0065@01D8 0040.  data16 =  64;
--  data16 = 0000000001000000;
472 => X"0040",

-- L0066@01D9 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
473 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0066@01DA 0019.  data16 = !$ + 1 + @  NextRow;
--  data16 = 0000000000011001;
474 => X"0019",

-- L0067@01DB 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
475 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0068@01DC 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
476 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0068@01DD FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
477 => X"FF3E",

-- L0069@01DE 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
478 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0070@01DF 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
479 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0070@01E0 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
480 => X"FF3F",

-- L0071@01E1 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
481 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0072@01E2 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
482 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0074@01E3 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
483 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0075@01E4 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
484 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0076@01E5 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
485 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0078@01E6 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
486 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0079@01E7 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
487 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0080@01E8 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
488 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0081@01E9 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
489 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0083@01EA 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
490 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0084@01EB 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
491 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0084@01EC FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
492 => X"FF3C",

-- L0085@01ED 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
493 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0086@01EE 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
494 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0086@01EF FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
495 => X"FF3D",

-- L0087@01F0 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
496 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0088@01F1 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
497 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0089@01F2 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
498 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0091@01F3 0100.NextRow:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
499 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0092@01F4 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
500 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@01F5 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
501 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0093@01F6 0020.  data16 =  32;
--  data16 = 0000000000100000;
502 => X"0020",

-- L0094@01F7 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
503 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0094@01F8 0003.  data16 = !$ + 1 + @  ScrollUp;
--  data16 = 0000000000000011;
504 => X"0003",

-- L0095@01F9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
505 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0095@01FA FFE1.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111111100001;
506 => X"FFE1",

-- L0097@01FB 0020.ScrollUp:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
507 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0098@01FC 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
508 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0099@01FD 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
509 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0100@01FE 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
510 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0100@01FF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
511 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0100@0200 0066.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000001100110;
512 => X"0066",

-- L0101@0201 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
513 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0102@0202 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
514 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0102@0203 0040.  data16 =  64;
--  data16 = 0000000001000000;
515 => X"0040",

-- L0103@0204 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
516 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0104@0205 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
517 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0105@0206 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
518 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0106@0207 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
519 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0107@0208 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
520 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0107@0209 0040.  data16 =  64;
--  data16 = 0000000001000000;
521 => X"0040",

-- L0108@020A A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
522 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0108@020B 0003.  data16 = !$ + 1 + @  ChkRow;
--  data16 = 0000000000000011;
523 => X"0003",

-- L0109@020C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
524 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0109@020D FFF4.  data16 = !$ + 1 + @  NxtCol;
--  data16 = 1111111111110100;
525 => X"FFF4",

-- L0110@020E 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
526 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0111@020F 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
527 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0112@0210 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
528 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0112@0211 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
529 => X"001F",

-- L0113@0212 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
530 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0113@0213 0003.  data16 = !$ + 1 + @  ClrLastRow;
--  data16 = 0000000000000011;
531 => X"0003",

-- L0114@0214 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
532 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@0215 FFE7.  data16 = !$ + 1 + @  NxtRow;
--  data16 = 1111111111100111;
533 => X"FFE7",

-- L0116@0216 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
534 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0117@0217 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
535 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0117@0218 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
536 => X"001F",

-- L0118@0219 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
537 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0119@021A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
538 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0119@021B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
539 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0119@021C 0028.  data16 = !$ + 1 + @  ClearRow;
--  data16 = 0000000000101000;
540 => X"0028",

-- L0120@021D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
541 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0121@021E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
542 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@021F 0002.  data16 = !$ + 1 + @  SetX0;
--  data16 = 0000000000000010;
543 => X"0002",

-- L0123@0220 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
544 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0124@0221 0100.SetX0:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
545 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0125@0222 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
546 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0125@0223 FFB8.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110111000;
547 => X"FFB8",

-- L0127@0224 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
548 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0128@0225 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
549 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0129@0226 B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
550 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0129@0227 0003.  data16 = !$ + 1 + @  PrevRow;
--  data16 = 0000000000000011;
551 => X"0003",

-- L0130@0228 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
552 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0130@0229 FFB2.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110110010;
553 => X"FFB2",

-- L0131@022A 0008.PrevRow:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = CPY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
554 => X"0" & O"0" & O"0" & O"1" & O"0",

-- L0132@022B D000.  IF_Y_EQ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
555 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0132@022C FFAF.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110101111;
556 => X"FFAF",

-- L0133@022D 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
557 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0133@022E 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
558 => X"003F",

-- L0134@022F 2018.  DEY,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
559 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0134@0230 FFAB.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110101011;
560 => X"FFAB",

-- L0136@0231 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
561 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0137@0232 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
562 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0137@0233 FFC1.  data16 = !$ + 1 + @  NextRow1;
--  data16 = 1111111111000001;
563 => X"FFC1",

-- L0139@0234 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
564 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0140@0235 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
565 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0140@0236 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
566 => X"0020",

-- L0141@0237 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
567 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0142@0238 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
568 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0143@0239 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
569 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0143@023A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
570 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0143@023B 0009.  data16 = !$ + 1 + @  ClearRow;
--  data16 = 0000000000001001;
571 => X"0009",

-- L0144@023C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
572 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0145@023D 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
573 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0146@023E 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
574 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0146@023F 0020.  data16 =  32;
--  data16 = 0000000000100000;
575 => X"0020",

-- L0147@0240 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
576 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0147@0241 0011.  data16 = !$ + 1 + @  vga_home1;
--  data16 = 0000000000010001;
577 => X"0011",

-- L0148@0242 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
578 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0148@0243 FFF5.  data16 = !$ + 1 + @  ClrNextRow;
--  data16 = 1111111111110101;
579 => X"FFF5",

-- L0150@0244 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
580 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0150@0245 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
581 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0150@0246 0020.  data16 = !$ + 1 + @  GetRowBase;
--  data16 = 0000000000100000;
582 => X"0020",

-- L0151@0247 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
583 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0151@0248 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
584 => X"0020",

-- L0152@0249 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
585 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0152@024A 000F.  data16 =  64 / 4 - 1;
--  data16 = 0000000000001111;
586 => X"000F",

-- L0153@024B 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
587 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0154@024C B000.  IF_X_EQ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
588 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0154@024D 0003.  data16 = !$ + 1 + @  ClrDone;
--  data16 = 0000000000000011;
589 => X"0003",

-- L0155@024E 20C0.  DEX,BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
590 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0155@024F FFFC.  data16 = !$ + 1 + @  ClrRLoop;
--  data16 = 1111111111111100;
591 => X"FFFC",

-- L0156@0250 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
592 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0158@0251 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
593 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0159@0252 0120.vga_home1:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
594 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0160@0253 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
595 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0160@0254 FF87.  data16 = !$ + 1 + @  SetCursorXY;
--  data16 = 1111111110000111;
596 => X"FF87",

-- L0162@0255 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
597 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0162@0256 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
598 => X"FF3C",

-- L0163@0257 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
599 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0164@0258 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
600 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0165@0259 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
601 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0165@025A FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
602 => X"FF3D",

-- L0166@025B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
603 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0166@025C 0007.  data16 = !$ + 1 + @  GetCursorY;
--  data16 = 0000000000000111;
604 => X"0007",

-- L0168@025D 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
605 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0168@025E FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
606 => X"FF3E",

-- L0169@025F 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
607 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0170@0260 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
608 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0171@0261 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
609 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0171@0262 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
610 => X"FF3F",

-- L0172@0263 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
611 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0173@0264 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
612 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0174@0265 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
613 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0176@0266 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
614 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0177@0267 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
615 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0177@0268 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
616 => X"FF00",

-- L0178@0269 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
617 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0179@026A 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
618 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0180@026B 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
619 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0181@026C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
620 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0183@026D 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
621 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0184@026E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
622 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0185@026F 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
623 => X"0006",

-- L0186@0270 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
624 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0186@0271 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
625 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0186@0272 FF3A.  data16 = !$ + 1 + @  VGA_OutChr;
--  data16 = 1111111100111010;
626 => X"FF3A",

-- L0187@0273 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
627 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0188@0274 FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
628 => X"FFF9",

-- L0189@0275 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
629 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@0276 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
630 => X"000D",

-- L0004@0277 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
631 => X"000A",

-- L0005@0278 002A.  data16 =  '*';
--  data16 = 0000000000101010;
632 => X"002A",

-- L0006@0279 0042.  data16 =  'B';
--  data16 = 0000000001000010;
633 => X"0042",

-- L0007@027A 0052.  data16 =  'R';
--  data16 = 0000000001010010;
634 => X"0052",

-- L0008@027B 0045.  data16 =  'E';
--  data16 = 0000000001000101;
635 => X"0045",

-- L0009@027C 0041.  data16 =  'A';
--  data16 = 0000000001000001;
636 => X"0041",

-- L0010@027D 004B.  data16 =  'K';
--  data16 = 0000000001001011;
637 => X"004B",

-- L0011@027E 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
638 => X"0007",

-- L0012@027F 0000.  data16 =  0;
--  data16 = 0000000000000000;
639 => X"0000",

-- L0014@0280 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
640 => X"000D",

-- L0015@0281 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
641 => X"000A",

-- L0016@0282 002A.  data16 =  '*';
--  data16 = 0000000000101010;
642 => X"002A",

-- L0017@0283 0045.  data16 =  'E';
--  data16 = 0000000001000101;
643 => X"0045",

-- L0018@0284 0052.  data16 =  'R';
--  data16 = 0000000001010010;
644 => X"0052",

-- L0019@0285 0052.  data16 =  'R';
--  data16 = 0000000001010010;
645 => X"0052",

-- L0020@0286 004F.  data16 =  'O';
--  data16 = 0000000001001111;
646 => X"004F",

-- L0021@0287 0052.  data16 =  'R';
--  data16 = 0000000001010010;
647 => X"0052",

-- L0022@0288 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
648 => X"0007",

-- L0023@0289 0000.  data16 =  0;
--  data16 = 0000000000000000;
649 => X"0000",

-- L0025@028A 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
650 => X"0008",

-- L0026@028B 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
651 => X"0007",

-- L0027@028C 0000.  data16 =  0;
--  data16 = 0000000000000000;
652 => X"0000",

-- L0029@028D 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
653 => X"0001",

-- L0030@028E 0000.  data16 =  0;
--  data16 = 0000000000000000;
654 => X"0000",

-- L0032@028F 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
655 => X"0052",

-- L0033@0290 0065.  data16 =  'e';
--  data16 = 0000000001100101;
656 => X"0065",

-- L0034@0291 0061.  data16 =  'a';
--  data16 = 0000000001100001;
657 => X"0061",

-- L0035@0292 0064.  data16 =  'd';
--  data16 = 0000000001100100;
658 => X"0064",

-- L0036@0293 0079.  data16 =  'y';
--  data16 = 0000000001111001;
659 => X"0079",

-- L0037@0294 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
660 => X"002E",

-- L0038@0295 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
661 => X"000D",

-- L0039@0296 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
662 => X"000A",

-- L0040@0297 0000.  data16 =  0;
--  data16 = 0000000000000000;
663 => X"0000",

-- L0042@0298 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
664 => X"0030",

-- L0043@0299 0031.  data16 =  '1';
--  data16 = 0000000000110001;
665 => X"0031",

-- L0044@029A 0032.  data16 =  '2';
--  data16 = 0000000000110010;
666 => X"0032",

-- L0045@029B 0033.  data16 =  '3';
--  data16 = 0000000000110011;
667 => X"0033",

-- L0046@029C 0034.  data16 =  '4';
--  data16 = 0000000000110100;
668 => X"0034",

-- L0047@029D 0035.  data16 =  '5';
--  data16 = 0000000000110101;
669 => X"0035",

-- L0048@029E 0036.  data16 =  '6';
--  data16 = 0000000000110110;
670 => X"0036",

-- L0049@029F 0037.  data16 =  '7';
--  data16 = 0000000000110111;
671 => X"0037",

-- L0050@02A0 0038.  data16 =  '8';
--  data16 = 0000000000111000;
672 => X"0038",

-- L0051@02A1 0039.  data16 =  '9';
--  data16 = 0000000000111001;
673 => X"0039",

-- L0052@02A2 0041.  data16 =  'A';
--  data16 = 0000000001000001;
674 => X"0041",

-- L0053@02A3 0042.  data16 =  'B';
--  data16 = 0000000001000010;
675 => X"0042",

-- L0054@02A4 0043.  data16 =  'C';
--  data16 = 0000000001000011;
676 => X"0043",

-- L0055@02A5 0044.  data16 =  'D';
--  data16 = 0000000001000100;
677 => X"0044",

-- L0056@02A6 0045.  data16 =  'E';
--  data16 = 0000000001000101;
678 => X"0045",

-- L0057@02A7 0046.  data16 =  'F';
--  data16 = 0000000001000110;
679 => X"0046",

-- 3420 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02A8 .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end monitor_code;

