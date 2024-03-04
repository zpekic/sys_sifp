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

-- L0035@000E 024D.  data16 = !$ + 1 + @ GetOldCrsXY;
--  data16 = 0000001001001101;
14 => X"024D",

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

-- L0040@0013 0259.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001011001;
19 => X"0259",

-- L0041@0014 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
20 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0042@0015 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0043@0016 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
22 => X"FF7F",

-- L0044@0017 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
23 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0045@0018 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
24 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0046@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0047@001A 0249.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001001001001;
26 => X"0249",

-- L0048@001B 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
27 => X"0" & O"0" & O"1" & O"0" & O"2",

-- L0049@001C 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
28 => X"0" & O"0" & O"0" & O"1" & O"2",

-- L0050@001D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0051@001E 0003.  data16 = !$ + 1 + @ CheckY;
--  data16 = 0000000000000011;
30 => X"0003",

-- L0052@001F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
31 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0053@0020 0003.  data16 = !$ + 1 + @ NoFlip;
--  data16 = 0000000000000011;
32 => X"0003",

-- L0054@0021 D000.CheckY:  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
33 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0055@0022 0006.  data16 = !$ + 1 + @ Flip;
--  data16 = 0000000000000110;
34 => X"0006",

-- L0056@0023 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
35 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0057@0024 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
36 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0058@0025 01C9.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000111001001;
37 => X"01C9",

-- L0059@0026 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
38 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0060@0027 000B.  data16 = !$ + 1 + @ IntExit;
--  data16 = 0000000000001011;
39 => X"000B",

-- L0062@0028 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
40 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0063@0029 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
41 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0064@002A 0239.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000111001;
42 => X"0239",

-- L0065@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0066@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0067@002D 023F.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001000111111;
45 => X"023F",

-- L0068@002E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
46 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0069@002F 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
47 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0070@0030 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
48 => X"0080",

-- L0071@0031 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
49 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0073@0032 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
50 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0074@0033 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
51 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0075@0034 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0076@0035 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0076@0036 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
54 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0079@0037 6003.Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
55 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0080@0038 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0081@0039 015C.  data16 = !$ + 1 + @ VGA_Init;
--  data16 = 0000000101011100;
57 => X"015C",

-- L0083@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0084@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0085@003C 00FC.  data16 = !$ + 1 + @ UART_Init;
--  data16 = 0000000011111100;
60 => X"00FC",

-- L0088@003D 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0089@003E 6003.PrintLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0090@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0091@0040 0101.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000100000001;
64 => X"0101",

-- L0092@0041 6003.PrintLoop1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0093@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0094@0043 00CA.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000011001010;
67 => X"00CA",

-- L0095@0044 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0096@0045 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
69 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0097@0046 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
70 => X"0003",

-- L0098@0047 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
71 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0099@0048 000C.  data16 = !$ + 1 + @ Continue;
--  data16 = 0000000000001100;
72 => X"000C",

-- L0100@0049 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
73 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0101@004A 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
74 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0102@004B 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
75 => X"000D",

-- L0103@004C 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0104@004D 0003.  data16 = !$ + 1 + @ PrintLF;
--  data16 = 0000000000000011;
77 => X"0003",

-- L0105@004E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
78 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0106@004F FFEF.  data16 = !$ + 1 + @ PrintLoop;
--  data16 = 1111111111101111;
79 => X"FFEF",

-- L0107@0050 1800.PrintLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
80 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0108@0051 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
81 => X"000A",

-- L0109@0052 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
82 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0110@0053 FFEE.  data16 = !$ + 1 + @ PrintLoop1;
--  data16 = 1111111111101110;
83 => X"FFEE",

-- L0112@0054 0802.Continue:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
84 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0113@0055 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
85 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0114@0056 0295.  data16 =  @StrReady;
--  data16 = 0000001010010101;
86 => X"0295",

-- L0115@0057 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
87 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0116@0058 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0117@0059 00B4.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000010110100;
89 => X"00B4",

-- L0119@005A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
90 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0120@005B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@005C 0207.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000000111;
92 => X"0207",

-- L0122@005D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
93 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0123@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0124@005F 018F.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000110001111;
95 => X"018F",

-- L0126@0060 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
96 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0127@0061 89AB.  data16 =  0x89AB;
--  data16 = 1000100110101011;
97 => X"89AB",

-- L0128@0062 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
98 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0129@0063 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
99 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0130@0064 00B0.  data16 = !$ + 1 + @ PrintHex;
--  data16 = 0000000010110000;
100 => X"00B0",

