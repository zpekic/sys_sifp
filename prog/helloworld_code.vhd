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

-- L0034@000D 023E.  data16 =  @GetOldCrsXY - $;
--  data16 = 0000001000111110;
13 => X"023E",

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

-- L0039@0012 024A.  data16 =  @GetRowBase - $;
--  data16 = 0000001001001010;
18 => X"024A",

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

-- L0046@0019 023A.  data16 =  @GetCursorXY - $;
--  data16 = 0000001000111010;
25 => X"023A",

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

-- L0057@0024 01B4.  data16 =  @SetOldCrsXY - $;
--  data16 = 0000000110110100;
36 => X"01B4",

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

-- L0063@0029 022A.  data16 =  @GetCursorXY - $;
--  data16 = 0000001000101010;
41 => X"022A",

-- L0064@002A 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
42 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0065@002B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
43 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@002C 0230.  data16 =  @GetRowBase - $;
--  data16 = 0000001000110000;
44 => X"0230",

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

-- L0081@0038 0146.  data16 =  @VGA_Init - $;
--  data16 = 0000000101000110;
56 => X"0146",

-- L0082@0039 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
57 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0083@003A 0285.  data16 =  @StrReady;
--  data16 = 0000001010000101;
58 => X"0285",

-- L0084@003B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
59 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0085@003C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
60 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0086@003D 0226.  data16 =  @VGA_OutStr - $;
--  data16 = 0000001000100110;
61 => X"0226",

-- L0088@003E 6FFF.  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
62 => X"6" & O"7" & O"7" & O"7" & O"7",

-- L0090@003F 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
63 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0091@0040 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
64 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0092@0041 00E4.  data16 =  @UART_Init - $;
--  data16 = 0000000011100100;
65 => X"00E4",

-- L0093@0042 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
66 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0094@0043 0285.  data16 =  @StrReady;
--  data16 = 0000001010000101;
67 => X"0285",

-- L0095@0044 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
68 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0096@0045 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
69 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0097@0046 012F.  data16 =  @UART_OutStr - $;
--  data16 = 0000000100101111;
70 => X"012F",

-- L0099@0047 0FFF.  r_p = NOP, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0000, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
71 => X"0" & O"7" & O"7" & O"7" & O"7",

-- L0104@0048 1020.MainLoop:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
72 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0105@0049 FF40.  data16 =  0xFF40;
--  data16 = 1111111101000000;
73 => X"FF40",

-- L0108@004A 1900.  LDX, LDA, M[IMM];
--  r_p = 0001, r_a = 100, r_x = 100, r_y = 000, r_s = 000;
74 => X"1" & O"4" & O"4" & O"0" & O"0",

-- L0109@004B 0000.  data16 =  0;
--  data16 = 0000000000000000;
75 => X"0000",

-- L0110@004C 0FB0.TxtClear:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
76 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0111@004D 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
77 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0112@004E 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
78 => X"0010",

-- L0113@004F A000.  IF_XC;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
79 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0114@0050 0003.  data16 =  @TxtCleared - $;
--  data16 = 0000000000000011;
80 => X"0003",

-- L0115@0051 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
81 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0116@0052 FFFA.  data16 =  @TxtClear - $;
--  data16 = 1111111111111010;
82 => X"FFFA",

-- L0118@0053 6FFF.TxtCleared:  r_p = STP2, r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0110, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
83 => X"6" & O"7" & O"7" & O"7" & O"7",

-- L0121@0054 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
84 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0122@0055 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
85 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0123@0056 002A.  data16 =  @CmdEdit - $;
--  data16 = 0000000000101010;
86 => X"002A",

-- L0124@0057 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
87 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0125@0058 0014.  data16 =  @ErrOrBrk - $;
--  data16 = 0000000000010100;
88 => X"0014",

-- L0128@0059 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
89 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0129@005A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
90 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0130@005B 0083.  data16 =  @Print - $;
--  data16 = 0000000010000011;
91 => X"0083",

-- L0133@005C 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
92 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0134@005D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
93 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0135@005E 0005.  data16 =  @CmdExec - $;
--  data16 = 0000000000000101;
94 => X"0005",

-- L0136@005F 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
95 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0137@0060 000C.  data16 =  @ErrOrBrk - $;
--  data16 = 0000000000001100;
96 => X"000C",

-- L0140@0061 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
97 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0141@0062 FFE6.  data16 =  @MainLoop - $;
--  data16 = 1111111111100110;
98 => X"FFE6",

-- L0146@0063 6003.CmdExec:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
99 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0147@0064 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
100 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0148@0065 00D9.  data16 =  @UART_IsBrk - $;
--  data16 = 0000000011011001;
101 => X"00D9",

-- L0149@0066 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
102 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0150@0067 0004.  data16 =  @CmdBreak - $;
--  data16 = 0000000000000100;
103 => X"0004",

-- L0151@0068 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
104 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0152@0069 FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
105 => X"FFFF",

-- L0153@006A 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
106 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0154@006B 4002.CmdBreak:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
107 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0156@006C 1020.ErrOrBrk:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
108 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0157@006D 026C.  data16 =  @StrBreak;
--  data16 = 0000001001101100;
109 => X"026C",

