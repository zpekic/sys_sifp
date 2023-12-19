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

-- L0021@0002 0036.  data16 =  @Init;
--  data16 = 0000000000110110;
2 => X"0036",

-- L0028@0008 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
8 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0029@0009 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
9 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0030@000A 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
10 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0032@000B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
11 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@000C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
12 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@000D 01B7.  data16 =  @GetOldCrsXY - $;
--  data16 = 0000000110110111;
13 => X"01B7",

-- L0035@000E 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
14 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0036@000F 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
15 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0037@0010 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
16 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0038@0011 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
17 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0012 01C3.  data16 =  @GetRowBase - $;
--  data16 = 0000000111000011;
18 => X"01C3",

-- L0040@0013 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
19 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0041@0014 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
20 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0042@0015 FF7F.  data16 =  0xFF7F;
--  data16 = 1111111101111111;
21 => X"FF7F",

-- L0043@0016 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
22 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0044@0017 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
23 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0045@0018 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
24 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0046@0019 01B3.  data16 =  @GetCursorXY - $;
--  data16 = 0000000110110011;
25 => X"01B3",

-- L0047@001A 0042.  CPX, M[POP];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 010;
26 => X"0" & O"0" & O"1" & O"0" & O"2",

-- L0048@001B 000A.  CPY, M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 010;
27 => X"0" & O"0" & O"0" & O"1" & O"2",

-- L0049@001C B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
28 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0050@001D 0003.  data16 =  @CheckY - $;
--  data16 = 0000000000000011;
29 => X"0003",

-- L0051@001E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
30 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0052@001F 0003.  data16 =  @NoFlip - $;
--  data16 = 0000000000000011;
31 => X"0003",

-- L0053@0020 D000.CheckY:  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
32 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0054@0021 0006.  data16 =  @Flip - $;
--  data16 = 0000000000000110;
33 => X"0006",

-- L0055@0022 6003.NoFlip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
34 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0056@0023 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
35 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0057@0024 012D.  data16 =  @SetOldCrsXY - $;
--  data16 = 0000000100101101;
36 => X"012D",

-- L0058@0025 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
37 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@0026 000B.  data16 =  @IntExit - $;
--  data16 = 0000000000001011;
38 => X"000B",

-- L0061@0027 6003.Flip:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
39 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0062@0028 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
40 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0063@0029 01A3.  data16 =  @GetCursorXY - $;
--  data16 = 0000000110100011;
41 => X"01A3",

-- L0064@002A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
42 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0065@002B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
43 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@002C 01A9.  data16 =  @GetRowBase - $;
--  data16 = 0000000110101001;
44 => X"01A9",

-- L0067@002D 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
45 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0068@002E 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
46 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0069@002F 0080.  data16 =  0x0080;
--  data16 = 0000000010000000;
47 => X"0080",

-- L0070@0030 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
48 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0072@0031 0022.IntExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
49 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0073@0032 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
50 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0074@0033 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
51 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0075@0034 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
52 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0076@0035 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
53 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0079@0036 6003.Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
54 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0080@0037 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
55 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0081@0038 00C8.  data16 =  @VGA_Init - $;
--  data16 = 0000000011001000;
56 => X"00C8",

-- L0082@0039 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
57 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0083@003A 0060.  data16 =  @StrHWorld;
--  data16 = 0000000001100000;
58 => X"0060",

-- L0084@003B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
59 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0085@003C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
60 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0086@003D 019F.  data16 =  @VGA_OutStr - $;
--  data16 = 0000000110011111;
61 => X"019F",

-- L0088@003E 6FFF.  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
62 => X"6" & O"7" & O"7" & O"7" & O"7",

-- L0090@003F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
63 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0091@0040 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
64 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0092@0041 008D.  data16 =  @UART_Init - $;
--  data16 = 0000000010001101;
65 => X"008D",

-- L0093@0042 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
66 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0094@0043 0060.  data16 =  @StrHWorld;
--  data16 = 0000000001100000;
67 => X"0060",

-- L0095@0044 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
68 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0096@0045 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
69 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0097@0046 00B1.  data16 =  @UART_OutStr - $;
--  data16 = 0000000010110001;
70 => X"00B1",

-- L0099@0047 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
71 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0101@0048 6003.EchoLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
72 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0102@0049 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
73 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0103@004A 008D.  data16 =  @UART_GetChr - $;
--  data16 = 0000000010001101;
74 => X"008D",

