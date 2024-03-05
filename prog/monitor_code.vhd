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

-- L0034@000D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@000E 0248.  data16 = !$ + 1 + @ GetOldCrsXY;
--  data16 = 0000001001001000;
14 => X"0248",

-- L0036@000F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
15 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0037@0010 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
16 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0038@0011 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
17 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0039@0012 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0040@0013 0254.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001010100;
19 => X"0254",

-- L0041@0014 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0042@0015 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0042@0016 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
22 => X"FF7F",

-- L0043@0017 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
23 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0044@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0045@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0046@001A 0244.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001001000100;
26 => X"0244",

-- L0047@001B 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
27 => X"0" & O"0" & O"1" & O"0" & O"2",

-- L0048@001C 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
28 => X"0" & O"0" & O"0" & O"1" & O"2",

-- L0049@001D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0050@001E 0003.  data16 = !$ + 1 + @ CheckY;
--  data16 = 0000000000000011;
30 => X"0003",

-- L0051@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@0020 0003.  data16 = !$ + 1 + @ NoFlip;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0053@0021 D000.CheckY:  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0054@0022 0006.  data16 = !$ + 1 + @ Flip;
--  data16 = 0000000000000110;
34 => X"0006",

-- L0055@0023 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
35 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0056@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0057@0025 01C6.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000111000110;
37 => X"01C6",

-- L0058@0026 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@0027 000B.  data16 = !$ + 1 + @ IntExit;
--  data16 = 0000000000001011;
39 => X"000B",

-- L0061@0028 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
40 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0062@0029 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0063@002A 0234.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000110100;
42 => X"0234",

-- L0064@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0065@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@002D 023A.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001000111010;
45 => X"023A",

-- L0067@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0068@002F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0068@0030 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
48 => X"0080",

-- L0069@0031 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0071@0032 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0072@0033 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
51 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0073@0034 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0074@0035 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0074@0036 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
54 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0077@0037 6003.Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0078@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0079@0039 0159.  data16 = !$ + 1 + @ VGA_Init;
--  data16 = 0000000101011001;
57 => X"0159",

-- L0081@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0082@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0083@003C 00FA.  data16 = !$ + 1 + @ UART_Init;
--  data16 = 0000000011111010;
60 => X"00FA",

-- L0086@003D 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0087@003E 6003.PrintLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0088@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0089@0040 00FF.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000011111111;
64 => X"00FF",

-- L0090@0041 6003.PrintLoop1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0091@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0092@0043 00C8.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000011001000;
67 => X"00C8",

-- L0093@0044 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0094@0045 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
69 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0094@0046 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
70 => X"0003",

-- L0095@0047 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
71 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0096@0048 000C.  data16 = !$ + 1 + @ Continue;
--  data16 = 0000000000001100;
72 => X"000C",

-- L0097@0049 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
73 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0098@004A 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0098@004B 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
75 => X"000D",

-- L0099@004C 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0100@004D 0003.  data16 = !$ + 1 + @ PrintLF;
--  data16 = 0000000000000011;
77 => X"0003",

-- L0101@004E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@004F FFEF.  data16 = !$ + 1 + @ PrintLoop;
--  data16 = 1111111111101111;
79 => X"FFEF",

-- L0103@0050 1800.PrintLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
80 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0103@0051 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
81 => X"000A",

-- L0104@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0105@0053 FFEE.  data16 = !$ + 1 + @ PrintLoop1;
--  data16 = 1111111111101110;
83 => X"FFEE",

-- L0107@0054 0802.Continue:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
84 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0108@0055 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
85 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0108@0056 0290.  data16 =  @StrReady;
--  data16 = 0000001010010000;
86 => X"0290",

-- L0109@0057 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
87 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0110@0058 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0111@0059 00B2.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000010110010;
89 => X"00B2",

-- L0113@005A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
90 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0114@005B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0115@005C 0202.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000000010;
92 => X"0202",

-- L0116@005D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
93 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0117@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0118@005F 018C.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000110001100;
95 => X"018C",

-- L0120@0060 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
96 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0120@0061 89AB.  data16 =  0x89AB;
--  data16 = 1000100110101011;
97 => X"89AB",

-- L0121@0062 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
98 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0122@0063 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
99 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@0064 00AE.  data16 = !$ + 1 + @ PrintHex;
--  data16 = 0000000010101110;
100 => X"00AE",

-- L0125@0065 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
101 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0130@0066 1020.MainLoop:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
102 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0130@0067 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
103 => X"FF40",

