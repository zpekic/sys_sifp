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

-- L0036@000E 0250.  data16 = !$ + 1 + @ GetOldCrsXY;
--  data16 = 0000001001010000;
14 => X"0250",

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

-- L0041@0013 025C.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001011100;
19 => X"025C",

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

-- L0048@001A 024C.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001001001100;
26 => X"024C",

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

-- L0059@0025 01C6.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000111000110;
37 => X"01C6",

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

-- L0065@002A 023C.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000111100;
42 => X"023C",

-- L0066@002B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
43 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0067@002C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
44 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0068@002D 0242.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000001001000010;
45 => X"0242",

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

-- L0083@0039 0158.  data16 = !$ + 1 + @ VGA_Init;
--  data16 = 0000000101011000;
57 => X"0158",

-- L0085@003A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
58 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0086@003B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0087@003C 00F7.  data16 = !$ + 1 + @ UART_Init;
--  data16 = 0000000011110111;
60 => X"00F7",

-- L0090@003D 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
61 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0091@003E 6003.PrintLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
62 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0092@003F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
63 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0093@0040 00FC.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000011111100;
64 => X"00FC",

-- L0094@0041 6003.PrintLoop1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
65 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0095@0042 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
66 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@0043 00C5.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000011000101;
67 => X"00C5",

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

-- L0116@0056 0298.  data16 =  @StrReady;
--  data16 = 0000001010011000;
86 => X"0298",

-- L0117@0057 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
87 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0118@0058 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0119@0059 00AF.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000010101111;
89 => X"00AF",

-- L0121@005A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
90 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0122@005B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
91 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@005C 020A.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000001000001010;
92 => X"020A",

-- L0124@005D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
93 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0125@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0126@005F 018C.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000110001100;
95 => X"018C",

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

-- L0132@0064 00AB.  data16 = !$ + 1 + @ PrintHex;
--  data16 = 0000000010101011;
100 => X"00AB",

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

-- L0165@007A 0085.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000010000101;
122 => X"0085",

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

-- L0183@0084 00CB.  data16 = !$ + 1 + @ UART_IsBrk;
--  data16 = 0000000011001011;
132 => X"00CB",

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

-- L0188@0089 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
137 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0189@008A 4002.CmdBreak:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
138 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0191@008B 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
139 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0192@008C 027F.  data16 =  @StrBreak;
--  data16 = 0000001001111111;
140 => X"027F",

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

-- L0197@0091 006E.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101110;
145 => X"006E",

-- L0198@0092 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
146 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0199@0093 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
147 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0200@0094 0289.  data16 =  @StrError;
--  data16 = 0000001010001001;
148 => X"0289",

-- L0201@0095 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
149 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0202@0096 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0203@0097 0068.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001101000;
151 => X"0068",

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

-- L0209@009D 029E.  data16 =  @StrEnd;
--  data16 = 0000001010011110;
157 => X"029E",

-- L0210@009E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0211@009F 0060.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000001100000;
159 => X"0060",

-- L0213@00A0 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
160 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0214@00A1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
161 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0215@00A2 009A.  data16 = !$ + 1 + @ UART_GetChr;
--  data16 = 0000000010011010;
162 => X"009A",

-- L0216@00A3 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
163 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0218@00A4 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
164 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0219@00A5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
165 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0220@00A6 0062.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000001100010;
166 => X"0062",

-- L0222@00A7 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
167 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0223@00A8 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
168 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0229@00AD 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
173 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0235@00B2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
178 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0241@00B7 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
183 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0247@00BC 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
188 => X"1" & O"2" & O"0" & O"0" & O"0",

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

-- L0258@00C5 0027.  data16 = !$ + 1 + @ BumpEnd;
--  data16 = 0000000000100111;
197 => X"0027",

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

-- L0269@00CE 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
206 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0270@00CF 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
207 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0271@00D0 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
208 => X"0003",

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

-- L0279@00D6 0600.  RRC;
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