-- L0158@006E 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
110 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0159@006F FFFF.  data16 =  0xFFFF;
--  data16 = 1111111111111111;
111 => X"FFFF",

-- L0160@0070 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
112 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0161@0071 006D.  data16 =  @Print - $;
--  data16 = 0000000001101101;
113 => X"006D",

-- L0162@0072 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
114 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0163@0073 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
115 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0164@0074 0275.  data16 =  @StrError;
--  data16 = 0000001001110101;
116 => X"0275",

-- L0165@0075 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
117 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0166@0076 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
118 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0167@0077 0067.  data16 =  @Print - $;
--  data16 = 0000000001100111;
119 => X"0067",

-- L0168@0078 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
120 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0169@0079 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
121 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0170@007A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
122 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0171@007B 0073.  data16 =  @PrintHexA - $;
--  data16 = 0000000001110011;
123 => X"0073",

-- L0172@007C 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
124 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0173@007D 028B.  data16 =  @StrEnd;
--  data16 = 0000001010001011;
125 => X"028B",

-- L0174@007E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0175@007F 005F.  data16 =  @Print - $;
--  data16 = 0000000001011111;
127 => X"005F",

-- L0177@0080 6003.CmdEdit:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
128 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0178@0081 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0179@0082 00AC.  data16 =  @UART_GetChr - $;
--  data16 = 0000000010101100;
130 => X"00AC",

-- L0180@0083 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
131 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0182@0084 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
132 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0183@0085 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
133 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0184@0086 0061.  data16 =  @PrintChr - $;
--  data16 = 0000000001100001;
134 => X"0061",

-- L0186@0087 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
135 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0187@0088 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
136 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0188@0089 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
137 => X"000D",

-- L0189@008A 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
138 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0190@008B 0025.  data16 =  @LeaveEdit - $;
--  data16 = 0000000000100101;
139 => X"0025",

-- L0192@008C 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
140 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0193@008D 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
141 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0194@008E 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
142 => X"0003",

-- L0195@008F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
143 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0196@0090 001B.  data16 =  @BrkEdit - $;
--  data16 = 0000000000011011;
144 => X"001B",

-- L0198@0091 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
145 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0199@0092 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
146 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0200@0093 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
147 => X"0001",

-- L0201@0094 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
148 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0202@0095 0016.  data16 =  @BrkEdit - $;
--  data16 = 0000000000010110;
149 => X"0016",

-- L0204@0096 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
150 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0205@0097 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
151 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0206@0098 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
152 => X"0002",

-- L0207@0099 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
153 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0208@009A 0011.  data16 =  @BrkEdit - $;
--  data16 = 0000000000010001;
154 => X"0011",

-- L0210@009B 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
155 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0211@009C 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
156 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0212@009D 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
157 => X"0008",

-- L0213@009E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
158 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0214@009F 0017.  data16 =  @BSEdit - $;
--  data16 = 0000000000010111;
159 => X"0017",

-- L0217@00A0 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
160 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0218@00A1 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
161 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0219@00A2 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
162 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0220@00A3 0010.  data16 =  0x0010;
--  data16 = 0000000000010000;
163 => X"0010",

-- L0221@00A4 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
164 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0222@00A5 0026.  data16 =  @BumpEnd - $;
--  data16 = 0000000000100110;
165 => X"0026",

-- L0223@00A6 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
166 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0224@00A7 0000.  data16 =  0;
--  data16 = 0000000000000000;
167 => X"0000",

-- L0225@00A8 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
168 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0226@00A9 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
169 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0227@00AA FFD6.  data16 =  @CmdEdit - $;
--  data16 = 1111111111010110;
170 => X"FFD6",

-- L0230@00AB 0802.BrkEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
171 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0231@00AC 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
172 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0232@00AD 0001.  data16 =  1;
--  data16 = 0000000000000001;
173 => X"0001",

-- L0233@00AE 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
174 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0234@00AF 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
175 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0237@00B0 0802.LeaveEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
176 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0238@00B1 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
177 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0239@00B2 0000.  data16 =  0;
--  data16 = 0000000000000000;
178 => X"0000",

-- L0240@00B3 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
179 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0241@00B4 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
180 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0242@00B5 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
181 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0245@00B6 0802.BSEdit:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
182 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0246@00B7 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
183 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0247@00B8 0000.  data16 =  0;
--  data16 = 0000000000000000;
184 => X"0000",

-- L0248@00B9 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
185 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0249@00BA 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
186 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0250@00BB 0000.  data16 =  0;
--  data16 = 0000000000000000;
187 => X"0000",

-- L0251@00BC B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
188 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0252@00BD 0003.  data16 =  @BumpStart - $;
--  data16 = 0000000000000011;
189 => X"0003",

-- L0253@00BE 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
190 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0254@00BF FFC1.  data16 =  @CmdEdit - $;
--  data16 = 1111111111000001;
191 => X"FFC1",