-- L0133@0068 0900.  r_p = NOP, r_a = LDA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 100, r_y = 000, r_s = 000;
104 => X"0" & O"4" & O"4" & O"0" & O"0",

-- L0134@0069 0FB0.TxtClear:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
105 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0135@006A 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
106 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0135@006B 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
107 => X"0010",

-- L0136@006C A000.  IF_XC;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
108 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0137@006D 0003.  data16 = !$ + 1 + @ TxtCleared;
--  data16 = 0000000000000011;
109 => X"0003",

-- L0138@006E 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
110 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0139@006F FFFA.  data16 = !$ + 1 + @ TxtClear;
--  data16 = 1111111111111010;
111 => X"FFFA",

-- L0141@0070 0100.TxtCleared:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
112 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0143@0071 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
113 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0144@0072 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
114 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0145@0073 002B.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 0000000000101011;
115 => X"002B",

-- L0146@0074 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0147@0075 0014.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000010100;
117 => X"0014",

-- L0150@0076 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
118 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0151@0077 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
119 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0152@0078 008A.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000010001010;
120 => X"008A",

-- L0155@0079 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
121 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0156@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0157@007B 0005.  data16 = !$ + 1 + @ CmdExec;
--  data16 = 0000000000000101;
123 => X"0005",

-- L0158@007C 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0159@007D 000C.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000001100;
125 => X"000C",

-- L0162@007E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0163@007F FFE7.  data16 = !$ + 1 + @ MainLoop;
--  data16 = 1111111111100111;
127 => X"FFE7",

-- L0168@0080 6003.CmdExec:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
128 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0169@0081 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0170@0082 00D0.  data16 = !$ + 1 + @ UART_IsBrk;
--  data16 = 0000000011010000;
130 => X"00D0",

-- L0171@0083 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0172@0084 0004.  data16 = !$ + 1 + @ CmdBreak;
--  data16 = 0000000000000100;
132 => X"0004",

-- L0173@0085 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
133 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0173@0086 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
134 => X"FFFF",

-- L0174@0087 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
135 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0175@0088 4002.CmdBreak:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
136 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0177@0089 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
137 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0177@008A 0277.  data16 =  @StrBreak;
--  data16 = 0000001001110111;
138 => X"0277",

-- L0178@008B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
139 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0178@008C 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
140 => X"0003",

-- L0179@008D 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
141 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0180@008E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0181@008F 0073.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001110011;
143 => X"0073",

-- L0182@0090 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
144 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0183@0091 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
145 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0183@0092 0281.  data16 =  @StrError;
--  data16 = 0000001010000001;
146 => X"0281",

-- L0184@0093 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
147 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0185@0094 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0186@0095 006D.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101101;
149 => X"006D",

-- L0187@0096 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
150 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0188@0097 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
151 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0189@0098 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
152 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0190@0099 FF66.  data16 = !$ + 1 + @ PrintHexA;
--  data16 = 1111111101100110;
153 => X"FF66",

-- L0191@009A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
154 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0191@009B 0296.  data16 =  @StrEnd;
--  data16 = 0000001010010110;
155 => X"0296",

-- L0192@009C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0193@009D 0065.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001100101;
157 => X"0065",

-- L0195@009E 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
158 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0196@009F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0197@00A0 009F.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000010011111;
160 => X"009F",

-- L0198@00A1 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
161 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0200@00A2 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
162 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0201@00A3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
163 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0202@00A4 0067.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000001100111;
164 => X"0067",

-- L0204@00A5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
165 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0205@00A6 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
166 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0205@00A7 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
167 => X"000D",

-- L0206@00A8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0207@00A9 0026.  data16 = !$ + 1 + @ LeaveEdit;
--  data16 = 0000000000100110;
169 => X"0026",

-- L0209@00AA 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
170 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0210@00AB 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
171 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0210@00AC 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
172 => X"0003",

-- L0211@00AD 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0212@00AE 001A.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000011010;
174 => X"001A",

-- L0214@00AF 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
175 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0215@00B0 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
176 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0215@00B1 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
177 => X"0001",

-- L0216@00B2 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0217@00B3 0015.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010101;
179 => X"0015",

-- L0219@00B4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
180 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0220@00B5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
181 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0220@00B6 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
182 => X"0002",

-- L0221@00B7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0222@00B8 0010.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010000;
184 => X"0010",

-- L0224@00B9 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
185 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0225@00BA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
186 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0225@00BB 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
187 => X"0008",