-- L0287@00DC 0E40.  CPX, A;
--  r_p = 0000, r_a = 111, r_x = 001, r_y = 000, r_s = 000;
220 => X"0" & O"7" & O"1" & O"0" & O"0",

-- L0288@00DD B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
221 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0289@00DE 0003.  data16 = !$ + 1 + @ BumpStart;
--  data16 = 0000000000000011;
222 => X"0003",

-- L0290@00DF 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
223 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0291@00E0 FFC0.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111111000000;
224 => X"FFC0",

-- L0293@00E1 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
225 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0294@00E2 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
226 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0295@00E3 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
227 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0296@00E4 0291.  data16 =  @StrBeep;
--  data16 = 0000001010010001;
228 => X"0291",

-- L0297@00E5 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
229 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0298@00E6 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
230 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0299@00E7 0018.  data16 = !$ + 1 + @ Print;
--  data16 = 0000000000011000;
231 => X"0018",

-- L0300@00E8 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
232 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0301@00E9 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
233 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0302@00EA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
234 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0303@00EB FFB5.  data16 = !$ + 1 + @ CmdEdit;
--  data16 = 1111111110110101;
235 => X"FFB5",

-- L0305@00EC 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
236 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0306@00ED 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
237 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0307@00EE 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
238 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0308@00EF 0293.  data16 =  @StrBack;
--  data16 = 0000001010010011;
239 => X"0293",

-- L0309@00F0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
240 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0310@00F1 FFF4.  data16 = !$ + 1 + @ Bumped;
--  data16 = 1111111111110100;
241 => X"FFF4",

-- L0003@00F2 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
242 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@00F3 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
243 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@00F4 0000.  data16 =  0;
--  data16 = 0000000000000000;
244 => X"0000",

-- L0006@00F5 0600.ACSet:  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
245 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@00F6 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
246 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@00F7 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
247 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@00F8 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
248 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@00F9 FFFE.  data16 = !$ + 1 + @ ACDone;
--  data16 = 1111111111111110;
249 => X"FFFE",

-- L0013@00FA 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
250 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00FB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
251 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@00FC FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
252 => X"FFFF",

-- L0016@00FD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
253 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@00FE FFF7.  data16 = !$ + 1 + @ ACSet;
--  data16 = 1111111111110111;
254 => X"FFF7",

-- L0019@00FF 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
255 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0020@0100 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
256 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0021@0101 0006.  data16 = !$ + 1 + @ PrintDone;
--  data16 = 0000000000000110;
257 => X"0006",

-- L0022@0102 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
258 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0023@0103 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
259 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0024@0104 0004.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 0000000000000100;
260 => X"0004",

-- L0025@0105 2010.  INY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
261 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0026@0106 FFF9.  data16 = !$ + 1 + @ Print;
--  data16 = 1111111111111001;
262 => X"FFF9",

-- L0027@0107 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
263 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0029@0108 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
264 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0030@0109 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
265 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@010A 00A3.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 0000000010100011;
266 => X"00A3",

-- L0032@010B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
267 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@010C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@010D 0061.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 0000000001100001;
269 => X"0061",

-- L0035@010E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
270 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0037@010F 003B.PrintHex:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
271 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0038@0110 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
272 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0111 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
273 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0040@0112 02A1.  data16 = @ StrHex;
--  data16 = 0000001010100001;
274 => X"02A1",

-- L0042@0113 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
275 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0043@0114 000C.  data16 =  12;
--  data16 = 0000000000001100;
276 => X"000C",

-- L0044@0115 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
277 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0045@0116 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
278 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0047@0117 1040.SrcLoopX:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
279 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0048@0118 0000.  data16 =  0;
--  data16 = 0000000000000000;
280 => X"0000",

-- L0049@0119 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
281 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0050@011A 0003.  data16 = !$ + 1 + @ PrintNib;
--  data16 = 0000000000000011;
282 => X"0003",

-- L0051@011B 26C0.  DEX, RRC, BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
283 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0052@011C FFFB.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111111011;
284 => X"FFFB",