-- L0256@00C0 01C3.BumpStart:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
192 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0257@00C1 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
193 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0258@00C2 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
194 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0259@00C3 027E.  data16 =  @StrBeep;
--  data16 = 0000001001111110;
195 => X"027E",

-- L0260@00C4 6003.Bumped:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
196 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0261@00C5 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
197 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0262@00C6 0018.  data16 =  @Print - $;
--  data16 = 0000000000011000;
198 => X"0018",

-- L0263@00C7 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
199 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0264@00C8 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
200 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0265@00C9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
201 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0266@00CA FFB6.  data16 =  @CmdEdit - $;
--  data16 = 1111111110110110;
202 => X"FFB6",

-- L0268@00CB 01C3.BumpEnd:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
203 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0269@00CC 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
204 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0270@00CD 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
205 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0271@00CE 0280.  data16 =  @StrBack;
--  data16 = 0000001010000000;
206 => X"0280",

-- L0272@00CF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
207 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0273@00D0 FFF4.  data16 =  @Bumped - $;
--  data16 = 1111111111110100;
208 => X"FFF4",

-- L0003@00D1 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
209 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@00D2 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
210 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@00D3 0000.  data16 =  0;
--  data16 = 0000000000000000;
211 => X"0000",

-- L0006@00D4 0400.ACSet:  SLC;
--  r_p = 0000, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
212 => X"0" & O"2" & O"0" & O"0" & O"0",

-- L0007@00D5 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
213 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0008@00D6 4002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
214 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0011@00D7 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
215 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@00D8 FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
216 => X"FFFE",

-- L0013@00D9 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
217 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@00DA 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
218 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0015@00DB FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
219 => X"FFFF",

-- L0016@00DC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@00DD FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
221 => X"FFF7",

-- L0019@00DE 0830.Print:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
222 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0020@00DF 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
223 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0021@00E0 0006.  data16 =  @PrintDone - $;
--  data16 = 0000000000000110;
224 => X"0006",

-- L0022@00E1 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
225 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0023@00E2 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
226 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0024@00E3 0004.  data16 =  @PrintChr - $;
--  data16 = 0000000000000100;
227 => X"0004",

-- L0025@00E4 2010.  INY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
228 => X"2" & O"0" & O"0" & O"2" & O"0",

-- L0026@00E5 FFF9.  data16 =  @Print - $;
--  data16 = 1111111111111001;
229 => X"FFF9",

-- L0027@00E6 4002.PrintDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
230 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0029@00E7 6003.PrintChr:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
231 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0030@00E8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
232 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@00E9 00B1.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010110001;
233 => X"00B1",

-- L0032@00EA 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
234 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0033@00EB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
235 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0034@00EC 006F.  data16 =  @UART_OutChr - $;
--  data16 = 0000000001101111;
236 => X"006F",

-- L0035@00ED 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
237 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0037@00EE 01C3.PrintHexA:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
238 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0038@00EF 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
239 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0040@00F0 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
240 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0041@00F1 000C.  data16 =  12;
--  data16 = 0000000000001100;
241 => X"000C",

-- L0042@00F2 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
242 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0043@00F3 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
243 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@00F4 0016.  data16 =  @PrintHex - $;
--  data16 = 0000000000010110;
244 => X"0016",

-- L0046@00F5 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
245 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0047@00F6 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
246 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0048@00F7 0008.  data16 =  8;
--  data16 = 0000000000001000;
247 => X"0008",

-- L0049@00F8 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
248 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0050@00F9 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
249 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@00FA 0010.  data16 =  @PrintHex - $;
--  data16 = 0000000000010000;
250 => X"0010",

-- L0053@00FB 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
251 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0054@00FC 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
252 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0055@00FD 0004.  data16 =  4;
--  data16 = 0000000000000100;
253 => X"0004",

-- L0056@00FE 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
254 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0057@00FF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
255 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0058@0100 000A.  data16 =  @PrintHex - $;
--  data16 = 0000000000001010;
256 => X"000A",

-- L0060@0101 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
257 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0061@0102 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
258 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0062@0103 0000.  data16 =  0;
--  data16 = 0000000000000000;
259 => X"0000",

-- L0063@0104 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
260 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0064@0105 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
261 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0065@0106 0004.  data16 =  @PrintHex - $;
--  data16 = 0000000000000100;
262 => X"0004",

-- L0067@0107 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
263 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0068@0108 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
264 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0069@0109 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
265 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0071@010A 1040.PrintHex:  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
266 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0072@010B 0000.  data16 =  0;
--  data16 = 0000000000000000;
267 => X"0000",

-- L0073@010C B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0074@010D 0003.  data16 =  @PrintHex1 - $;
--  data16 = 0000000000000011;
269 => X"0003",

-- L0075@010E 26C0.  SRC, DEX, BRANCH;
--  r_p = 0010, r_a = 011, r_x = 011, r_y = 000, r_s = 000;
270 => X"2" & O"3" & O"3" & O"0" & O"0",

-- L0076@010F FFFB.  data16 =  @PrintHex - $;
--  data16 = 1111111111111011;
271 => X"FFFB",