-- L0132@0065 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
101 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0137@0066 1020.MainLoop:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
102 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0138@0067 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
103 => X"FF40",

-- L0141@0068 0900.  r_p = NOP, r_a = LDA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 100, r_y = 000, r_s = 000;
104 => X"0" & O"4" & O"4" & O"0" & O"0",

-- L0142@0069 0FB0.TxtClear:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
105 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0143@006A 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
106 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0144@006B 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
107 => X"0010",

-- L0145@006C A000.  IF_XC;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
108 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0146@006D 0003.  data16 = !$ + 1 + @ TxtCleared;
--  data16 = 0000000000000011;
109 => X"0003",

-- L0147@006E 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
110 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0148@006F FFFA.  data16 = !$ + 1 + @ TxtClear;
--  data16 = 1111111111111010;
111 => X"FFFA",

-- L0150@0070 0100.TxtCleared:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
112 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0152@0071 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
113 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0153@0072 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
114 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0154@0073 002B.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 0000000000101011;
115 => X"002B",

-- L0155@0074 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
116 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0156@0075 0014.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000010100;
117 => X"0014",

-- L0159@0076 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
118 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0160@0077 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
119 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0161@0078 008C.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000010001100;
120 => X"008C",

-- L0164@0079 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
121 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0165@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0166@007B 0005.  data16 = !$ + 1 + @ CmdExec;
--  data16 = 0000000000000101;
123 => X"0005",

-- L0167@007C 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
124 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0168@007D 000C.  data16 = !$ + 1 + @ ErrOrBrk;
--  data16 = 0000000000001100;
125 => X"000C",

-- L0171@007E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0172@007F FFE7.  data16 = !$ + 1 + @ MainLoop;
--  data16 = 1111111111100111;
127 => X"FFE7",

-- L0177@0080 6003.CmdExec:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
128 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0178@0081 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0179@0082 00D2.  data16 = !$ + 1 + @ UART_IsBrk;
--  data16 = 0000000011010010;
130 => X"00D2",

-- L0180@0083 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0181@0084 0004.  data16 = !$ + 1 + @ CmdBreak;
--  data16 = 0000000000000100;
132 => X"0004",

-- L0182@0085 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
133 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0183@0086 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
134 => X"FFFF",

-- L0184@0087 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
135 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0185@0088 4002.CmdBreak:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
136 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0187@0089 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
137 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0188@008A 027C.  data16 =  @StrBreak;
--  data16 = 0000001001111100;
138 => X"027C",

-- L0189@008B 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
139 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0190@008C 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
140 => X"0003",

-- L0191@008D 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
141 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0192@008E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0193@008F 0075.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001110101;
143 => X"0075",

-- L0194@0090 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
144 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0195@0091 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
145 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0196@0092 0286.  data16 =  @StrError;
--  data16 = 0000001010000110;
146 => X"0286",

-- L0197@0093 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
147 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0198@0094 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0199@0095 006F.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101111;
149 => X"006F",

-- L0200@0096 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
150 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0201@0097 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
151 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0202@0098 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
152 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0203@0099 FF66.  data16 = !$ + 1 + @ PrintHexA;
--  data16 = 1111111101100110;
153 => X"FF66",

-- L0204@009A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
154 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0205@009B 029B.  data16 =  @StrEnd;
--  data16 = 0000001010011011;
155 => X"029B",

-- L0206@009C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0207@009D 0067.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001100111;
157 => X"0067",

-- L0209@009E 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
158 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0210@009F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0211@00A0 00A1.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000010100001;
160 => X"00A1",

-- L0212@00A1 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
161 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0214@00A2 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
162 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0215@00A3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
163 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0216@00A4 0069.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000001101001;
164 => X"0069",

-- L0218@00A5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
165 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0219@00A6 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
166 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0220@00A7 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
167 => X"000D",

-- L0221@00A8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
168 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0222@00A9 0026.  data16 = !$ + 1 + @ LeaveEdit;
--  data16 = 0000000000100110;
169 => X"0026",

-- L0224@00AA 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
170 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0225@00AB 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
171 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0226@00AC 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
172 => X"0003",

-- L0227@00AD 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0228@00AE 001A.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000011010;
174 => X"001A",

-- L0230@00AF 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
175 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0231@00B0 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
176 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0232@00B1 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
177 => X"0001",

-- L0233@00B2 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0234@00B3 0015.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010101;
179 => X"0015",

-- L0236@00B4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
180 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0237@00B5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
181 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0238@00B6 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
182 => X"0002",