-- L0054@011D 1C00.PrintNib:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
285 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0055@011E 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
286 => X"000F",

-- L0056@011F 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
287 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0057@0120 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
288 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0058@0121 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
289 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0059@0122 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0060@0123 FFE5.  data16 = !$ + 1 + @ PrintChr;
--  data16 = 1111111111100101;
291 => X"FFE5",

-- L0062@0124 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
292 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0063@0125 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
293 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0064@0126 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
294 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0065@0127 0009.  data16 = !$ + 1 + @ PrintHexEx;
--  data16 = 0000000000001001;
295 => X"0009",

-- L0066@0128 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
296 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0067@0129 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
297 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0068@012A 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
298 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0069@012B 00C0.  DEX;
--  r_p = 0000, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
299 => X"0" & O"0" & O"3" & O"0" & O"0",

-- L0070@012C 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
300 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0071@012D 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
301 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0072@012E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
302 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0073@012F FFE8.  data16 = !$ + 1 + @ SrcLoopX;
--  data16 = 1111111111101000;
303 => X"FFE8",

-- L0075@0130 0102.PrintHexEx:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
304 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0076@0131 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
305 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0077@0132 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
306 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0133 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
307 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0134 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
308 => X"2000",

-- L0004@0135 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
309 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0136 0003.  data16 =  3;
--  data16 = 0000000000000011;
310 => X"0003",

-- L0006@0137 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
311 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@0138 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
312 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@0139 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
313 => X"0010",

-- L0009@013A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
314 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@013B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
315 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@013C 0003.UART_GetChr:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
316 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0013@013D 7FFF.  r_p = STP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
317 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0014@013E 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
318 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0015@013F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
319 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0016@0140 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
320 => X"2000",

-- L0017@0141 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
321 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0018@0142 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
322 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0019@0143 003A.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000111010;
323 => X"003A",

-- L0020@0144 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
324 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0021@0145 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
325 => X"0001",

-- L0022@0146 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
326 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@0147 FFFA.  data16 = !$ + 1 + @ RdStatus0;
--  data16 = 1111111111111010;
327 => X"FFFA",

-- L0024@0148 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
328 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0025@0149 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
329 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@014A 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
330 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0027@014B 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
331 => X"00FF",

-- L0028@014C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
332 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0029@014D 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
333 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0030@014E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
334 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@014F 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
335 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0033@0150 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
336 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0034@0151 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
337 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0035@0152 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
338 => X"2000",

-- L0036@0153 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
339 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0037@0154 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
340 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0038@0155 0028.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000101000;
341 => X"0028",

-- L0039@0156 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
342 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0040@0157 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
343 => X"0001",

-- L0041@0158 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
344 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0042@0159 0009.  data16 = !$ + 1 + @ NoBrk;
--  data16 = 0000000000001001;
345 => X"0009",

-- L0044@015A 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
346 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0045@015B 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
347 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0046@015C 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
348 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0047@015D 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
349 => X"00FF",

-- L0048@015E 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
350 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0049@015F 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
351 => X"0003",

-- L0050@0160 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
352 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0051@0161 0005.  data16 = !$ + 1 + @ Brk;
--  data16 = 0000000000000101;
353 => X"0005",

-- L0053@0162 1800.NoBrk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
354 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0054@0163 0000.  data16 =  0;
--  data16 = 0000000000000000;
355 => X"0000",

-- L0055@0164 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
356 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0056@0165 0004.  data16 = !$ + 1 + @ BrkExit;
--  data16 = 0000000000000100;
357 => X"0004",

-- L0057@0166 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
358 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0058@0167 0001.  data16 =  1;
--  data16 = 0000000000000001;
359 => X"0001",

-- L0059@0168 0600.  RRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
360 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0060@0169 0022.BrkExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
361 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0061@016A 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
362 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0062@016B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
363 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0064@016C 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
364 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0065@016D 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
365 => X"0007",

-- L0066@016E 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
366 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0067@016F 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
367 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0068@0170 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
368 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0069@0171 2000.  data16 =  0x2000;
--  data16 = 0010000000000000;
369 => X"2000",