-- L0226@00BC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0227@00BD 0016.  data16 = !$ + 1 + @ BSEdit;
--  data16 = 0000000000010110;
189 => X"0016",

-- L0230@00BE 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
190 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0231@00BF 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
191 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0232@00C0 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
192 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0232@00C1 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
193 => X"0010",

-- L0233@00C2 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
194 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0234@00C3 0023.  data16 = !$ + 1 + @ BumpEnd;
--  data16 = 0000000000100011;
195 => X"0023",

-- L0235@00C4 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
196 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0236@00C5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
197 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0237@00C6 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
198 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0238@00C7 FFD7.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111010111;
199 => X"FFD7",

-- L0241@00C8 0802.BrkEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
200 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0242@00C9 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
201 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0242@00CA 0001.  data16 =  1;
--  data16 = 0000000000000001;
202 => X"0001",

-- L0243@00CB 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
203 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0244@00CC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
204 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0244@00CD 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
205 => X"0003",

-- L0245@00CE 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
206 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0248@00CF 0802.LeaveEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
207 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0249@00D0 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
208 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0250@00D1 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
209 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0251@00D2 4602.  RRC, r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 011, r_x = 000, r_y = 000, r_s = 010;
210 => X"4" & O"3" & O"0" & O"0" & O"2",

-- L0254@00D3 0802.BSEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
211 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0255@00D4 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
212 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0256@00D5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
213 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0257@00D6 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
214 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0258@00D7 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
215 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0259@00D8 0003.  data16 = !$ + 1 + @ BumpStart;
--  data16 = 0000000000000011;
216 => X"0003",

-- L0260@00D9 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
217 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0261@00DA FFC4.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111000100;
218 => X"FFC4",

-- L0263@00DB 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
219 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0264@00DC 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
220 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0265@00DD 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
221 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0265@00DE 0289.  data16 =  @StrBeep;
--  data16 = 0000001010001001;
222 => X"0289",

-- L0266@00DF 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
223 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0267@00E0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
224 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0268@00E1 0021.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000000100001;
225 => X"0021",

-- L0269@00E2 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
226 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0270@00E3 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
227 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0271@00E4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
228 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0272@00E5 FFB9.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111110111001;
229 => X"FFB9",

-- L0274@00E6 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
230 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0275@00E7 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
231 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0276@00E8 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
232 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0276@00E9 028B.  data16 =  @StrBack;
--  data16 = 0000001010001011;
233 => X"028B",

-- L0277@00EA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
234 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0278@00EB FFF4.  data16 = !$ + 1 + @ Bumped;
--  data16 = 1111111111110100;
235 => X"FFF4",

-- L0003@00EC 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
236 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@00ED 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
237 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0005@00EE 0600.ACSet:  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
238 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0006@00EF 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
239 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0007@00F0 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
240 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@00F1 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
241 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0011@00F2 FFFE.  data16 = !$ + 1 + @ ACDone;
--  data16 = 1111111111111110;
242 => X"FFFE",

-- L0012@00F3 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
243 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0013@00F4 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
244 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0013@00F5 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
245 => X"FFFF",

-- L0014@00F6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
246 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0015@00F7 FFF7.  data16 = !$ + 1 + @ ACSet;
--  data16 = 1111111111110111;
247 => X"FFF7",

-- L0019@00F8 1C00.ToUpper:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
248 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0019@00F9 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
249 => X"00FF",

-- L0020@00FA 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
250 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0021@00FB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
251 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0021@00FC 0061.  data16 =  'a';
--  data16 = 0000000001100001;
252 => X"0061",

-- L0022@00FD 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
253 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0022@00FE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
254 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0022@00FF FFF2.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111110010;
255 => X"FFF2",

-- L0023@0100 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
256 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0024@0101 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
257 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0026@0102 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
258 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0027@0103 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
259 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0028@0104 0006.  data16 = !$ + 1 + @ PrintDone;
--  data16 = 0000000000000110;
260 => X"0006",

-- L0029@0105 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
261 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0030@0106 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
262 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@0107 0004.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000000000100;
263 => X"0004",

-- L0032@0108 2010.  INY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
264 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0033@0109 FFF9.  data16 = !$ + 1 + @ Print;
--  data16 = 1111111111111001;
265 => X"FFF9",

-- L0034@010A 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
266 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0036@010B 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
267 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0037@010C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@010D 00A0.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 0000000010100000;
269 => X"00A0",

-- L0039@010E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
270 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0040@010F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
271 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0041@0110 005F.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 0000000001011111;
272 => X"005F",