-- L0104@004B 0E03.EchoOut:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
75 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0105@004C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
76 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0106@004D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
77 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0107@004E 009A.  data16 =  @UART_OutChr - $;
--  data16 = 0000000010011010;
78 => X"009A",

-- L0108@004F 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
79 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0109@0050 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
80 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0110@0051 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
81 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0111@0052 00CA.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000011001010;
82 => X"00CA",

-- L0112@0053 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
83 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0113@0054 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
84 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0114@0055 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
85 => X"000D",

-- L0115@0056 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
86 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0116@0057 0003.  data16 =  @EchoLF - $;
--  data16 = 0000000000000011;
87 => X"0003",

-- L0117@0058 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0118@0059 0048.  data16 =  @EchoLoop;
--  data16 = 0000000001001000;
89 => X"0048",

-- L0119@005A 1800.EchoLF:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
90 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0120@005B 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
91 => X"000A",

-- L0121@005C 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
92 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0122@005D 004B.  data16 =  @EchoOut;
--  data16 = 0000000001001011;
93 => X"004B",

-- L0124@005E 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
94 => X"0001",

-- L0125@005F 0000.  data16 =  0;
--  data16 = 0000000000000000;
95 => X"0000",

-- L0127@0060 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
96 => X"0048",

-- L0128@0061 0065.  data16 =  'e';
--  data16 = 0000000001100101;
97 => X"0065",

-- L0129@0062 006C.  data16 =  'l';
--  data16 = 0000000001101100;
98 => X"006C",

-- L0130@0063 006C.  data16 =  'l';
--  data16 = 0000000001101100;
99 => X"006C",

-- L0131@0064 006F.  data16 =  'o';
--  data16 = 0000000001101111;
100 => X"006F",

-- L0132@0065 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
101 => X"0020",

-- L0133@0066 0057.  data16 =  'W';
--  data16 = 0000000001010111;
102 => X"0057",

-- L0134@0067 006F.  data16 =  'o';
--  data16 = 0000000001101111;
103 => X"006F",

-- L0135@0068 0072.  data16 =  'r';
--  data16 = 0000000001110010;
104 => X"0072",

-- L0136@0069 006C.  data16 =  'l';
--  data16 = 0000000001101100;
105 => X"006C",

-- L0137@006A 0064.  data16 =  'd';
--  data16 = 0000000001100100;
106 => X"0064",

-- L0138@006B 0021.  data16 =  '!';
--  data16 = 0000000000100001;
107 => X"0021",

-- L0139@006C 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
108 => X"000D",

-- L0140@006D 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
109 => X"000A",

-- L0141@006E 0000.  data16 =  0;
--  data16 = 0000000000000000;
110 => X"0000",

-- L0003@006F 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
111 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0070 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
112 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0071 0000.  data16 =  0;
--  data16 = 0000000000000000;
113 => X"0000",

-- L0006@0072 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
114 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@0073 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
115 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@0074 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
116 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@0075 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
117 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@0076 FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
118 => X"FFFE",

-- L0013@0077 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
119 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0078 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
120 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@0079 FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
121 => X"FFFF",

-- L0016@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@007B FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
123 => X"FFF7",

-- L0020@007C 0E03.MemCompare:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
124 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0021@007D 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
125 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0022@007E 0000.  data16 =  0;
--  data16 = 0000000000000000;
126 => X"0000",

-- L0023@007F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
127 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0024@0080 0005.  data16 =  @CompDone - $;
--  data16 = 0000000000000101;
128 => X"0005",

-- L0025@0081 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
129 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0026@0082 0380.  XOR, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
130 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0027@0083 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
131 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0028@0084 0004.  data16 =  @CompCont - $;
--  data16 = 0000000000000100;
132 => X"0004",

-- L0029@0085 1005.CompDone:  r_p = M[IMM], r_s = ADS;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 101;
133 => X"1" & O"0" & O"0" & O"0" & O"5",

-- L0030@0086 0001.  data16 =  1;
--  data16 = 0000000000000001;
134 => X"0001",

-- L0031@0087 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
135 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0032@0088 0892.CompCont:  INX, INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 010, r_y = 010, r_s = 010;
136 => X"0" & O"4" & O"2" & O"2" & O"2",