-- L0070@0172 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
370 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0071@0173 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
371 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0072@0174 0009.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 0000000000001001;
372 => X"0009",

-- L0073@0175 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
373 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0074@0176 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
374 => X"0002",

-- L0075@0177 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
375 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0076@0178 FFFA.  data16 = !$ + 1 + @ RdStatus1;
--  data16 = 1111111111111010;
376 => X"FFFA",

-- L0077@0179 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
377 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0078@017A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
378 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0079@017B 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
379 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0080@017C 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
380 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0082@017D 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
381 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0083@017E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
382 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0084@017F 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
383 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0085@0180 0406.  XOR, M[S];
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 110;
384 => X"0" & O"2" & O"0" & O"0" & O"6",

-- L0086@0181 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
385 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0087@0182 0004.  data16 = !$ + 1 + @ StIsStable;
--  data16 = 0000000000000100;
386 => X"0004",

-- L0088@0183 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
387 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0089@0184 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
388 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@0185 FFF8.  data16 = !$ + 1 + @ GetStatus;
--  data16 = 1111111111111000;
389 => X"FFF8",

-- L0091@0186 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
390 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0092@0187 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
391 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0094@0188 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
392 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0095@0189 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
393 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0096@018A 0006.  data16 = !$ + 1 + @ UART_Done;
--  data16 = 0000000000000110;
394 => X"0006",

-- L0097@018B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
395 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0098@018C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
396 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0099@018D FFE1.  data16 = !$ + 1 + @ UART_OutChr;
--  data16 = 1111111111100001;
397 => X"FFE1",

-- L0100@018E 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
398 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0101@018F FFF9.  data16 = !$ + 1 + @ UART_OutStr;
--  data16 = 1111111111111001;
399 => X"FFF9",

-- L0102@0190 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
400 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@0191 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
401 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0011@0192 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
402 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0012@0193 FF5F.  data16 = !$ + 1 + @ CLC;
--  data16 = 1111111101011111;
403 => X"FF5F",

-- L0013@0194 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
404 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@0195 0040.  data16 =  64;
--  data16 = 0000000001000000;
405 => X"0040",

-- L0015@0196 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
406 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0016@0197 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
407 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0017@0198 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
408 => X"1000",

-- L0018@0199 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
409 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0019@019A 0020.  data16 =  32;
--  data16 = 0000000000100000;
410 => X"0020",

-- L0020@019B 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
411 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0021@019C FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
412 => X"FF00",

-- L0022@019D 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
413 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0023@019E 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
414 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@019F 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
415 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0025@01A0 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
416 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0026@01A1 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
417 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0027@01A2 0003.  data16 = !$ + 1 + @ RowOffDone;
--  data16 = 0000000000000011;
418 => X"0003",

-- L0028@01A3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
419 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@01A4 FFFA.  data16 = !$ + 1 + @ RowOffLoop;
--  data16 = 1111111111111010;
420 => X"FFFA",

-- L0030@01A5 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
421 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@01A6 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
422 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0032@01A7 0000.  data16 =  0;
--  data16 = 0000000000000000;
423 => X"0000",

-- L0033@01A8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
424 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@01A9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
425 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@01AA 0041.  data16 = !$ + 1 + @ SetOldCrsXY;
--  data16 = 0000000001000001;
426 => X"0041",

-- L0036@01AB 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
427 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0037@01AC 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
428 => X"0001",

-- L0041@01AD 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
429 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0042@01AE 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
430 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0043@01AF 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
431 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0045@01B0 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
432 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0046@01B1 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
433 => X"0002",

-- L0047@01B2 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
434 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@01B3 00A6.  data16 = !$ + 1 + @ VGA_HOME;
--  data16 = 0000000010100110;
435 => X"00A6",

-- L0050@01B4 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
436 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0051@01B5 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
437 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0052@01B6 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
438 => X"0001",