-- L0042@0111 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
273 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0044@0112 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
274 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0045@0113 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
275 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0046@0114 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
276 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0046@0115 0000.  data16 =  ;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
277 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0047@0116 0299.  data16 = @ StrHex;
--  data16 = 0000001010011001;
278 => X"0299",

-- L0049@0117 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
279 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0049@0118 000C.  data16 =  12;
--  data16 = 0000000000001100;
280 => X"000C",

-- L0050@0119 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
281 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0051@011A 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
282 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0053@011B 0040.SrcLoopX:  r_p = NOP, r_a = NOA, r_x = CPX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
283 => X"0" & O"0" & O"1" & O"0" & O"0",

-- L0054@011C B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
284 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0055@011D 0003.  data16 = !$ + 1 + @ PrintNib;
--  data16 = 0000000000000011;
285 => X"0003",

-- L0056@011E 26C0.  DEX, RRC, BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
286 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0057@011F FFFC.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111111100;
287 => X"FFFC",

-- L0059@0120 1C00.PrintNib:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
288 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0059@0121 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
289 => X"000F",

-- L0060@0122 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
290 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0061@0123 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
291 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0062@0124 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
292 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0063@0125 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
293 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0064@0126 FFE5.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 1111111111100101;
294 => X"FFE5",

-- L0066@0127 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
295 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0067@0128 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
296 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0068@0129 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
297 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0069@012A 0009.  data16 = !$ + 1 + @ PrintHexEx;
--  data16 = 0000000000001001;
298 => X"0009",

-- L0070@012B 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
299 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0071@012C 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
300 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0072@012D 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
301 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0073@012E 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
302 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0074@012F 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
303 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@0130 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
304 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0076@0131 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
305 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@0132 FFE9.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111101001;
306 => X"FFE9",

-- L0079@0133 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
307 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0080@0134 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
308 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0081@0135 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
309 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0136 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
310 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0002@0137 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
311 => X"2000",

-- L0003@0138 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
312 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0003@0139 0003.  data16 =  3;
--  data16 = 0000000000000011;
313 => X"0003",

-- L0004@013A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
314 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0005@013B 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
315 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@013C 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
316 => X"0010",

-- L0006@013D 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
317 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@013E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
318 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0009@013F 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
319 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0010@0140 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
320 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0011@0141 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
321 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0012@0142 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
322 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0012@0143 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
323 => X"2000",

-- L0013@0144 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
324 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0014@0145 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
325 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0015@0146 0038.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000111000;
326 => X"0038",

-- L0016@0147 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
327 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0016@0148 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
328 => X"0001",

-- L0017@0149 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
329 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0018@014A FFFA.  data16 = !$ + 1 + @ RdStatus0;
--  data16 = 1111111111111010;
330 => X"FFFA",

-- L0019@014B 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
331 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0020@014C 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
332 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0021@014D 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
333 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0021@014E 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
334 => X"00FF",

-- L0022@014F 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
335 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0023@0150 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
336 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0024@0151 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
337 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0026@0152 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
338 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0027@0153 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
339 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0028@0154 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
340 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0028@0155 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
341 => X"2000",

-- L0029@0156 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
342 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0030@0157 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
343 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@0158 0026.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000100110;
344 => X"0026",

-- L0032@0159 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
345 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0032@015A 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
346 => X"0001",

-- L0033@015B 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
347 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0034@015C 0009.  data16 = !$ + 1 + @ NoBrk;
--  data16 = 0000000000001001;
348 => X"0009",

-- L0036@015D 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
349 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0037@015E 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
350 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0038@015F 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
351 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0038@0160 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
352 => X"00FF",

-- L0039@0161 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
353 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0039@0162 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
354 => X"0003",

-- L0040@0163 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
355 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0041@0164 0004.  data16 = !$ + 1 + @ Brk;
--  data16 = 0000000000000100;
356 => X"0004",

-- L0043@0165 0800.NoBrk:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
357 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0044@0166 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
358 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0167 0003.  data16 = !$ + 1 + @ BrkExit;
--  data16 = 0000000000000011;
359 => X"0003",

-- L0046@0168 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
360 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0046@0169 0001.  data16 =  1;
--  data16 = 0000000000000001;
361 => X"0001",

-- L0047@016A 0622.BrkExit:  RRC, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 100, r_s = 010;
362 => X"0" & O"3" & O"0" & O"4" & O"2",

-- L0048@016B 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
363 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0049@016C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
364 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0051@016D 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
365 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0051@016E 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
366 => X"0007",