-- L0033@0089 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
137 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@008A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
138 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@008B 000B.  data16 =  @DECA - $;
--  data16 = 0000000000001011;
139 => X"000B",

-- L0036@008C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
140 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0037@008D FFEF.  data16 =  @MemCompare - $;
--  data16 = 1111111111101111;
141 => X"FFEF",

-- L0039@008E 8000.INCA:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
142 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0040@008F 0004.  data16 =  @INC0 - $;
--  data16 = 0000000000000100;
143 => X"0004",

-- L0041@0090 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
144 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0042@0091 0001.  data16 =  1;
--  data16 = 0000000000000001;
145 => X"0001",

-- L0043@0092 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
146 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0044@0093 1A00.INC0:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
147 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0045@0094 0000.  data16 =  0;
--  data16 = 0000000000000000;
148 => X"0000",

-- L0046@0095 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
149 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0048@0096 8000.DECA:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
150 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0049@0097 0004.  data16 =  @DEC2 - $;
--  data16 = 0000000000000100;
151 => X"0004",

-- L0050@0098 1A00.  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
152 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0051@0099 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
153 => X"FFFF",

-- L0052@009A 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
154 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0053@009B 1A00.DEC2:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
155 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0054@009C FFFE.  data16 =  0xFFFE;
--  data16 = 1111111111111110;
156 => X"FFFE",

-- L0055@009D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
157 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0059@009E 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
158 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0060@009F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
159 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0061@00A0 0010.  data16 =  16;
--  data16 = 0000000000010000;
160 => X"0010",

-- L0062@00A1 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
161 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0063@00A2 0000.  data16 =  0;
--  data16 = 0000000000000000;
162 => X"0000",

-- L0065@00A3 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
163 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0066@00A4 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
164 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0067@00A5 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
165 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0068@00A6 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
166 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0069@00A7 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
167 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0070@00A8 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
168 => X"0005",

-- L0071@00A9 1A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0001, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
169 => X"1" & O"5" & O"0" & O"0" & O"0",

-- L0072@00AA 0000.  data16 =  0;
--  data16 = 0000000000000000;
170 => X"0000",

-- L0073@00AB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
171 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0074@00AC 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
172 => X"0005",

-- L0075@00AD 6003.Y01:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
173 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0076@00AE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
174 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@00AF FFC0.  data16 =  @CLC - $;
--  data16 = 1111111111000000;
175 => X"FFC0",

-- L0078@00B0 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
176 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0079@00B1 0600.Nextbit:  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
177 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0080@00B2 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
178 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0081@00B3 0838.  LDA, Y;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 111, r_s = 000;
179 => X"0" & O"4" & O"0" & O"7" & O"0",

-- L0082@00B4 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
180 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0083@00B5 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
181 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0084@00B6 08C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 011, r_y = 000, r_s = 010;
182 => X"0" & O"4" & O"3" & O"0" & O"2",

-- L0085@00B7 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
183 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0086@00B8 FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
184 => X"FFEB",

-- L0087@00B9 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
185 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0088@00BA 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
186 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0091@00BB 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
187 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0092@00BC 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
188 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0093@00BD 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
189 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0094@00BE B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
190 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0095@00BF 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
191 => X"0002",

-- L0096@00C0 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
192 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0097@00C1 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
193 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0098@00C2 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
194 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0099@00C3 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
195 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0100@00C4 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
196 => X"0002",

-- L0101@00C5 1FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0001, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
197 => X"1" & O"7" & O"7" & O"7" & O"7",

-- L0102@00C6 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
198 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0103@00C7 1920.  LDA, LDY, LDX, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 100, r_s = 000;
199 => X"1" & O"4" & O"4" & O"4" & O"0",

-- L0104@00C8 0000.  data16 =  0;
--  data16 = 0000000000000000;
200 => X"0000",

-- L0105@00C9 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
201 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0106@00CA 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
202 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0107@00CB 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
203 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0108@00CC 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
204 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0109@00CD 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
205 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@00CE 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
206 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@00CF E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
207 => X"E000",

-- L0004@00D0 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
208 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@00D1 0003.  data16 =  3;
--  data16 = 0000000000000011;
209 => X"0003",

-- L0006@00D2 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
210 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@00D3 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
211 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@00D4 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
212 => X"0010",