-- L0077@0110 1C00.PrintHex1:  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
272 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0078@0111 000F.  data16 =  0x000F;
--  data16 = 0000000000001111;
273 => X"000F",

-- L0079@0112 0F00.  LDX, A;
--  r_p = 0000, r_a = 111, r_x = 100, r_y = 000, r_s = 000;
274 => X"0" & O"7" & O"4" & O"0" & O"0",

-- L0080@0113 1140.  r_p = M[IMM], r_x = ADX;
--  r_p = 0001, r_a = 000, r_x = 101, r_y = 000, r_s = 000;
275 => X"1" & O"0" & O"5" & O"0" & O"0",

-- L0081@0114 0030.  data16 =  '0';
--  data16 = 0000000000110000;
276 => X"0030",

-- L0082@0115 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
277 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0083@0116 0030.  data16 =  '0';
--  data16 = 0000000000110000;
278 => X"0030",

-- L0084@0117 A000.  IF_XC;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
279 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0085@0118 0003.  data16 =  @ConvAtoF - $;
--  data16 = 0000000000000011;
280 => X"0003",

-- L0086@0119 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
281 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0087@011A 0003.  data16 =  @Conv0to9 - $;
--  data16 = 0000000000000011;
282 => X"0003",

-- L0088@011B 1140.ConvAtoF:  r_p = M[IMM], r_x = ADX;
--  r_p = 0001, r_a = 000, r_x = 101, r_y = 000, r_s = 000;
283 => X"1" & O"0" & O"5" & O"0" & O"0",

-- L0089@011C 0037.  data16 =  '7';
--  data16 = 0000000000110111;
284 => X"0037",

-- L0090@011D 09C0.Conv0to9:  LDA, X;
--  r_p = 0000, r_a = 100, r_x = 111, r_y = 000, r_s = 000;
285 => X"0" & O"4" & O"7" & O"0" & O"0",

-- L0091@011E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
286 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0092@011F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
287 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0093@0120 007A.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000001111010;
288 => X"007A",

-- L0094@0121 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
289 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0095@0122 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
290 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@0123 0038.  data16 =  @UART_OutChr - $;
--  data16 = 0000000000111000;
291 => X"0038",

-- L0097@0124 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
292 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0002@0125 1020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
293 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0003@0126 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
294 => X"E000",

-- L0004@0127 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
295 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0005@0128 0003.  data16 =  3;
--  data16 = 0000000000000011;
296 => X"0003",

-- L0006@0129 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
297 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0007@012A 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
298 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0008@012B 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
299 => X"0010",

-- L0009@012C 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
300 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0010@012D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
301 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0012@012E 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
302 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0013@012F 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
303 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0014@0130 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
304 => X"E000",

-- L0015@0131 6003.RdStatus0:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
305 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0016@0132 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
306 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@0133 0037.  data16 =  @GetStatus - $;
--  data16 = 0000000000110111;
307 => X"0037",

-- L0018@0134 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
308 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0019@0135 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
309 => X"0001",

-- L0020@0136 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
310 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0021@0137 FFFA.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111010;
311 => X"FFFA",

-- L0022@0138 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
312 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0023@0139 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
313 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@013A 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
314 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0025@013B 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
315 => X"00FF",

-- L0026@013C 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
316 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0027@013D 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
317 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0029@013E 0E03.UART_IsBrk:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
318 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0030@013F 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
319 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0031@0140 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
320 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0032@0141 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
321 => X"E000",

-- L0033@0142 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
322 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@0143 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
323 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@0144 0026.  data16 =  @GetStatus - $;
--  data16 = 0000000000100110;
324 => X"0026",

-- L0036@0145 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
325 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0037@0146 0001.  data16 =  0x0001;
--  data16 = 0000000000000001;
326 => X"0001",

-- L0038@0147 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
327 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0039@0148 0007.  data16 =  @NoBrk - $;
--  data16 = 0000000000000111;
328 => X"0007",

-- L0041@0149 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
329 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0042@014A 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
330 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0043@014B 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
331 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0044@014C 0003.  data16 =  0x3;
--  data16 = 0000000000000011;
332 => X"0003",

-- L0045@014D 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
333 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0046@014E 0005.  data16 =  @Brk - $;
--  data16 = 0000000000000101;
334 => X"0005",

-- L0048@014F 1800.NoBrk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
335 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0049@0150 0000.  data16 =  0;
--  data16 = 0000000000000000;
336 => X"0000",

-- L0050@0151 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
337 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@0152 0004.  data16 =  @BrkExit - $;
--  data16 = 0000000000000100;
338 => X"0004",

-- L0052@0153 1800.Brk:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
339 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0053@0154 0001.  data16 =  1;
--  data16 = 0000000000000001;
340 => X"0001",

-- L0054@0155 0600.  SRC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
341 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0055@0156 0022.BrkExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
342 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0056@0157 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
343 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0057@0158 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
344 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0059@0159 1800.UART_Beep:  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
345 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0060@015A 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
346 => X"0007",

-- L0061@015B 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
347 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0062@015C 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
348 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0063@015D 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
349 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0064@015E E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
350 => X"E000",