-- L0052@016F 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
367 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0053@0170 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
368 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0054@0171 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
369 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0054@0172 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
370 => X"2000",

-- L0055@0173 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
371 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0056@0174 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
372 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0057@0175 0009.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000001001;
373 => X"0009",

-- L0058@0176 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
374 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0058@0177 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
375 => X"0002",

-- L0059@0178 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
376 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0060@0179 FFFA.  data16 = !$ + 1 + @ RdStatus1;
--  data16 = 1111111111111010;
377 => X"FFFA",

-- L0061@017A 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
378 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0062@017B 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
379 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0063@017C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
380 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0064@017D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
381 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0066@017E 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
382 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0067@017F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
383 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0068@0180 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
384 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0069@0181 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
385 => X"0" & O"2" & O"0" & O"0" & O"6",

-- L0070@0182 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
386 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0071@0183 0004.  data16 = !$ + 1 + @ StIsStable;
--  data16 = 0000000000000100;
387 => X"0004",

-- L0072@0184 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
388 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0073@0185 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
389 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0074@0186 FFF8.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 1111111111111000;
390 => X"FFF8",

-- L0075@0187 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
391 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0076@0188 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
392 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0078@0189 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
393 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0079@018A 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
394 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0080@018B 0006.  data16 = !$ + 1 + @ UART_Done;
--  data16 = 0000000000000110;
395 => X"0006",

-- L0081@018C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
396 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0082@018D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
397 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0083@018E FFE1.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 1111111111100001;
398 => X"FFE1",

-- L0084@018F 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
399 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0085@0190 FFF9.  data16 = !$ + 1 + @ UART_OutStr;
--  data16 = 1111111111111001;
400 => X"FFF9",

-- L0086@0191 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
401 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@0192 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
402 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0010@0193 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
403 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@0194 FF58.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111101011000;
404 => X"FF58",

-- L0011@0195 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
405 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0011@0196 0040.  data16 =  64;
--  data16 = 0000000001000000;
406 => X"0040",

-- L0012@0197 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
407 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0013@0198 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
408 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0013@0199 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
409 => X"1000",

-- L0014@019A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
410 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0014@019B 0020.  data16 =  32;
--  data16 = 0000000000100000;
411 => X"0020",

-- L0015@019C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
412 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0015@019D FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
413 => X"FF00",

-- L0016@019E 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
414 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0017@019F 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
415 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0018@01A0 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
416 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0019@01A1 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
417 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0020@01A2 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
418 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0021@01A3 0003.  data16 = !$ + 1 + @ RowOffDone;
--  data16 = 0000000000000011;
419 => X"0003",

-- L0022@01A4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
420 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@01A5 FFFA.  data16 = !$ + 1 + @ RowOffLoop;
--  data16 = 1111111111111010;
421 => X"FFFA",

-- L0024@01A6 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
422 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0025@01A7 0120.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
423 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0026@01A8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
424 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0027@01A9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
425 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0028@01AA 0041.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000001000001;
426 => X"0041",

-- L0029@01AB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
427 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0029@01AC 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
428 => X"0001",

-- L0033@01AD 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
429 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0034@01AE 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
430 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0035@01AF 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
431 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0037@01B0 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
432 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0037@01B1 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
433 => X"0002",

-- L0038@01B2 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
434 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0039@01B3 009F.  data16 = !$ + 1 + @ VGA_HOME;
--  data16 = 0000000010011111;
435 => X"009F",

-- L0041@01B4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
436 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0042@01B5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
437 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0042@01B6 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
438 => X"0001",

-- L0043@01B7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
439 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0044@01B8 007D.  data16 = !$ + 1 + @ VGA_CLS;
--  data16 = 0000000001111101;
440 => X"007D",

-- L0046@01B9 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
441 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0047@01BA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
442 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0047@01BB 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
443 => X"0007",

-- L0048@01BC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
444 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0049@01BD 002A.  data16 = !$ + 1 + @ VGA_Ignore;
--  data16 = 0000000000101010;
445 => X"002A",

-- L0051@01BE 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
446 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0052@01BF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
447 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0053@01C0 009E.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000000010011110;
448 => X"009E",

-- L0055@01C1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
449 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0056@01C2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
450 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0056@01C3 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
451 => X"000D",

-- L0057@01C4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
452 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0058@01C5 005C.  data16 = !$ + 1 + @ VGA_CR;
--  data16 = 0000000001011100;
453 => X"005C",