-- L0239@00B7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0240@00B8 0010.  data16 = !$ + 1 + @ BrkEdit;
--  data16 = 0000000000010000;
184 => X"0010",

-- L0242@00B9 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
185 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0243@00BA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
186 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0244@00BB 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
187 => X"0008",

-- L0245@00BC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0246@00BD 0018.  data16 = !$ + 1 + @ BSEdit;
--  data16 = 0000000000011000;
189 => X"0018",

-- L0249@00BE 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
190 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0250@00BF 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
191 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0251@00C0 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
192 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0252@00C1 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
193 => X"0010",

-- L0253@00C2 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
194 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0254@00C3 0025.  data16 = !$ + 1 + @ BumpEnd;
--  data16 = 0000000000100101;
195 => X"0025",

-- L0255@00C4 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
196 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0256@00C5 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
197 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0257@00C6 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
198 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0258@00C7 FFD7.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111010111;
199 => X"FFD7",

-- L0261@00C8 0802.BrkEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
200 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0262@00C9 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
201 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0263@00CA 0001.  data16 =  1;
--  data16 = 0000000000000001;
202 => X"0001",

-- L0264@00CB 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
203 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0265@00CC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
204 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0266@00CD 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
205 => X"0003",

-- L0267@00CE 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
206 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0270@00CF 0802.LeaveEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
207 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0271@00D0 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
208 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0272@00D1 0000.  data16 =  0;
--  data16 = 0000000000000000;
209 => X"0000",

-- L0273@00D2 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
210 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0274@00D3 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
211 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0275@00D4 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
212 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0278@00D5 0802.BSEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
213 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0279@00D6 0800.  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
214 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0280@00D7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
215 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0281@00D8 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
216 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0282@00D9 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
217 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0283@00DA 0003.  data16 = !$ + 1 + @ BumpStart;
--  data16 = 0000000000000011;
218 => X"0003",

-- L0284@00DB 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
219 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0285@00DC FFC2.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111000010;
220 => X"FFC2",

-- L0287@00DD 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
221 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0288@00DE 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
222 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0289@00DF 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
223 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0290@00E0 028E.  data16 =  @StrBeep;
--  data16 = 0000001010001110;
224 => X"028E",

-- L0291@00E1 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
225 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0292@00E2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
226 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0293@00E3 0021.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000000100001;
227 => X"0021",

-- L0294@00E4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
228 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0295@00E5 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
229 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0296@00E6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0297@00E7 FFB7.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111110110111;
231 => X"FFB7",

-- L0299@00E8 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
232 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0300@00E9 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
233 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0301@00EA 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
234 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0302@00EB 0290.  data16 =  @StrBack;
--  data16 = 0000001010010000;
235 => X"0290",

-- L0303@00EC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
236 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0304@00ED FFF4.  data16 = !$ + 1 + @ Bumped;
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

-- L0019@00FA 1C00.ToUpper:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
250 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0020@00FB 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
251 => X"00FF",

-- L0021@00FC 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
252 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0022@00FD 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
253 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0023@00FE 0061.  data16 =  'a';
--  data16 = 0000000001100001;
254 => X"0061",

-- L0024@00FF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
255 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0024@0100 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
256 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0024@0101 FFF2.  data16 = !$ + 1 + @  SEC;
--  data16 = 1111111111110010;
257 => X"FFF2",

-- L0025@0102 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
258 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0026@0103 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
259 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@0104 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
260 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0029@0105 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
261 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0030@0106 0006.  data16 = !$ + 1 + @ PrintDone;
--  data16 = 0000000000000110;
262 => X"0006",

-- L0031@0107 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
263 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0032@0108 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
264 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0033@0109 0004.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000000000100;
265 => X"0004",

-- L0034@010A 2010.  INY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
266 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0035@010B FFF9.  data16 = !$ + 1 + @ Print;
--  data16 = 1111111111111001;
267 => X"FFF9",

-- L0036@010C 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
268 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0038@010D 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
269 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0039@010E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
270 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0040@010F 00A1.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 0000000010100001;
271 => X"00A1",

-- L0041@0110 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
272 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0042@0111 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
273 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0043@0112 0060.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 0000000001100000;
274 => X"0060",

-- L0044@0113 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
275 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0046@0114 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
276 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0047@0115 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
277 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0048@0116 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
278 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0049@0117 029E.  data16 = @ StrHex;
--  data16 = 0000001010011110;
279 => X"029E",

-- L0051@0118 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
280 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0052@0119 000C.  data16 =  12;
--  data16 = 0000000000001100;
281 => X"000C",