-- L0065@015F 6003.RdStatus1:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
351 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0066@0160 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
352 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0067@0161 0009.  data16 =  @GetStatus - $;
--  data16 = 0000000000001001;
353 => X"0009",

-- L0068@0162 1C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0001, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
354 => X"1" & O"6" & O"0" & O"0" & O"0",

-- L0069@0163 0002.  data16 =  0x0002;
--  data16 = 0000000000000010;
355 => X"0002",

-- L0070@0164 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
356 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0071@0165 FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
357 => X"FFFA",

-- L0072@0166 0812.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 010, r_s = 010;
358 => X"0" & O"4" & O"0" & O"2" & O"2",

-- L0073@0167 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
359 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0074@0168 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
360 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0075@0169 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
361 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0077@016A 0830.GetStatus:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
362 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0078@016B 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
363 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0079@016C 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
364 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0080@016D 0206.  XOR, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
365 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0081@016E 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
366 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0082@016F 0004.  data16 =  @StIsStable - $;
--  data16 = 0000000000000100;
367 => X"0004",

-- L0083@0170 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
368 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0084@0171 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
369 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0085@0172 FFF8.  data16 =  @GetStatus - $;
--  data16 = 1111111111111000;
370 => X"FFF8",

-- L0086@0173 0802.StIsStable:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
371 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0087@0174 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
372 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0089@0175 0980.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
373 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0090@0176 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
374 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0091@0177 0006.  data16 =  @UART_Done - $;
--  data16 = 0000000000000110;
375 => X"0006",

-- L0092@0178 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
376 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0093@0179 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
377 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0094@017A FFE1.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111100001;
378 => X"FFE1",

-- L0095@017B 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
379 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0096@017C FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
380 => X"FFF9",

-- L0097@017D 4002.UART_Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
381 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0010@017E 6003.VGA_Init:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
382 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0011@017F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
383 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0012@0180 FF51.  data16 =  @CLC - $;
--  data16 = 1111111101010001;
384 => X"FF51",

-- L0013@0181 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
385 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0014@0182 0040.  data16 =  64;
--  data16 = 0000000001000000;
386 => X"0040",

-- L0015@0183 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
387 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0016@0184 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
388 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0017@0185 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
389 => X"1000",

-- L0018@0186 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
390 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0019@0187 0020.  data16 =  32;
--  data16 = 0000000000100000;
391 => X"0020",

-- L0020@0188 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
392 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0021@0189 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
393 => X"FF00",

-- L0022@018A 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
394 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0023@018B 0830.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
395 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0024@018C 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
396 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0025@018D 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
397 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0026@018E B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
398 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0027@018F 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
399 => X"0003",

-- L0028@0190 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
400 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0029@0191 FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
401 => X"FFFA",

-- L0030@0192 0802.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
402 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0031@0193 1120.  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
403 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0032@0194 0000.  data16 =  0;
--  data16 = 0000000000000000;
404 => X"0000",

-- L0033@0195 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
405 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0034@0196 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
406 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0035@0197 0041.  data16 =  @SetOldCrsXY - $;
--  data16 = 0000000001000001;
407 => X"0041",

-- L0036@0198 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
408 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0037@0199 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
409 => X"0001",

-- L0042@019A 01C3.VGA_OutChr:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
410 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0043@019B 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
411 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0044@019C 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
412 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0046@019D 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
413 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0047@019E 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
414 => X"0002",

-- L0048@019F 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
415 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0049@01A0 00A6.  data16 =  @VGA_HOME - $;
--  data16 = 0000000010100110;
416 => X"00A6",

-- L0051@01A1 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
417 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0052@01A2 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
418 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0053@01A3 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
419 => X"0001",

-- L0054@01A4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
420 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0055@01A5 0083.  data16 =  @VGA_CLS - $;
--  data16 = 0000000010000011;
421 => X"0083",

-- L0057@01A6 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
422 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0058@01A7 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
423 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0059@01A8 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
424 => X"0007",

-- L0060@01A9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
425 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0061@01AA 002A.  data16 =  @VGA_Ignore - $;
--  data16 = 0000000000101010;
426 => X"002A",

-- L0063@01AB 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
427 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0064@01AC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
428 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0065@01AD 00A6.  data16 =  @GetCursorXY - $;
--  data16 = 0000000010100110;
429 => X"00A6",

-- L0067@01AE 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
430 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0068@01AF 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
431 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0069@01B0 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
432 => X"000D",

-- L0070@01B1 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
433 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0071@01B2 005F.  data16 =  @VGA_CR - $;
--  data16 = 0000000001011111;
434 => X"005F",

-- L0073@01B3 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
435 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0074@01B4 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
436 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0075@01B5 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
437 => X"000A",

-- L0076@01B6 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
438 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0077@01B7 006E.  data16 =  @VGA_LF - $;
--  data16 = 0000000001101110;
439 => X"006E",

-- L0079@01B8 0806.  LDA, M[S];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 110;
440 => X"0" & O"4" & O"0" & O"0" & O"6",