-- L0053@01B7 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
439 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0054@01B8 0083.  data16 = !$ + 1 + @ VGA_CLS;
--  data16 = 0000000010000011;
440 => X"0083",

-- L0056@01B9 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
441 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0057@01BA 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
442 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0058@01BB 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
443 => X"0007",

-- L0059@01BC 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
444 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0060@01BD 002A.  data16 = !$ + 1 + @ VGA_Ignore;
--  data16 = 0000000000101010;
445 => X"002A",

-- L0062@01BE 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
446 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0063@01BF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
447 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0064@01C0 00A6.  data16 = !$ + 1 + @ GetCursorXY;
--  data16 = 0000000010100110;
448 => X"00A6",

-- L0066@01C1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
449 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0067@01C2 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
450 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0068@01C3 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
451 => X"000D",

-- L0069@01C4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
452 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0070@01C5 005F.  data16 = !$ + 1 + @ VGA_CR;
--  data16 = 0000000001011111;
453 => X"005F",

-- L0072@01C6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
454 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0073@01C7 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
455 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0074@01C8 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
456 => X"000A",

-- L0075@01C9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
457 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0076@01CA 006E.  data16 = !$ + 1 + @ VGA_LF;
--  data16 = 0000000001101110;
458 => X"006E",

-- L0078@01CB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
459 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0079@01CC 1400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
460 => X"1" & O"2" & O"0" & O"0" & O"0",

-- L0080@01CD 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
461 => X"0008",

-- L0081@01CE 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
462 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0082@01CF 005A.  data16 = !$ + 1 + @ VGA_BS;
--  data16 = 0000000001011010;
463 => X"005A",

-- L0085@01D0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
464 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0087@01D1 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
465 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0088@01D2 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
466 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0089@01D3 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
467 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0090@01D4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
468 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0091@01D5 009A.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000010011010;
469 => X"009A",

-- L0092@01D6 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
470 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0093@01D7 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
471 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0094@01D8 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
472 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0095@01D9 0040.  data16 =  64;
--  data16 = 0000000001000000;
473 => X"0040",

-- L0096@01DA A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
474 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0097@01DB 0019.  data16 = !$ + 1 + @ NextRow;
--  data16 = 0000000000011001;
475 => X"0019",

-- L0098@01DC 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
476 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0099@01DD 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
477 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0100@01DE FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
478 => X"FF3E",

-- L0101@01DF 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
479 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0102@01E0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
480 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0103@01E1 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
481 => X"FF3F",

-- L0104@01E2 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
482 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0105@01E3 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
483 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0107@01E4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
484 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0108@01E5 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
485 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0109@01E6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
486 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0111@01E7 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
487 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0112@01E8 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
488 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0113@01E9 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
489 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0114@01EA 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
490 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0116@01EB 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
491 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0117@01EC 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
492 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0118@01ED FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
493 => X"FF3C",

-- L0119@01EE 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
494 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0120@01EF 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
495 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0121@01F0 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
496 => X"FF3D",

-- L0122@01F1 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
497 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0123@01F2 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
498 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0124@01F3 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
499 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0126@01F4 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
500 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0127@01F5 0000.  data16 =  0;
--  data16 = 0000000000000000;
501 => X"0000",

-- L0128@01F6 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
502 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0129@01F7 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
503 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0130@01F8 0020.  data16 =  32;
--  data16 = 0000000000100000;
504 => X"0020",

-- L0131@01F9 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
505 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0132@01FA 0003.  data16 = !$ + 1 + @ ScrollUp;
--  data16 = 0000000000000011;
506 => X"0003",

-- L0133@01FB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
507 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0134@01FC FFE0.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111111100000;
508 => X"FFE0",

-- L0136@01FD 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
509 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0137@01FE 0000.  data16 =  0;
--  data16 = 0000000000000000;
510 => X"0000",

-- L0138@01FF 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
511 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0139@0200 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
512 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0140@0201 0000.  data16 =  0;
--  data16 = 0000000000000000;
513 => X"0000",