-- L0060@01C6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
454 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0061@01C7 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
455 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0061@01C8 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
456 => X"000A",

-- L0062@01C9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
457 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0063@01CA 0068.  data16 = !$ + 1 + @ VGA_LF;
--  data16 = 0000000001101000;
458 => X"0068",

-- L0065@01CB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
459 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0066@01CC 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
460 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0066@01CD 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
461 => X"0008",

-- L0067@01CE 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
462 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0068@01CF 0056.  data16 = !$ + 1 + @ VGA_BS;
--  data16 = 0000000001010110;
463 => X"0056",

-- L0071@01D0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
464 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0073@01D1 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
465 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0074@01D2 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
466 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0075@01D3 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
467 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0076@01D4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
468 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@01D5 0092.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000010010010;
469 => X"0092",

-- L0078@01D6 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
470 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0079@01D7 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
471 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0080@01D8 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
472 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0080@01D9 0040.  data16 =  64;
--  data16 = 0000000001000000;
473 => X"0040",

-- L0081@01DA A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
474 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0082@01DB 0019.  data16 = !$ + 1 + @ NextRow;
--  data16 = 0000000000011001;
475 => X"0019",

-- L0083@01DC 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
476 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0084@01DD 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
477 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0084@01DE FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
478 => X"FF3E",

-- L0085@01DF 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
479 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0086@01E0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
480 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0086@01E1 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
481 => X"FF3F",

-- L0087@01E2 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
482 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0088@01E3 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
483 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0090@01E4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
484 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0091@01E5 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
485 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0092@01E6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
486 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0094@01E7 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
487 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0095@01E8 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
488 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0096@01E9 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
489 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0097@01EA 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
490 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0099@01EB 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
491 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0100@01EC 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
492 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0100@01ED FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
493 => X"FF3C",

-- L0101@01EE 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
494 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0102@01EF 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
495 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0102@01F0 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
496 => X"FF3D",

-- L0103@01F1 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
497 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0104@01F2 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
498 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0105@01F3 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
499 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0107@01F4 0100.NextRow:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
500 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0108@01F5 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
501 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0109@01F6 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
502 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0109@01F7 0020.  data16 =  32;
--  data16 = 0000000000100000;
503 => X"0020",

-- L0110@01F8 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
504 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0111@01F9 0003.  data16 = !$ + 1 + @ ScrollUp;
--  data16 = 0000000000000011;
505 => X"0003",

-- L0112@01FA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
506 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0113@01FB FFE1.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111111100001;
507 => X"FFE1",

-- L0115@01FC 0020.ScrollUp:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
508 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0116@01FD 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
509 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0117@01FE 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
510 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0118@01FF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
511 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0119@0200 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
512 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0120@0201 0066.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000001100110;
513 => X"0066",

-- L0121@0202 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
514 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0122@0203 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
515 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0122@0204 0040.  data16 =  64;
--  data16 = 0000000001000000;
516 => X"0040",

-- L0123@0205 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
517 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0124@0206 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
518 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0125@0207 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
519 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0126@0208 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
520 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0127@0209 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
521 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0127@020A 0040.  data16 =  64;
--  data16 = 0000000001000000;
522 => X"0040",

-- L0128@020B A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
523 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0129@020C 0003.  data16 = !$ + 1 + @ ChkRow;
--  data16 = 0000000000000011;
524 => X"0003",

-- L0130@020D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
525 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0131@020E FFF4.  data16 = !$ + 1 + @ NxtCol;
--  data16 = 1111111111110100;
526 => X"FFF4",

-- L0132@020F 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
527 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0133@0210 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
528 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0134@0211 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
529 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0134@0212 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
530 => X"001F",

-- L0135@0213 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
531 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0136@0214 0003.  data16 = !$ + 1 + @ ClrLastRow;
--  data16 = 0000000000000011;
532 => X"0003",

-- L0137@0215 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
533 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@0216 FFE7.  data16 = !$ + 1 + @ NxtRow;
--  data16 = 1111111111100111;
534 => X"FFE7",

-- L0140@0217 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
535 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0141@0218 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
536 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0141@0219 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
537 => X"001F",

-- L0142@021A 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
538 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0143@021B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
539 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0144@021C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
540 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0145@021D 0028.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000101000;
541 => X"0028",

-- L0146@021E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
542 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0147@021F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
543 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0148@0220 0002.  data16 = !$ + 1 + @ SetX0;
--  data16 = 0000000000000010;
544 => X"0002",