-- L0080@01B9 1200.  r_p = M[IMM], r_a = XOR;
--  r_p = 0001, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
441 => X"1" & O"1" & O"0" & O"0" & O"0",

-- L0081@01BA 0008.  data16 =  0x8;
--  data16 = 0000000000001000;
442 => X"0008",

-- L0082@01BB 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
443 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0083@01BC 005A.  data16 =  @VGA_BS - $;
--  data16 = 0000000001011010;
444 => X"005A",

-- L0086@01BD 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
445 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0088@01BE 0000.VGA_Print:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
446 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0089@01BF 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
447 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0090@01C0 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
448 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0091@01C1 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
449 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0092@01C2 009A.  data16 =  @GetRowBase - $;
--  data16 = 0000000010011010;
450 => X"009A",

-- L0093@01C3 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
451 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0094@01C4 00A2.  INX, r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 100, r_s = 010;
452 => X"0" & O"0" & O"2" & O"4" & O"2",

-- L0095@01C5 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
453 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0096@01C6 0040.  data16 =  64;
--  data16 = 0000000001000000;
454 => X"0040",

-- L0097@01C7 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
455 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0098@01C8 0019.  data16 =  @NextRow - $;
--  data16 = 0000000000011001;
456 => X"0019",

-- L0099@01C9 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
457 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0100@01CA 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
458 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0101@01CB FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
459 => X"FF3E",

-- L0102@01CC 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
460 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0103@01CD 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
461 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0104@01CE FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
462 => X"FF3F",

-- L0105@01CF 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
463 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0106@01D0 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
464 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0108@01D1 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
465 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0109@01D2 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
466 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0110@01D3 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
467 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0112@01D4 0802.VGA_Ignore:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
468 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0113@01D5 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
469 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0114@01D6 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
470 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0115@01D7 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
471 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0117@01D8 003B.SetOldCrsXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
472 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0118@01D9 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
473 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0119@01DA FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
474 => X"FF3C",

-- L0120@01DB 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
475 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0121@01DC 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
476 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0122@01DD FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
477 => X"FF3D",

-- L0123@01DE 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
478 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0124@01DF 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
479 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0125@01E0 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
480 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0127@01E1 1100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
481 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0128@01E2 0000.  data16 =  0;
--  data16 = 0000000000000000;
482 => X"0000",

-- L0129@01E3 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
483 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0130@01E4 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
484 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0131@01E5 0020.  data16 =  32;
--  data16 = 0000000000100000;
485 => X"0020",

-- L0132@01E6 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
486 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0133@01E7 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
487 => X"0003",

-- L0134@01E8 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
488 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0135@01E9 FFE0.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111100000;
489 => X"FFE0",

-- L0137@01EA 1020.ScrollUp:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
490 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0138@01EB 0000.  data16 =  0;
--  data16 = 0000000000000000;
491 => X"0000",

-- L0139@01EC 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
492 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0140@01ED 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
493 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0141@01EE 0000.  data16 =  0;
--  data16 = 0000000000000000;
494 => X"0000",

-- L0142@01EF 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
495 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0143@01F0 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
496 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0144@01F1 006B.  data16 =  @GetRowBase - $;
--  data16 = 0000000001101011;
497 => X"006B",

-- L0145@01F2 003B.NxtCol:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
498 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0146@01F3 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
499 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0147@01F4 0040.  data16 =  64;
--  data16 = 0000000001000000;
500 => X"0040",

-- L0148@01F5 09B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 110, r_s = 000;
501 => X"0" & O"4" & O"6" & O"6" & O"0",

-- L0149@01F6 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
502 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0150@01F7 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
503 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0151@01F8 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
504 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0152@01F9 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
505 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0153@01FA 0040.  data16 =  64;
--  data16 = 0000000001000000;
506 => X"0040",

-- L0154@01FB A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
507 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0155@01FC 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
508 => X"0003",

-- L0156@01FD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
509 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0157@01FE FFF4.  data16 =  @NxtCol - $;
--  data16 = 1111111111110100;
510 => X"FFF4",

-- L0158@01FF 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
511 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0159@0200 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
512 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0160@0201 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
513 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0161@0202 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
514 => X"001F",

-- L0162@0203 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
515 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0163@0204 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
516 => X"0003",

-- L0164@0205 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
517 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0165@0206 FFE6.  data16 =  @NxtRow - $;
--  data16 = 1111111111100110;
518 => X"FFE6",

-- L0167@0207 0000.ClrLastRow:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
519 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0168@0208 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
520 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0169@0209 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
521 => X"001F",

-- L0170@020A 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
522 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0171@020B 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
523 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0172@020C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
524 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0173@020D 002C.  data16 =  @ClearRow - $;
--  data16 = 0000000000101100;
525 => X"002C",

-- L0174@020E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
526 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0175@020F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
527 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0176@0210 0002.  data16 =  @SetX0 - $;
--  data16 = 0000000000000010;
528 => X"0002",

-- L0178@0211 0802.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
529 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0179@0212 1100.SetX0:  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
530 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0180@0213 0000.  data16 =  0;
--  data16 = 0000000000000000;
531 => X"0000",