-- L0141@0202 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
514 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0142@0203 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
515 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0143@0204 006B.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000001101011;
516 => X"006B",

-- L0144@0205 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
517 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0145@0206 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
518 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0146@0207 0040.  data16 =  64;
--  data16 = 0000000001000000;
519 => X"0040",

-- L0147@0208 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
520 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0148@0209 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
521 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0149@020A 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
522 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0150@020B 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
523 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0151@020C 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
524 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0152@020D 0040.  data16 =  64;
--  data16 = 0000000001000000;
525 => X"0040",

-- L0153@020E A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
526 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0154@020F 0003.  data16 = !$ + 1 + @ ChkRow;
--  data16 = 0000000000000011;
527 => X"0003",

-- L0155@0210 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
528 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0156@0211 FFF4.  data16 = !$ + 1 + @ NxtCol;
--  data16 = 1111111111110100;
529 => X"FFF4",

-- L0157@0212 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
530 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0158@0213 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
531 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0159@0214 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
532 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0160@0215 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
533 => X"001F",

-- L0161@0216 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
534 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0162@0217 0003.  data16 = !$ + 1 + @ ClrLastRow;
--  data16 = 0000000000000011;
535 => X"0003",

-- L0163@0218 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
536 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0164@0219 FFE6.  data16 = !$ + 1 + @ NxtRow;
--  data16 = 1111111111100110;
537 => X"FFE6",

-- L0166@021A 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
538 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0167@021B 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
539 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0168@021C 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
540 => X"001F",

-- L0169@021D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
541 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0170@021E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
542 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0171@021F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
543 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0172@0220 002C.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000101100;
544 => X"002C",

-- L0173@0221 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
545 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0174@0222 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
546 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0175@0223 0002.  data16 = !$ + 1 + @ SetX0;
--  data16 = 0000000000000010;
547 => X"0002",

-- L0177@0224 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
548 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0178@0225 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
549 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0179@0226 0000.  data16 =  0;
--  data16 = 0000000000000000;
550 => X"0000",

-- L0180@0227 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
551 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0181@0228 FFB4.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110110100;
552 => X"FFB4",

-- L0183@0229 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
553 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0184@022A 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
554 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0185@022B 0000.  data16 =  0;
--  data16 = 0000000000000000;
555 => X"0000",

-- L0186@022C B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
556 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0187@022D 0003.  data16 = !$ + 1 + @ PrevRow;
--  data16 = 0000000000000011;
557 => X"0003",

-- L0188@022E 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
558 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0189@022F FFAD.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101101;
559 => X"FFAD",

-- L0190@0230 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
560 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0191@0231 0000.  data16 =  0;
--  data16 = 0000000000000000;
561 => X"0000",

-- L0192@0232 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
562 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0193@0233 FFA9.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110101001;
563 => X"FFA9",

-- L0194@0234 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
564 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0195@0235 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
565 => X"003F",

-- L0196@0236 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
566 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0197@0237 FFA5.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111110100101;
567 => X"FFA5",

-- L0199@0238 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
568 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0200@0239 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
569 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0201@023A FFBC.  data16 = !$ + 1 + @ NextRow1;
--  data16 = 1111111110111100;
570 => X"FFBC",

-- L0203@023B 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
571 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0204@023C 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
572 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0205@023D 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
573 => X"0020",

-- L0206@023E 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
574 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0207@023F 0000.  data16 =  0;
--  data16 = 0000000000000000;
575 => X"0000",

-- L0208@0240 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
576 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0209@0241 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
577 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0210@0242 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
578 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0211@0243 0009.  data16 = !$ + 1 + @ ClearRow;
--  data16 = 0000000000001001;
579 => X"0009",

-- L0212@0244 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
580 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0213@0245 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
581 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0214@0246 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
582 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0215@0247 0020.  data16 =  32;
--  data16 = 0000000000100000;
583 => X"0020",

-- L0216@0248 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
584 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0217@0249 0011.  data16 = !$ + 1 + @ vga_home1;
--  data16 = 0000000000010001;
585 => X"0011",