-- L0053@011A 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
282 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0054@011B 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
283 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0056@011C 1040.SrcLoopX:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
284 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0057@011D 0000.  data16 =  0;
--  data16 = 0000000000000000;
285 => X"0000",

-- L0058@011E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
286 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0059@011F 0003.  data16 = !$ + 1 + @ PrintNib;
--  data16 = 0000000000000011;
287 => X"0003",

-- L0060@0120 26C0.  DEX, RRC, BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
288 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0061@0121 FFFB.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111111011;
289 => X"FFFB",

-- L0063@0122 1C00.PrintNib:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
290 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0064@0123 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
291 => X"000F",

-- L0065@0124 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
292 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0066@0125 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
293 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0067@0126 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
294 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0068@0127 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
295 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0069@0128 FFE5.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 1111111111100101;
296 => X"FFE5",

-- L0071@0129 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
297 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0072@012A 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
298 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0073@012B B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
299 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0074@012C 0009.  data16 = !$ + 1 + @ PrintHexEx;
--  data16 = 0000000000001001;
300 => X"0009",

-- L0075@012D 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
301 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0076@012E 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
302 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0077@012F 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
303 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0078@0130 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
304 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0079@0131 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
305 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0080@0132 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
306 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0081@0133 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
307 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0082@0134 FFE8.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111101000;
308 => X"FFE8",

-- L0084@0135 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
309 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0085@0136 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
310 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0086@0137 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
311 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0138 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
312 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0139 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
313 => X"2000",

-- L0004@013A 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
314 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@013B 0003.  data16 =  3;
--  data16 = 0000000000000011;
315 => X"0003",

-- L0006@013C 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
316 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@013D 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
317 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@013E 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
318 => X"0010",

-- L0009@013F 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
319 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@0140 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
320 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@0141 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
321 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0013@0142 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
322 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0014@0143 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
323 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0015@0144 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
324 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0016@0145 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
325 => X"2000",

-- L0017@0146 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
326 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0018@0147 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
327 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0019@0148 0039.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000111001;
328 => X"0039",

-- L0020@0149 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
329 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0021@014A 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
330 => X"0001",

-- L0022@014B 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
331 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@014C FFFA.  data16 = !$ + 1 + @ RdStatus0;
--  data16 = 1111111111111010;
332 => X"FFFA",

-- L0024@014D 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
333 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0025@014E 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
334 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@014F 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
335 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0027@0150 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
336 => X"00FF",

-- L0028@0151 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
337 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0029@0152 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
338 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0030@0153 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
339 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@0154 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
340 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0033@0155 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
341 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0034@0156 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
342 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0035@0157 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
343 => X"2000",

-- L0036@0158 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
344 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0037@0159 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
345 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@015A 0027.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000100111;
346 => X"0027",

-- L0039@015B 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
347 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0040@015C 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
348 => X"0001",

-- L0041@015D 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
349 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0042@015E 0009.  data16 = !$ + 1 + @ NoBrk;
--  data16 = 0000000000001001;
350 => X"0009",

-- L0044@015F 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
351 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0045@0160 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
352 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0046@0161 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
353 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0047@0162 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
354 => X"00FF",

-- L0048@0163 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
355 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0049@0164 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
356 => X"0003",

-- L0050@0165 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
357 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0051@0166 0004.  data16 = !$ + 1 + @ Brk;
--  data16 = 0000000000000100;
358 => X"0004",

-- L0053@0167 0800.NoBrk:  r_p = NOP, r_a = LDA, r_x = NOX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
359 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0054@0168 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
360 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0055@0169 0004.  data16 = !$ + 1 + @ BrkExit;
--  data16 = 0000000000000100;
361 => X"0004",

-- L0056@016A 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
362 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0057@016B 0001.  data16 =  1;
--  data16 = 0000000000000001;
363 => X"0001",

-- L0058@016C 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
364 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0059@016D 0022.BrkExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
365 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0060@016E 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
366 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0061@016F 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
367 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0063@0170 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
368 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0064@0171 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
369 => X"0007",

-- L0065@0172 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
370 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0066@0173 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
371 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0067@0174 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
372 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0068@0175 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
373 => X"2000",

-- L0069@0176 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
374 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0070@0177 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
375 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0071@0178 0009.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000001001;
376 => X"0009",

-- L0072@0179 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
377 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0073@017A 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
378 => X"0002",

-- L0074@017B 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
379 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0075@017C FFFA.  data16 = !$ + 1 + @ RdStatus1;
--  data16 = 1111111111111010;
380 => X"FFFA",