-- L0009@00D5 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
213 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@00D6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
214 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@00D7 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
215 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@00D8 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
216 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0014@00D9 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
217 => X"E000",

-- L0015@00DA 0830.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
218 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0016@00DB 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
219 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0017@00DC 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0018@00DD 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
221 => X"0003",

-- L0019@00DE 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
222 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0020@00DF FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
223 => X"FFFB",

-- L0021@00E0 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
224 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0022@00E1 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
225 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0023@00E2 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
226 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0024@00E3 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
227 => X"00FF",

-- L0025@00E4 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
228 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0026@00E5 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
229 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0028@00E6 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
230 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0029@00E7 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
231 => X"0007",

-- L0030@00E8 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
232 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0031@00E9 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
233 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0032@00EA 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
234 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0033@00EB E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
235 => X"E000",

-- L0034@00EC 0830.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
236 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0035@00ED 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
237 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0036@00EE 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
238 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0037@00EF 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
239 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0038@00F0 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
240 => X"0003",

-- L0039@00F1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
241 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0040@00F2 FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
242 => X"FFFA",

-- L0041@00F3 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
243 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0042@00F4 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
244 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0043@00F5 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
245 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0044@00F6 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
246 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0046@00F7 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
247 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0047@00F8 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
248 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@00F9 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
249 => X"0006",

-- L0049@00FA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
250 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0050@00FB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
251 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@00FC FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
252 => X"FFEC",

-- L0052@00FD 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
253 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0053@00FE FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
254 => X"FFF9",

-- L0054@00FF 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
255 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@0100 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
256 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0011@0101 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
257 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0012@0102 FF6D.  data16 =  @CLC - $;
--  data16 = 1111111101101101;
258 => X"FF6D",

-- L0013@0103 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
259 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@0104 0040.  data16 =  64;
--  data16 = 0000000001000000;
260 => X"0040",

-- L0015@0105 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
261 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0016@0106 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
262 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0017@0107 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
263 => X"1000",

-- L0018@0108 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
264 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0019@0109 0020.  data16 =  32;
--  data16 = 0000000000100000;
265 => X"0020",

-- L0020@010A 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
266 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0021@010B FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
267 => X"FF00",

-- L0022@010C 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
268 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0023@010D 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
269 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@010E 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
270 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0025@010F 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
271 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0026@0110 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
272 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0027@0111 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
273 => X"0003",

-- L0028@0112 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
274 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@0113 FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
275 => X"FFFA",

-- L0030@0114 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
276 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@0115 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
277 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0032@0116 0000.  data16 =  0;
--  data16 = 0000000000000000;
278 => X"0000",

-- L0033@0117 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
279 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@0118 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
280 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@0119 0038.  data16 =  @SetOldCrsXY - $;
--  data16 = 0000000000111000;
281 => X"0038",

-- L0036@011A 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
282 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0037@011B 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
283 => X"0001",

-- L0042@011C 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
284 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0043@011D 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
285 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0044@011E 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
286 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0046@011F 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
287 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0047@0120 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
288 => X"0002",

-- L0048@0121 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
289 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0049@0122 009D.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010011101;
290 => X"009D",

-- L0051@0123 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
291 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0052@0124 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
292 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0053@0125 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
293 => X"0001",

-- L0054@0126 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
294 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0055@0127 007A.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001111010;
295 => X"007A",

-- L0057@0128 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
296 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0058@0129 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
297 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0059@012A 00A2.  data16 =  @GetCursorXY - $;
--  data16 = 0000000010100010;
298 => X"00A2",

-- L0061@012B 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
299 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0062@012C 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
300 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0063@012D 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
301 => X"000D",

-- L0064@012E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
302 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0065@012F 005B.  data16 =  @VGA_CR - $;
--  data16 = 0000000001011011;
303 => X"005B",

-- L0067@0130 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
304 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0068@0131 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
305 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0069@0132 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
306 => X"000A",

-- L0070@0133 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
307 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0071@0134 006A.  data16 =  @VGA_LF - $;
--  data16 = 0000000001101010;
308 => X"006A",

-- L0073@0135 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
309 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0074@0136 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
310 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0075@0137 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
311 => X"0008",

-- L0076@0138 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
312 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0077@0139 0056.  data16 =  @VGA_BS - $;
--  data16 = 0000000001010110;
313 => X"0056",