-- L0218@024A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
586 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0219@024B FFF5.  data16 = !$ + 1 + @ ClrNextRow;
--  data16 = 1111111111110101;
587 => X"FFF5",

-- L0221@024C 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
588 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0222@024D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
589 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0223@024E 0021.  data16 = !$ + 1 + @ GetRowBase;
--  data16 = 0000000000100001;
590 => X"0021",

-- L0224@024F 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
591 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0225@0250 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
592 => X"0020",

-- L0226@0251 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
593 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0227@0252 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
594 => X"0007",

-- L0228@0253 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
595 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0229@0254 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
596 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0230@0255 0003.  data16 = !$ + 1 + @ ClrDone;
--  data16 = 0000000000000011;
597 => X"0003",

-- L0231@0256 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
598 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0232@0257 FFFC.  data16 = !$ + 1 + @ ClrRLoop;
--  data16 = 1111111111111100;
599 => X"FFFC",

-- L0233@0258 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
600 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0235@0259 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
601 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0236@025A 1120.vga_home1:  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
602 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0237@025B 0000.  data16 =  0;
--  data16 = 0000000000000000;
603 => X"0000",

-- L0238@025C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
604 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0239@025D FF7F.  data16 = !$ + 1 + @ SetCursorXY;
--  data16 = 1111111101111111;
605 => X"FF7F",

-- L0241@025E 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
606 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0242@025F FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
607 => X"FF3C",

-- L0243@0260 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
608 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0244@0261 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
609 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0245@0262 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
610 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0246@0263 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
611 => X"FF3D",

-- L0247@0264 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
612 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0248@0265 0007.  data16 = !$ + 1 + @ GetCursorY;
--  data16 = 0000000000000111;
613 => X"0007",

-- L0250@0266 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
614 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0251@0267 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
615 => X"FF3E",

-- L0252@0268 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
616 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0253@0269 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
617 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0254@026A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
618 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0255@026B FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
619 => X"FF3F",

-- L0256@026C 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
620 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0257@026D 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
621 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0258@026E 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
622 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0260@026F 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
623 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0261@0270 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
624 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0262@0271 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
625 => X"FF00",

-- L0263@0272 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
626 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0264@0273 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
627 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0265@0274 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
628 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0266@0275 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
629 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0268@0276 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
630 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0269@0277 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
631 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0270@0278 0006.  data16 = !$ + 1 + @ OutStrDone;
--  data16 = 0000000000000110;
632 => X"0006",

-- L0271@0279 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
633 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0272@027A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
634 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0273@027B FF32.  data16 = !$ + 1 + @ VGA_OutChr;
--  data16 = 1111111100110010;
635 => X"FF32",

-- L0274@027C 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
636 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0275@027D FFF9.  data16 = !$ + 1 + @ VGA_OutStr;
--  data16 = 1111111111111001;
637 => X"FFF9",

-- L0276@027E 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
638 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@027F 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
639 => X"000D",

-- L0004@0280 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
640 => X"000A",

-- L0005@0281 002A.  data16 =  '*';
--  data16 = 0000000000101010;
641 => X"002A",

-- L0006@0282 0042.  data16 =  'B';
--  data16 = 0000000001000010;
642 => X"0042",

-- L0007@0283 0052.  data16 =  'R';
--  data16 = 0000000001010010;
643 => X"0052",

-- L0008@0284 0045.  data16 =  'E';
--  data16 = 0000000001000101;
644 => X"0045",

-- L0009@0285 0041.  data16 =  'A';
--  data16 = 0000000001000001;
645 => X"0041",

-- L0010@0286 004B.  data16 =  'K';
--  data16 = 0000000001001011;
646 => X"004B",

-- L0011@0287 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
647 => X"0007",

-- L0012@0288 0000.  data16 =  0;
--  data16 = 0000000000000000;
648 => X"0000",

-- L0014@0289 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
649 => X"000D",

-- L0015@028A 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
650 => X"000A",