-- L0150@0221 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
545 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0151@0222 0100.SetX0:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
546 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0152@0223 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
547 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0153@0224 FFB8.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110111000;
548 => X"FFB8",

-- L0155@0225 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
549 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0156@0226 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
550 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0157@0227 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
551 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0158@0228 0003.  data16 = !$ + 1 + @ PrevRow;
--  data16 = 0000000000000011;
552 => X"0003",

-- L0159@0229 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
553 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0160@022A FFB2.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110010;
554 => X"FFB2",

-- L0161@022B 0008.PrevRow:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = CPY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
555 => X"0" & O"0" & O"0" & O"1" & O"0",

-- L0162@022C D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
556 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0163@022D FFAF.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101111;
557 => X"FFAF",

-- L0164@022E 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
558 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0164@022F 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
559 => X"003F",

-- L0165@0230 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
560 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0166@0231 FFAB.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101011;
561 => X"FFAB",

-- L0168@0232 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
562 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0169@0233 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
563 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0170@0234 FFC1.  data16 = !$ + 1 + @ NextRow1;
--  data16 = 1111111111000001;
564 => X"FFC1",

-- L0172@0235 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
565 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0173@0236 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
566 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0173@0237 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
567 => X"0020",

-- L0174@0238 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
568 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0175@0239 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
569 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0176@023A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
570 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0177@023B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
571 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0178@023C 0009.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000001001;
572 => X"0009",

-- L0179@023D 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
573 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0180@023E 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
574 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0181@023F 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
575 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0181@0240 0020.  data16 =  32;
--  data16 = 0000000000100000;
576 => X"0020",

-- L0182@0241 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
577 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0183@0242 0011.  data16 = !$ + 1 + @ vga_home1;
--  data16 = 0000000000010001;
578 => X"0011",

-- L0184@0243 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
579 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0185@0244 FFF5.  data16 = !$ + 1 + @ ClrNextRow;
--  data16 = 1111111111110101;
580 => X"FFF5",

-- L0187@0245 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
581 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0188@0246 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
582 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0189@0247 0020.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000000100000;
583 => X"0020",

-- L0190@0248 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
584 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0190@0249 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
585 => X"0020",

-- L0191@024A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
586 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0191@024B 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
587 => X"0007",

-- L0192@024C 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
588 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0193@024D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
589 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0194@024E 0003.  data16 = !$ + 1 + @ ClrDone;
--  data16 = 0000000000000011;
590 => X"0003",

-- L0195@024F 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
591 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0196@0250 FFFC.  data16 = !$ + 1 + @ ClrRLoop;
--  data16 = 1111111111111100;
592 => X"FFFC",

-- L0197@0251 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
593 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0199@0252 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
594 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0200@0253 0120.vga_home1:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
595 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0201@0254 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
596 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0202@0255 FF87.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110000111;
597 => X"FF87",

-- L0204@0256 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
598 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0204@0257 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
599 => X"FF3C",

-- L0205@0258 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
600 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0206@0259 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
601 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0207@025A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
602 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0207@025B FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
603 => X"FF3D",

-- L0208@025C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
604 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0209@025D 0007.  data16 = !$ + 1 + @ GetCursorY;
--  data16 = 0000000000000111;
605 => X"0007",

-- L0211@025E 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
606 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0211@025F FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
607 => X"FF3E",

-- L0212@0260 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
608 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0213@0261 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
609 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0214@0262 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
610 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0214@0263 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
611 => X"FF3F",

-- L0215@0264 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
612 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0216@0265 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
613 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0217@0266 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
614 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0219@0267 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
615 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0220@0268 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
616 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0220@0269 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
617 => X"FF00",

-- L0221@026A 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
618 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0222@026B 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
619 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0223@026C 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
620 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0224@026D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
621 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0226@026E 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
622 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0227@026F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
623 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0228@0270 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
624 => X"0006",

-- L0229@0271 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
625 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0230@0272 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
626 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0231@0273 FF3A.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 1111111100111010;
627 => X"FF3A",

-- L0232@0274 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
628 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0233@0275 FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
629 => X"FFF9",

-- L0234@0276 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
630 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@0277 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
631 => X"000D",

-- L0004@0278 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
632 => X"000A",

-- L0005@0279 002A.  data16 =  '*';
--  data16 = 0000000000101010;
633 => X"002A",

-- L0006@027A 0042.  data16 =  'B';
--  data16 = 0000000001000010;
634 => X"0042",

-- L0007@027B 0052.  data16 =  'R';
--  data16 = 0000000001010010;
635 => X"0052",