-- L0181@0214 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
532 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0182@0215 FFB4.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110110100;
533 => X"FFB4",

-- L0184@0216 0802.VGA_BS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
534 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0185@0217 1040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0001, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
535 => X"1" & O"0" & O"1" & O"0" & O"0",

-- L0186@0218 0000.  data16 =  0;
--  data16 = 0000000000000000;
536 => X"0000",

-- L0187@0219 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
537 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0188@021A 0003.  data16 =  @PrevRow - $;
--  data16 = 0000000000000011;
538 => X"0003",

-- L0189@021B 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
539 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0190@021C FFAD.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110101101;
540 => X"FFAD",

-- L0191@021D 1008.PrevRow:  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
541 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0192@021E 0000.  data16 =  0;
--  data16 = 0000000000000000;
542 => X"0000",

-- L0193@021F D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
543 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0194@0220 FFA9.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110101001;
544 => X"FFA9",

-- L0195@0221 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
545 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0196@0222 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
546 => X"003F",

-- L0197@0223 2018.  DEY, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
547 => X"2" & O"0" & O"0" & O"3" & O"0",

-- L0198@0224 FFA5.  data16 =  @SetCursorXY - $;
--  data16 = 1111111110100101;
548 => X"FFA5",

-- L0200@0225 0802.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
549 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0201@0226 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
550 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0202@0227 FFBC.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111100;
551 => X"FFBC",

-- L0204@0228 0802.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
552 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0205@0229 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
553 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0206@022A 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
554 => X"0020",

-- L0207@022B 1020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
555 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0208@022C 0000.  data16 =  0;
--  data16 = 0000000000000000;
556 => X"0000",

-- L0209@022D 003B.ClrNextRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
557 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0210@022E 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
558 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0211@022F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
559 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0212@0230 0009.  data16 =  @ClearRow - $;
--  data16 = 0000000000001001;
560 => X"0009",

-- L0213@0231 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
561 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0214@0232 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
562 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0215@0233 1008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
563 => X"1" & O"0" & O"0" & O"1" & O"0",

-- L0216@0234 0020.  data16 =  32;
--  data16 = 0000000000100000;
564 => X"0020",

-- L0217@0235 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
565 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0218@0236 0011.  data16 =  @vga_home1 - $;
--  data16 = 0000000000010001;
566 => X"0011",

-- L0219@0237 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
567 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0220@0238 FFF5.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110101;
568 => X"FFF5",

-- L0222@0239 6003.ClearRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
569 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0223@023A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
570 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0224@023B 0021.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100001;
571 => X"0021",

-- L0225@023C 1800.  r_p = M[IMM], r_a = LDA;
--  r_p = 0001, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
572 => X"1" & O"4" & O"0" & O"0" & O"0",

-- L0226@023D 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
573 => X"0020",

-- L0227@023E 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
574 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0228@023F 0007.  data16 =  64 / 8 - 1;
--  data16 = 0000000000000111;
575 => X"0007",

-- L0229@0240 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
576 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0230@0241 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
577 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0231@0242 0003.  data16 =  @ClrDone - $;
--  data16 = 0000000000000011;
578 => X"0003",

-- L0232@0243 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
579 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0233@0244 FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
580 => X"FFFC",

-- L0234@0245 4002.ClrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
581 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0236@0246 0802.VGA_HOME:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
582 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0237@0247 1120.vga_home1:  LDX, LDY, M[IMM];
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
583 => X"1" & O"0" & O"4" & O"4" & O"0",

-- L0238@0248 0000.  data16 =  0;
--  data16 = 0000000000000000;
584 => X"0000",

-- L0239@0249 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
585 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0240@024A FF7F.  data16 =  @SetCursorXY - $;
--  data16 = 1111111101111111;
586 => X"FF7F",

-- L0242@024B 1020.GetOldCrsXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
587 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0243@024C FF3C.  data16 =  0xFF00 + 60;
--  data16 = 1111111100111100;
588 => X"FF3C",

-- L0244@024D 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
589 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0245@024E 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
590 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0246@024F 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
591 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0247@0250 FF3D.  data16 =  0xFF00 + 61;
--  data16 = 1111111100111101;
592 => X"FF3D",

-- L0248@0251 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
593 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0249@0252 0007.  data16 =  @GetCursorY - $;
--  data16 = 0000000000000111;
594 => X"0007",

-- L0251@0253 1020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
595 => X"1" & O"0" & O"0" & O"4" & O"0",

-- L0252@0254 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
596 => X"FF3E",

-- L0253@0255 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
597 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0254@0256 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
598 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0255@0257 1100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0001, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
599 => X"1" & O"0" & O"4" & O"0" & O"0",

-- L0256@0258 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
600 => X"FF3F",

-- L0257@0259 01A0.GetCursorY:  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
601 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0258@025A 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
602 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0259@025B 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
603 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0261@025C 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
604 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0262@025D 1028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
605 => X"1" & O"0" & O"0" & O"5" & O"0",

-- L0263@025E FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
606 => X"FF00",