-- L0080@013A 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
314 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0082@013B 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
315 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0083@013C 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
316 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0084@013D 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
317 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0085@013E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
318 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0086@013F 0096.  data16 =  @GetRowBase - $;
--  data16 = 0000000010010110;
319 => X"0096",

-- L0087@0140 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
320 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0088@0141 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
321 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0089@0142 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
322 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0090@0143 0040.  data16 =  64;
--  data16 = 0000000001000000;
323 => X"0040",

-- L0091@0144 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
324 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0092@0145 0015.  data16 =  @NextRow - $;
--  data16 = 0000000000010101;
325 => X"0015",

-- L0093@0146 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
326 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0094@0147 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
327 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0095@0148 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
328 => X"FF3E",

-- L0096@0149 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
329 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0097@014A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
330 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0098@014B FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
331 => X"FF3F",

-- L0099@014C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
332 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0100@014D 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
333 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0102@014E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
334 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0103@014F 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
335 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0104@0150 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
336 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0106@0151 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
337 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0107@0152 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
338 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0108@0153 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
339 => X"FF3C",

-- L0109@0154 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
340 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0110@0155 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
341 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0111@0156 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
342 => X"FF3D",

-- L0112@0157 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
343 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0113@0158 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
344 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0114@0159 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
345 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0116@015A 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
346 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0117@015B 0000.  data16 =  0;
--  data16 = 0000000000000000;
347 => X"0000",

-- L0118@015C 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
348 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0119@015D 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
349 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0120@015E 0020.  data16 =  32;
--  data16 = 0000000000100000;
350 => X"0020",

-- L0121@015F C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
351 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0122@0160 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
352 => X"0003",

-- L0123@0161 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
353 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0124@0162 FFE4.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111100100;
354 => X"FFE4",

-- L0126@0163 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
355 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0127@0164 0000.  data16 =  0;
--  data16 = 0000000000000000;
356 => X"0000",

-- L0128@0165 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
357 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0129@0166 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
358 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0130@0167 0000.  data16 =  0;
--  data16 = 0000000000000000;
359 => X"0000",

-- L0131@0168 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
360 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0132@0169 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
361 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0133@016A 006B.  data16 =  @GetRowBase - $;
--  data16 = 0000000001101011;
362 => X"006B",

-- L0134@016B 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
363 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0135@016C 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
364 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0136@016D 0040.  data16 =  64;
--  data16 = 0000000001000000;
365 => X"0040",

-- L0137@016E 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
366 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0138@016F 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
367 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0139@0170 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
368 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0140@0171 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
369 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0141@0172 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
370 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0142@0173 0040.  data16 =  64;
--  data16 = 0000000001000000;
371 => X"0040",

-- L0143@0174 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
372 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0144@0175 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
373 => X"0003",

-- L0145@0176 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
374 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0146@0177 FFF4.  data16 =  @NxtCol - $;
--  data16 = 1111111111110100;
375 => X"FFF4",

-- L0147@0178 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
376 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0148@0179 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
377 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0149@017A 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
378 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0150@017B 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
379 => X"001F",

-- L0151@017C C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
380 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0152@017D 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
381 => X"0003",

-- L0153@017E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
382 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0154@017F FFE6.  data16 =  @NxtRow - $;
--  data16 = 1111111111100110;
383 => X"FFE6",

-- L0156@0180 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
384 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0157@0181 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
385 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0158@0182 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
386 => X"001F",

-- L0159@0183 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
387 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0160@0184 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
388 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0161@0185 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
389 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0162@0186 002C.  data16 =  @ClearRow - $;
--  data16 = 0000000000101100;
390 => X"002C",

-- L0163@0187 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
391 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0164@0188 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
392 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@0189 0002.  data16 =  @SetX0 - $;
--  data16 = 0000000000000010;
393 => X"0002",

-- L0167@018A 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
394 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0168@018B 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
395 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0169@018C 0000.  data16 =  0;
--  data16 = 0000000000000000;
396 => X"0000",

-- L0170@018D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
397 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0171@018E FFB8.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110111000;
398 => X"FFB8",

-- L0173@018F 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
399 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0174@0190 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
400 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0175@0191 0000.  data16 =  0;
--  data16 = 0000000000000000;
401 => X"0000",