-- L0076@017D 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
381 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0077@017E 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
382 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0078@017F 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
383 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0079@0180 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
384 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0081@0181 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
385 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0082@0182 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
386 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0083@0183 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
387 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0084@0184 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
388 => X"0" & O"2" & O"0" & O"0" & O"6",

-- L0085@0185 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
389 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0086@0186 0004.  data16 = !$ + 1 + @ StIsStable;
--  data16 = 0000000000000100;
390 => X"0004",

-- L0087@0187 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
391 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0088@0188 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
392 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0089@0189 FFF8.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 1111111111111000;
393 => X"FFF8",

-- L0090@018A 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
394 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0091@018B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
395 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0093@018C 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
396 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0094@018D 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
397 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0095@018E 0006.  data16 = !$ + 1 + @ UART_Done;
--  data16 = 0000000000000110;
398 => X"0006",

-- L0096@018F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
399 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0097@0190 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
400 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@0191 FFE1.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 1111111111100001;
401 => X"FFE1",

-- L0099@0192 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
402 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0100@0193 FFF9.  data16 = !$ + 1 + @ UART_OutStr;
--  data16 = 1111111111111001;
403 => X"FFF9",

-- L0101@0194 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
404 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@0195 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
405 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0010@0196 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
406 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@0197 FF57.  data16 = !$ + 1 + @  CLC;
--  data16 = 1111111101010111;
407 => X"FF57",

-- L0011@0198 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
408 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0012@0199 0040.  data16 =  64;
--  data16 = 0000000001000000;
409 => X"0040",

-- L0013@019A 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
410 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@019B 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
411 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@019C 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
412 => X"1000",

-- L0016@019D 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
413 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0017@019E 0020.  data16 =  32;
--  data16 = 0000000000100000;
414 => X"0020",

-- L0018@019F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
415 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0019@01A0 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
416 => X"FF00",

-- L0020@01A1 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
417 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0021@01A2 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
418 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0022@01A3 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
419 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0023@01A4 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
420 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0024@01A5 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
421 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0025@01A6 0003.  data16 = !$ + 1 + @ RowOffDone;
--  data16 = 0000000000000011;
422 => X"0003",

-- L0026@01A7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
423 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0027@01A8 FFFA.  data16 = !$ + 1 + @ RowOffLoop;
--  data16 = 1111111111111010;
424 => X"FFFA",

-- L0028@01A9 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
425 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0029@01AA 0120.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
426 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0030@01AB 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
427 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0031@01AC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
428 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0032@01AD 0041.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000001000001;
429 => X"0041",

-- L0033@01AE 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
430 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0034@01AF 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
431 => X"0001",

-- L0038@01B0 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
432 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@01B1 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
433 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0040@01B2 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
434 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0042@01B3 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
435 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0043@01B4 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
436 => X"0002",

-- L0044@01B5 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
437 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0045@01B6 00A1.  data16 = !$ + 1 + @ VGA_HOME;
--  data16 = 0000000010100001;
438 => X"00A1",

-- L0047@01B7 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
439 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0048@01B8 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
440 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0049@01B9 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
441 => X"0001",

-- L0050@01BA 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
442 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0051@01BB 007F.  data16 = !$ + 1 + @ VGA_CLS;
--  data16 = 0000000001111111;
443 => X"007F",

-- L0053@01BC 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
444 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0054@01BD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
445 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0055@01BE 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
446 => X"0007",

-- L0056@01BF 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
447 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0057@01C0 002A.  data16 = !$ + 1 + @ VGA_Ignore;
--  data16 = 0000000000101010;
448 => X"002A",

-- L0059@01C1 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
449 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0060@01C2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
450 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0061@01C3 00A0.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000000010100000;
451 => X"00A0",

-- L0063@01C4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
452 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0064@01C5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
453 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0065@01C6 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
454 => X"000D",

-- L0066@01C7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
455 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0067@01C8 005C.  data16 = !$ + 1 + @ VGA_CR;
--  data16 = 0000000001011100;
456 => X"005C",

-- L0069@01C9 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
457 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0070@01CA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
458 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0071@01CB 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
459 => X"000A",

-- L0072@01CC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
460 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0073@01CD 006A.  data16 = !$ + 1 + @ VGA_LF;
--  data16 = 0000000001101010;
461 => X"006A",

-- L0075@01CE 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
462 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0076@01CF 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
463 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0077@01D0 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
464 => X"0008",