-- L0008@027C 0045.  data16 =  'E';
--  data16 = 0000000001000101;
636 => X"0045",

-- L0009@027D 0041.  data16 =  'A';
--  data16 = 0000000001000001;
637 => X"0041",

-- L0010@027E 004B.  data16 =  'K';
--  data16 = 0000000001001011;
638 => X"004B",

-- L0011@027F 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
639 => X"0007",

-- L0012@0280 0000.  data16 =  0;
--  data16 = 0000000000000000;
640 => X"0000",

-- L0014@0281 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
641 => X"000D",

-- L0015@0282 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
642 => X"000A",

-- L0016@0283 002A.  data16 =  '*';
--  data16 = 0000000000101010;
643 => X"002A",

-- L0017@0284 0045.  data16 =  'E';
--  data16 = 0000000001000101;
644 => X"0045",

-- L0018@0285 0052.  data16 =  'R';
--  data16 = 0000000001010010;
645 => X"0052",

-- L0019@0286 0052.  data16 =  'R';
--  data16 = 0000000001010010;
646 => X"0052",

-- L0020@0287 004F.  data16 =  'O';
--  data16 = 0000000001001111;
647 => X"004F",

-- L0021@0288 0052.  data16 =  'R';
--  data16 = 0000000001010010;
648 => X"0052",

-- L0022@0289 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
649 => X"0007",

-- L0023@028A 0000.  data16 =  0;
--  data16 = 0000000000000000;
650 => X"0000",

-- L0025@028B 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
651 => X"0008",

-- L0026@028C 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
652 => X"0007",

-- L0027@028D 0000.  data16 =  0;
--  data16 = 0000000000000000;
653 => X"0000",

-- L0029@028E 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
654 => X"0001",

-- L0030@028F 0000.  data16 =  0;
--  data16 = 0000000000000000;
655 => X"0000",

-- L0032@0290 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
656 => X"0052",

-- L0033@0291 0065.  data16 =  'e';
--  data16 = 0000000001100101;
657 => X"0065",

-- L0034@0292 0061.  data16 =  'a';
--  data16 = 0000000001100001;
658 => X"0061",

-- L0035@0293 0064.  data16 =  'd';
--  data16 = 0000000001100100;
659 => X"0064",

-- L0036@0294 0079.  data16 =  'y';
--  data16 = 0000000001111001;
660 => X"0079",

-- L0037@0295 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
661 => X"002E",

-- L0038@0296 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
662 => X"000D",

-- L0039@0297 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
663 => X"000A",

-- L0040@0298 0000.  data16 =  0;
--  data16 = 0000000000000000;
664 => X"0000",

-- L0042@0299 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
665 => X"0030",

-- L0043@029A 0031.  data16 =  '1';
--  data16 = 0000000000110001;
666 => X"0031",

-- L0044@029B 0032.  data16 =  '2';
--  data16 = 0000000000110010;
667 => X"0032",

-- L0045@029C 0033.  data16 =  '3';
--  data16 = 0000000000110011;
668 => X"0033",

-- L0046@029D 0034.  data16 =  '4';
--  data16 = 0000000000110100;
669 => X"0034",

-- L0047@029E 0035.  data16 =  '5';
--  data16 = 0000000000110101;
670 => X"0035",

-- L0048@029F 0036.  data16 =  '6';
--  data16 = 0000000000110110;
671 => X"0036",

-- L0049@02A0 0037.  data16 =  '7';
--  data16 = 0000000000110111;
672 => X"0037",

-- L0050@02A1 0038.  data16 =  '8';
--  data16 = 0000000000111000;
673 => X"0038",

-- L0051@02A2 0039.  data16 =  '9';
--  data16 = 0000000000111001;
674 => X"0039",

-- L0052@02A3 0041.  data16 =  'A';
--  data16 = 0000000001000001;
675 => X"0041",

-- L0053@02A4 0042.  data16 =  'B';
--  data16 = 0000000001000010;
676 => X"0042",

-- L0054@02A5 0043.  data16 =  'C';
--  data16 = 0000000001000011;
677 => X"0043",

-- L0055@02A6 0044.  data16 =  'D';
--  data16 = 0000000001000100;
678 => X"0044",

-- L0056@02A7 0045.  data16 =  'E';
--  data16 = 0000000001000101;
679 => X"0045",

-- L0057@02A8 0046.  data16 =  'F';
--  data16 = 0000000001000110;
680 => X"0046",

-- 3419 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02A9 .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end monitor_code;