-- L0016@028B 002A.  data16 =  '*';
--  data16 = 0000000000101010;
651 => X"002A",

-- L0017@028C 0045.  data16 =  'E';
--  data16 = 0000000001000101;
652 => X"0045",

-- L0018@028D 0052.  data16 =  'R';
--  data16 = 0000000001010010;
653 => X"0052",

-- L0019@028E 0052.  data16 =  'R';
--  data16 = 0000000001010010;
654 => X"0052",

-- L0020@028F 004F.  data16 =  'O';
--  data16 = 0000000001001111;
655 => X"004F",

-- L0021@0290 0052.  data16 =  'R';
--  data16 = 0000000001010010;
656 => X"0052",

-- L0022@0291 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
657 => X"0007",

-- L0023@0292 0000.  data16 =  0;
--  data16 = 0000000000000000;
658 => X"0000",

-- L0025@0293 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
659 => X"0008",

-- L0026@0294 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
660 => X"0007",

-- L0027@0295 0000.  data16 =  0;
--  data16 = 0000000000000000;
661 => X"0000",

-- L0029@0296 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
662 => X"0001",

-- L0030@0297 0000.  data16 =  0;
--  data16 = 0000000000000000;
663 => X"0000",

-- L0032@0298 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
664 => X"0052",

-- L0033@0299 0065.  data16 =  'e';
--  data16 = 0000000001100101;
665 => X"0065",

-- L0034@029A 0061.  data16 =  'a';
--  data16 = 0000000001100001;
666 => X"0061",

-- L0035@029B 0064.  data16 =  'd';
--  data16 = 0000000001100100;
667 => X"0064",

-- L0036@029C 0079.  data16 =  'y';
--  data16 = 0000000001111001;
668 => X"0079",

-- L0037@029D 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
669 => X"002E",

-- L0038@029E 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
670 => X"000D",

-- L0039@029F 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
671 => X"000A",

-- L0040@02A0 0000.  data16 =  0;
--  data16 = 0000000000000000;
672 => X"0000",

-- L0042@02A1 0030.StrHex:  data16 =  '0';
--  data16 = 0000000000110000;
673 => X"0030",

-- L0043@02A2 0031.  data16 =  '1';
--  data16 = 0000000000110001;
674 => X"0031",

-- L0044@02A3 0032.  data16 =  '2';
--  data16 = 0000000000110010;
675 => X"0032",

-- L0045@02A4 0033.  data16 =  '3';
--  data16 = 0000000000110011;
676 => X"0033",

-- L0046@02A5 0034.  data16 =  '4';
--  data16 = 0000000000110100;
677 => X"0034",

-- L0047@02A6 0035.  data16 =  '5';
--  data16 = 0000000000110101;
678 => X"0035",

-- L0048@02A7 0036.  data16 =  '6';
--  data16 = 0000000000110110;
679 => X"0036",

-- L0049@02A8 0037.  data16 =  '7';
--  data16 = 0000000000110111;
680 => X"0037",

-- L0050@02A9 0038.  data16 =  '8';
--  data16 = 0000000000111000;
681 => X"0038",

-- L0051@02AA 0039.  data16 =  '9';
--  data16 = 0000000000111001;
682 => X"0039",

-- L0052@02AB 0041.  data16 =  'A';
--  data16 = 0000000001000001;
683 => X"0041",

-- L0053@02AC 0042.  data16 =  'B';
--  data16 = 0000000001000010;
684 => X"0042",

-- L0054@02AD 0043.  data16 =  'C';
--  data16 = 0000000001000011;
685 => X"0043",

-- L0055@02AE 0044.  data16 =  'D';
--  data16 = 0000000001000100;
686 => X"0044",

-- L0056@02AF 0045.  data16 =  'E';
--  data16 = 0000000001000101;
687 => X"0045",

-- L0057@02B0 0046.  data16 =  'F';
--  data16 = 0000000001000110;
688 => X"0046",

-- 3411 location(s) in following ranges will be filled with default value
-- 0004 .. 0007
-- 02B1 .. 0FFF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