-- L0078@01D1 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
465 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0079@01D2 0057.  data16 = !$ + 1 + @ VGA_BS;
--  data16 = 0000000001010111;
466 => X"0057",

-- L0082@01D3 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
467 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0084@01D4 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
468 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0085@01D5 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
469 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0086@01D6 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
470 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0087@01D7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
471 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0088@01D8 0094.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000010010100;
472 => X"0094",

-- L0089@01D9 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
473 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0090@01DA 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
474 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0091@01DB 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
475 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0092@01DC 0040.  data16 =  64;
--  data16 = 0000000001000000;
476 => X"0040",

-- L0093@01DD A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
477 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0094@01DE 0019.  data16 = !$ + 1 + @ NextRow;
--  data16 = 0000000000011001;
478 => X"0019",

-- L0095@01DF 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
479 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0096@01E0 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
480 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0097@01E1 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
481 => X"FF3E",

-- L0098@01E2 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
482 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0099@01E3 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
483 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0100@01E4 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
484 => X"FF3F",

-- L0101@01E5 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
485 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0102@01E6 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
486 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0104@01E7 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
487 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0105@01E8 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
488 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0106@01E9 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
489 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0108@01EA 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
490 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0109@01EB 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
491 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0110@01EC 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
492 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0111@01ED 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
493 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0113@01EE 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
494 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0114@01EF 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
495 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0115@01F0 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
496 => X"FF3C",

-- L0116@01F1 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
497 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0117@01F2 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
498 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0118@01F3 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
499 => X"FF3D",

-- L0119@01F4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
500 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0120@01F5 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
501 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0121@01F6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
502 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0123@01F7 0100.NextRow:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
503 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0124@01F8 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
504 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0125@01F9 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
505 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0126@01FA 0020.  data16 =  32;
--  data16 = 0000000000100000;
506 => X"0020",

-- L0127@01FB C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
507 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0128@01FC 0003.  data16 = !$ + 1 + @ ScrollUp;
--  data16 = 0000000000000011;
508 => X"0003",

-- L0129@01FD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
509 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0130@01FE FFE1.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111111100001;
510 => X"FFE1",

-- L0132@01FF 0020.ScrollUp:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
511 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0133@0200 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
512 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0134@0201 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
513 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0135@0202 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
514 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0136@0203 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
515 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0137@0204 0068.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000001101000;
516 => X"0068",

-- L0138@0205 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
517 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0139@0206 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
518 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0140@0207 0040.  data16 =  64;
--  data16 = 0000000001000000;
519 => X"0040",

-- L0141@0208 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
520 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0142@0209 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
521 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0143@020A 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
522 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0144@020B 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
523 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0145@020C 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
524 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0146@020D 0040.  data16 =  64;
--  data16 = 0000000001000000;
525 => X"0040",

-- L0147@020E A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
526 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0148@020F 0003.  data16 = !$ + 1 + @ ChkRow;
--  data16 = 0000000000000011;
527 => X"0003",

-- L0149@0210 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
528 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0150@0211 FFF4.  data16 = !$ + 1 + @ NxtCol;
--  data16 = 1111111111110100;
529 => X"FFF4",

-- L0151@0212 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
530 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0152@0213 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
531 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0153@0214 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
532 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0154@0215 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
533 => X"001F",

-- L0155@0216 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
534 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0156@0217 0003.  data16 = !$ + 1 + @ ClrLastRow;
--  data16 = 0000000000000011;
535 => X"0003",

-- L0157@0218 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
536 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0158@0219 FFE7.  data16 = !$ + 1 + @ NxtRow;
--  data16 = 1111111111100111;
537 => X"FFE7",

-- L0160@021A 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
538 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0161@021B 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
539 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0162@021C 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
540 => X"001F",

-- L0163@021D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
541 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0164@021E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
542 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0165@021F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
543 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0166@0220 002A.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000101010;
544 => X"002A",

-- L0167@0221 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
545 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0168@0222 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
546 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0169@0223 0002.  data16 = !$ + 1 + @ SetX0;
--  data16 = 0000000000000010;
547 => X"0002",

-- L0171@0224 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
548 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0172@0225 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
549 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0173@0226 0000.  data16 =  0;
--  data16 = 0000000000000000;
550 => X"0000",

-- L0174@0227 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
551 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0175@0228 FFB7.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110111;
552 => X"FFB7",

-- L0177@0229 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
553 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0178@022A 0100.  r_p = NOP, r_a = NOA, r_x = LDX, r_y = NOY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
554 => X"0" & O"0" & O"4" & O"0" & O"0",