-- L0176@0192 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
402 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0177@0193 0003.  data16 =  @PrevRow - $;
--  data16 = 0000000000000011;
403 => X"0003",

-- L0178@0194 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
404 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0179@0195 FFB1.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110110001;
405 => X"FFB1",

-- L0180@0196 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
406 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0181@0197 0000.  data16 =  0;
--  data16 = 0000000000000000;
407 => X"0000",

-- L0182@0198 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
408 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0183@0199 FFAD.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110101101;
409 => X"FFAD",

-- L0184@019A 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
410 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0185@019B 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
411 => X"003F",

-- L0186@019C 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
412 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0187@019D FFA9.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110101001;
413 => X"FFA9",

-- L0189@019E 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
414 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0190@019F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
415 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@01A0 FFBC.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111100;
416 => X"FFBC",

-- L0193@01A1 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
417 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0194@01A2 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
418 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0195@01A3 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
419 => X"0020",

-- L0196@01A4 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
420 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0197@01A5 0000.  data16 =  0;
--  data16 = 0000000000000000;
421 => X"0000",

-- L0198@01A6 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
422 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0199@01A7 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
423 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0200@01A8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
424 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0201@01A9 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
425 => X"0009",

-- L0202@01AA 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
426 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0203@01AB 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
427 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0204@01AC 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
428 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0205@01AD 0020.  data16 =  32;
--  data16 = 0000000000100000;
429 => X"0020",

-- L0206@01AE C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
430 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0207@01AF 0011.  data16 =  @vga_home1 - $;
--  data16 = 0000000000010001;
431 => X"0011",

-- L0208@01B0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
432 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0209@01B1 FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
433 => X"FFF5",

-- L0211@01B2 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
434 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0212@01B3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
435 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0213@01B4 0021.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100001;
436 => X"0021",

-- L0214@01B5 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
437 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0215@01B6 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
438 => X"0020",

-- L0216@01B7 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
439 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0217@01B8 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
440 => X"0007",

-- L0218@01B9 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
441 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0219@01BA B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
442 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0220@01BB 0003.  data16 =  @ClrDone - $;
--  data16 = 0000000000000011;
443 => X"0003",

-- L0221@01BC 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
444 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0222@01BD FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
445 => X"FFFC",

-- L0223@01BE 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
446 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0225@01BF 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
447 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0226@01C0 1120.vga_home1:  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
448 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0227@01C1 0000.  data16 =  0;
--  data16 = 0000000000000000;
449 => X"0000",

-- L0228@01C2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
450 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0229@01C3 FF83.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110000011;
451 => X"FF83",

-- L0231@01C4 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
452 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0232@01C5 FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
453 => X"FF3C",

-- L0233@01C6 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
454 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0234@01C7 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
455 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0235@01C8 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
456 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0236@01C9 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
457 => X"FF3D",

-- L0237@01CA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
458 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0238@01CB 0007.  data16 =  @GetCursorY - $;
--  data16 = 0000000000000111;
459 => X"0007",

-- L0240@01CC 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
460 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0241@01CD FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
461 => X"FF3E",

-- L0242@01CE 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
462 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0243@01CF 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
463 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0244@01D0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
464 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0245@01D1 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
465 => X"FF3F",

-- L0246@01D2 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
466 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0247@01D3 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
467 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0248@01D4 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
468 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0250@01D5 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
469 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0251@01D6 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
470 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0252@01D7 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
471 => X"FF00",

-- L0253@01D8 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
472 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0254@01D9 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
473 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0255@01DA 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
474 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0256@01DB 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
475 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0258@01DC 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
476 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0259@01DD 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
477 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0260@01DE 0006.  data16 =  @OutStrDone - $;
--  data16 = 0000000000000110;
478 => X"0006",

-- L0261@01DF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
479 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0262@01E0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
480 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0263@01E1 FF3B.  data16 =  @VGA_OutChr - $;
--  data16 = 1111111100111011;
481 => X"FF3B",

-- L0264@01E2 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
482 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0265@01E3 FFF9.  data16 =  @VGA_OutStr - $;
--  data16 = 1111111111111001;
483 => X"FFF9",

-- L0266@01E4 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
484 => X"4" & O"0" & O"0" & O"0" & O"2",

-- 544 location(s) in following ranges will be filled with default value
-- 0003 .. 0007
-- 01E5 .. 03FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