-- L0264@025F 0830.  LDA, M[Y];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 110, r_s = 000;
607 => X"0" & O"4" & O"0" & O"6" & O"0",

-- L0265@0260 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
608 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0266@0261 0802.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 010;
609 => X"0" & O"4" & O"0" & O"0" & O"2",

-- L0267@0262 4002.  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
610 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0269@0263 0980.VGA_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 100, r_x = 110, r_y = 000, r_s = 000;
611 => X"0" & O"4" & O"6" & O"0" & O"0",

-- L0270@0264 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
612 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0271@0265 0006.  data16 =  @OutStrDone - $;
--  data16 = 0000000000000110;
613 => X"0006",

-- L0272@0266 6003.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0110, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
614 => X"6" & O"0" & O"0" & O"0" & O"3",

-- L0273@0267 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
615 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0274@0268 FF32.  data16 =  @VGA_OutChr - $;
--  data16 = 1111111100110010;
616 => X"FF32",

-- L0275@0269 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
617 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0276@026A FFF9.  data16 =  @VGA_OutStr - $;
--  data16 = 1111111111111001;
618 => X"FFF9",

-- L0277@026B 4002.OutStrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0100, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
619 => X"4" & O"0" & O"0" & O"0" & O"2",

-- L0003@026C 000D.StrBreak:  data16 =  0xD;
--  data16 = 0000000000001101;
620 => X"000D",

-- L0004@026D 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
621 => X"000A",

-- L0005@026E 002A.  data16 =  '*';
--  data16 = 0000000000101010;
622 => X"002A",

-- L0006@026F 0042.  data16 =  'B';
--  data16 = 0000000001000010;
623 => X"0042",

-- L0007@0270 0052.  data16 =  'R';
--  data16 = 0000000001010010;
624 => X"0052",

-- L0008@0271 0045.  data16 =  'E';
--  data16 = 0000000001000101;
625 => X"0045",

-- L0009@0272 0041.  data16 =  'A';
--  data16 = 0000000001000001;
626 => X"0041",

-- L0010@0273 004B.  data16 =  'K';
--  data16 = 0000000001001011;
627 => X"004B",

-- L0012@0274 0000.  data16 =  0;
--  data16 = 0000000000000000;
628 => X"0000",

-- L0014@0275 000D.StrError:  data16 =  0xD;
--  data16 = 0000000000001101;
629 => X"000D",

-- L0015@0276 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
630 => X"000A",

-- L0016@0277 002A.  data16 =  '*';
--  data16 = 0000000000101010;
631 => X"002A",

-- L0017@0278 0045.  data16 =  'E';
--  data16 = 0000000001000101;
632 => X"0045",

-- L0018@0279 0052.  data16 =  'R';
--  data16 = 0000000001010010;
633 => X"0052",

-- L0019@027A 0052.  data16 =  'R';
--  data16 = 0000000001010010;
634 => X"0052",

-- L0020@027B 004F.  data16 =  'O';
--  data16 = 0000000001001111;
635 => X"004F",

-- L0021@027C 0052.  data16 =  'R';
--  data16 = 0000000001010010;
636 => X"0052",

-- L0022@027D 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
637 => X"0020",

-- L0023@027E 0007.StrBeep:  data16 =  0x7;
--  data16 = 0000000000000111;
638 => X"0007",

-- L0024@027F 0000.  data16 =  0;
--  data16 = 0000000000000000;
639 => X"0000",

-- L0026@0280 0008.StrBack:  data16 =  0x8;
--  data16 = 0000000000001000;
640 => X"0008",

-- L0027@0281 0007.  data16 =  0x7;
--  data16 = 0000000000000111;
641 => X"0007",

-- L0028@0282 0000.  data16 =  0;
--  data16 = 0000000000000000;
642 => X"0000",

-- L0030@0283 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
643 => X"0001",

-- L0031@0284 0000.  data16 =  0;
--  data16 = 0000000000000000;
644 => X"0000",

-- L0033@0285 0052.StrReady:  data16 =  'R';
--  data16 = 0000000001010010;
645 => X"0052",

-- L0034@0286 0065.  data16 =  'e';
--  data16 = 0000000001100101;
646 => X"0065",

-- L0035@0287 0061.  data16 =  'a';
--  data16 = 0000000001100001;
647 => X"0061",

-- L0036@0288 0064.  data16 =  'd';
--  data16 = 0000000001100100;
648 => X"0064",

-- L0037@0289 0079.  data16 =  'y';
--  data16 = 0000000001111001;
649 => X"0079",

-- L0038@028A 002E.  data16 =  ' 002E.';
--  data16 = 0000000000101110;
650 => X"002E",

-- L0039@028B 000D.StrEnd:  data16 =  0xD;
--  data16 = 0000000000001101;
651 => X"000D",

-- L0040@028C 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
652 => X"000A",

-- L0041@028D 0000.  data16 =  0;
--  data16 = 0000000000000000;
653 => X"0000",

-- 375 location(s) in following ranges will be filled with default value
-- 0003 .. 0007
-- 028E .. 03FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