-- L0179@022B B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
555 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0180@022C 0003.  data16 = !$ + 1 + @ PrevRow;
--  data16 = 0000000000000011;
556 => X"0003",

-- L0181@022D 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
557 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0182@022E FFB1.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110001;
558 => X"FFB1",

-- L0183@022F 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
559 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0184@0230 0000.  data16 =  0;
--  data16 = 0000000000000000;
560 => X"0000",

-- L0185@0231 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
561 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0186@0232 FFAD.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101101;
562 => X"FFAD",

-- L0187@0233 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
563 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0188@0234 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
564 => X"003F",

-- L0189@0235 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
565 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0190@0236 FFA9.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101001;
566 => X"FFA9",

-- L0192@0237 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
567 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0193@0238 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
568 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0194@0239 FFBF.  data16 = !$ + 1 + @ NextRow1;
--  data16 = 1111111110111111;
569 => X"FFBF",

-- L0196@023A 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
570 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0197@023B 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
571 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0198@023C 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
572 => X"0020",

-- L0199@023D 0020.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
573 => X"0" & O"0" & O"0" & O"4" & O"0",

-- L0200@023E 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
574 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0201@023F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
575 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0202@0240 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
576 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0203@0241 0009.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000001001;
577 => X"0009",

-- L0204@0242 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
578 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0205@0243 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
579 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0206@0244 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
580 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0207@0245 0020.  data16 =  32;
--  data16 = 0000000000100000;
581 => X"0020",

-- L0208@0246 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
582 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0209@0247 0011.  data16 = !$ + 1 + @ vga_home1;
--  data16 = 0000000000010001;
583 => X"0011",

-- L0210@0248 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
584 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0211@0249 FFF5.  data16 = !$ + 1 + @ ClrNextRow;
--  data16 = 1111111111110101;
585 => X"FFF5",

-- L0213@024A 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
586 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0214@024B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
587 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0215@024C 0020.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000000100000;
588 => X"0020",

-- L0216@024D 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
589 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0217@024E 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
590 => X"0020",

-- L0218@024F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
591 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0219@0250 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
592 => X"0007",

-- L0220@0251 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
593 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0221@0252 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
594 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0222@0253 0003.  data16 = !$ + 1 + @ ClrDone;
--  data16 = 0000000000000011;
595 => X"0003",

-- L0223@0254 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
596 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0224@0255 FFFC.  data16 = !$ + 1 + @ ClrRLoop;
--  data16 = 1111111111111100;
597 => X"FFFC",

-- L0225@0256 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
598 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0227@0257 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
599 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0228@0258 0120.vga_home1:  r_p = NOP, r_a = NOA, r_x = LDX, r_y = LDY, r_s = NOS;
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
600 => X"0" & O"0" & O"4" & O"4" & O"0",

-- L0229@0259 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
601 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0230@025A FF85.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110000101;
602 => X"FF85",

-- L0232@025B 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
603 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0233@025C FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
604 => X"FF3C",

-- L0234@025D 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
605 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0235@025E 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
606 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0236@025F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
607 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0237@0260 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
608 => X"FF3D",

-- L0238@0261 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
609 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0239@0262 0007.  data16 = !$ + 1 + @ GetCursorY;
--  data16 = 0000000000000111;
610 => X"0007",

-- L0241@0263 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
611 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0242@0264 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
612 => X"FF3E",

-- L0243@0265 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
613 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0244@0266 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
614 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0245@0267 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
615 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0246@0268 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
616 => X"FF3F",

-- L0247@0269 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
617 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0248@026A 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
618 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0249@026B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
619 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0251@026C 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
620 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0252@026D 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
621 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0253@026E FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
622 => X"FF00",

-- L0254@026F 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
623 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0255@0270 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
624 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0256@0271 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
625 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0257@0272 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
626 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0259@0273 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
627 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0260@0274 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
628 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0261@0275 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
629 => X"0006",

-- L0262@0276 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
630 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0263@0277 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
631 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0264@0278 FF38.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 1111111100111000;
632 => X"FF38",

-- L0265@0279 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
633 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0266@027A FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
634 => X"FFF9",

-- L0267@027B 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
635 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@027C 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
636 => X"000D",

-- L0004@027D 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
637 => X"000A",

-- L0005@027E 002A.  data16 =  '*';
--  data16 = 0000000000101010;
638 => X"002A",

-- L0006@027F 0042.  data16 =  'B';
--  data16 = 0000000001000010;
639 => X"0042",

-- L0007@0280 0052.  data16 =  'R';
--  data16 = 0000000001010010;
640 => X"0052",

-- L0008@0281 0045.  data16 =  'E';
--  data16 = 0000000001000101;
641 => X"0045",

-- L0009@0282 0041.  data16 =  'A';
--  data16 = 0000000001000001;
642 => X"0041",

-- L0010@0283 004B.  data16 =  'K';
--  data16 = 0000000001001011;
643 => X"004B",

-- L0011@0284 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
644 => X"0007",

-- L0012@0285 0000.  data16 =  0;
--  data16 = 0000000000000000;
645 => X"0000",

-- L0014@0286 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
646 => X"000D",

-- L0015@0287 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
647 => X"000A",

-- L0016@0288 002A.  data16 =  '*';
--  data16 = 0000000000101010;
648 => X"002A",

-- L0017@0289 0045.  data16 =  'E';
--  data16 = 0000000001000101;
649 => X"0045",

-- L0018@028A 0052.  data16 =  'R';
--  data16 = 0000000001010010;
650 => X"0052",

-- L0019@028B 0052.  data16 =  'R';
--  data16 = 0000000001010010;
651 => X"0052",

-- L0020@028C 004F.  data16 =  'O';
--  data16 = 0000000001001111;
652 => X"004F",

-- L0021@028D 0052.  data16 =  'R';
--  data16 = 0000000001010010;
653 => X"0052",

-- L0022@028E 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
654 => X"0007",

-- L0023@028F 0000.  data16 =  0;
--  data16 = 0000000000000000;
655 => X"0000",

-- L0025@0290 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
656 => X"0008",

-- L0026@0291 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
657 => X"0007",

-- L0027@0292 0000.  data16 =  0;
--  data16 = 0000000000000000;
658 => X"0000",

-- L0029@0293 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
659 => X"0001",

-- L0030@0294 0000.  data16 =  0;
--  data16 = 0000000000000000;
660 => X"0000",

-- L0032@0295 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
661 => X"0052",

-- L0033@0296 0065.  data16 =  'e';
--  data16 = 0000000001100101;
662 => X"0065",

-- L0034@0297 0061.  data16 =  'a';
--  data16 = 0000000001100001;
663 => X"0061",

-- L0035@0298 0064.  data16 =  'd';
--  data16 = 0000000001100100;
664 => X"0064",

-- L0036@0299 0079.  data16 =  'y';
--  data16 = 0000000001111001;
665 => X"0079",

-- L0037@029A 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
666 => X"002E",

-- L0038@029B 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
667 => X"000D",

-- L0039@029C 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
668 => X"000A",

-- L0040@029D 0000.  data16 =  0;
--  data16 = 0000000000000000;
669 => X"0000",

-- L0042@029E 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
670 => X"0030",

-- L0043@029F 0031.  data16 =  '1';
--  data16 = 0000000000110001;
671 => X"0031",

-- L0044@02A0 0032.  data16 =  '2';
--  data16 = 0000000000110010;
672 => X"0032",

-- L0045@02A1 0033.  data16 =  '3';
--  data16 = 0000000000110011;
673 => X"0033",

-- L0046@02A2 0034.  data16 =  '4';
--  data16 = 0000000000110100;
674 => X"0034",

-- L0047@02A3 0035.  data16 =  '5';
--  data16 = 0000000000110101;
675 => X"0035",

-- L0048@02A4 0036.  data16 =  '6';
--  data16 = 0000000000110110;
676 => X"0036",

-- L0049@02A5 0037.  data16 =  '7';
--  data16 = 0000000000110111;
677 => X"0037",

-- L0050@02A6 0038.  data16 =  '8';
--  data16 = 0000000000111000;
678 => X"0038",

-- L0051@02A7 0039.  data16 =  '9';
--  data16 = 0000000000111001;
679 => X"0039",

-- L0052@02A8 0041.  data16 =  'A';
--  data16 = 0000000001000001;
680 => X"0041",

-- L0053@02A9 0042.  data16 =  'B';
--  data16 = 0000000001000010;
681 => X"0042",

-- L0054@02AA 0043.  data16 =  'C';
--  data16 = 0000000001000011;
682 => X"0043",

-- L0055@02AB 0044.  data16 =  'D';
--  data16 = 0000000001000100;
683 => X"0044",

-- L0056@02AC 0045.  data16 =  'E';
--  data16 = 0000000001000101;
684 => X"0045",

-- L0057@02AD 0046.  data16 =  'F';
--  data16 = 0000000001000110;
685 => X"0046",

-- 3414 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02AE .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end monitor_code;

