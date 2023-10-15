--------------------------------------------------------
-- mcc V1.3.1008 - Custom microcode compiler (c)2020-... 
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
constant CODE_ADDRESS_WIDTH: 	positive := 9;
constant CODE_ADDRESS_LAST: 	positive := 511;


type hwd_code_memory is array(0 to 511) of std_logic_vector(15 downto 0);

signal hwd_uinstruction: std_logic_vector(15 downto 0);

--hwd_uinstruction <= hwd_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.r_p: .valfield 4 values NOP, LDP|JMP|JUMP|GOTO, ADP|BRANCH, STP2, STP3, STP4, STP5, M[IMM], BAC|IF_AC|IF_A_GE, BAZ|IF_AZ|IF_A_EQ, BXC|IF_XC|IF_X_GE, BXZ|IF_XZ|IF_X_EQ, BYC|IF_YC|IF_Y_GE, BYZ|IF_YZ|IF_Y_EQ, BSC|IF_SC|IF_S_GE, BSZ|IF_SZ|IF_S_EQ default NOP;
--
alias hwd_r_p: 	std_logic_vector(3 downto 0) is hwd_uinstruction(15 downto 12);
constant r_p_NOP: 	std_logic_vector(3 downto 0) := X"0";
constant r_p_LDP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_JMP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_JUMP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_GOTO: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_ADP: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_BRANCH: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_STP2: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_STP3: 	std_logic_vector(3 downto 0) := X"4";
constant r_p_STP4: 	std_logic_vector(3 downto 0) := X"5";
constant r_p_STP5: 	std_logic_vector(3 downto 0) := X"6";
constant r_p_M[IMM]: 	std_logic_vector(3 downto 0) := X"7";
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
-- with hwd_r_p select r_p <=
--      NOP when r_p_NOP, -- default value
--      LDP when r_p_LDP,
--      LDP when r_p_JMP,
--      LDP when r_p_JUMP,
--      LDP when r_p_GOTO,
--      ADP when r_p_ADP,
--      ADP when r_p_BRANCH,
--      STP2 when r_p_STP2,
--      STP3 when r_p_STP3,
--      STP4 when r_p_STP4,
--      STP5 when r_p_STP5,
--      M[IMM] when r_p_M[IMM],
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
-- L0031.r_a: .valfield 3 values NOA, LDA, XOR, SLC, SRC, ADC, SBC, STA|A default NOA;
--
alias hwd_r_a: 	std_logic_vector(2 downto 0) is hwd_uinstruction(11 downto 9);
constant r_a_NOA: 	std_logic_vector(2 downto 0) := O"0";
constant r_a_LDA: 	std_logic_vector(2 downto 0) := O"1";
constant r_a_XOR: 	std_logic_vector(2 downto 0) := O"2";
constant r_a_SLC: 	std_logic_vector(2 downto 0) := O"3";
constant r_a_SRC: 	std_logic_vector(2 downto 0) := O"4";
constant r_a_ADC: 	std_logic_vector(2 downto 0) := O"5";
constant r_a_SBC: 	std_logic_vector(2 downto 0) := O"6";
constant r_a_STA: 	std_logic_vector(2 downto 0) := O"7";
constant r_a_A: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with hwd_r_a select r_a <=
--      NOA when r_a_NOA, -- default value
--      LDA when r_a_LDA,
--      XOR when r_a_XOR,
--      SLC when r_a_SLC,
--      SRC when r_a_SRC,
--      ADC when r_a_ADC,
--      SBC when r_a_SBC,
--      STA when r_a_STA;
--      STA when r_a_A;
---- End boilerplate code

--
-- L0043.r_x: .valfield 3 values NOX, CPX, INX, DEX, LDX, ADX, M[X], STX|X default NOX;
--
alias hwd_r_x: 	std_logic_vector(2 downto 0) is hwd_uinstruction(8 downto 6);
constant r_x_NOX: 	std_logic_vector(2 downto 0) := O"0";
constant r_x_CPX: 	std_logic_vector(2 downto 0) := O"1";
constant r_x_INX: 	std_logic_vector(2 downto 0) := O"2";
constant r_x_DEX: 	std_logic_vector(2 downto 0) := O"3";
constant r_x_LDX: 	std_logic_vector(2 downto 0) := O"4";
constant r_x_ADX: 	std_logic_vector(2 downto 0) := O"5";
constant r_x_M[X]: 	std_logic_vector(2 downto 0) := O"6";
constant r_x_STX: 	std_logic_vector(2 downto 0) := O"7";
constant r_x_X: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with hwd_r_x select r_x <=
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
alias hwd_r_y: 	std_logic_vector(2 downto 0) is hwd_uinstruction(5 downto 3);
constant r_y_NOY: 	std_logic_vector(2 downto 0) := O"0";
constant r_y_CPY: 	std_logic_vector(2 downto 0) := O"1";
constant r_y_INY: 	std_logic_vector(2 downto 0) := O"2";
constant r_y_DEY: 	std_logic_vector(2 downto 0) := O"3";
constant r_y_LDY: 	std_logic_vector(2 downto 0) := O"4";
constant r_y_ADY: 	std_logic_vector(2 downto 0) := O"5";
constant r_y_M[Y]: 	std_logic_vector(2 downto 0) := O"6";
constant r_y_STY: 	std_logic_vector(2 downto 0) := O"7";
constant r_y_Y: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with hwd_r_y select r_y <=
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
-- L0066.r_s: .valfield 3 values NOS, CPS, M[POP], M[PUSH], LDS, ADS, M[S], STS|S default NOS;
--
alias hwd_r_s: 	std_logic_vector(2 downto 0) is hwd_uinstruction(2 downto 0);
constant r_s_NOS: 	std_logic_vector(2 downto 0) := O"0";
constant r_s_CPS: 	std_logic_vector(2 downto 0) := O"1";
constant r_s_M[POP]: 	std_logic_vector(2 downto 0) := O"2";
constant r_s_M[PUSH]: 	std_logic_vector(2 downto 0) := O"3";
constant r_s_LDS: 	std_logic_vector(2 downto 0) := O"4";
constant r_s_ADS: 	std_logic_vector(2 downto 0) := O"5";
constant r_s_M[S]: 	std_logic_vector(2 downto 0) := O"6";
constant r_s_STS: 	std_logic_vector(2 downto 0) := O"7";
constant r_s_S: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with hwd_r_s select r_s <=
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
-- L0086.data16: .valfield r_p .. r_s values * default 0;
--
alias hwd_data16: 	std_logic_vector(15 downto 0) is hwd_uinstruction(15 downto 0);
-- Values from X"0000" to X"FFFF" allowed
---- Start boilerplate code (use with utmost caution!)
--  data16 <= hwd_data16;
---- End boilerplate code



constant hwd_microcode: hwd_code_memory := (

-- L0019@0000.  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
0 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0020@0001.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
1 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0021@0002.  data16 =  @StrClear;
--  data16 = 0000000000001101;
2 => X"000D",

-- L0022@0003.DeadLoop:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
3 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0023@0004.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
4 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0024@0005.  data16 =  @Str2UART;
--  data16 = 0000000000011110;
5 => X"001E",

-- L0025@0006.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
6 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0026@0007.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
7 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0027@0008.  data16 =  @Str2VGA;
--  data16 = 0000000001011100;
8 => X"005C",

-- L0028@0009.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
9 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0029@000A.  data16 =  @StrHWorld;
--  data16 = 0000000000001111;
10 => X"000F",

-- L0030@000B.  BRANCH,;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
11 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0031@000C.  data16 =  @DeadLoop - $;
--  data16 = 1111111111110111;
12 => X"FFF7",

-- L0033@000D.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
13 => X"0001",

-- L0034@000E.  data16 =  0;
--  data16 = 0000000000000000;
14 => X"0000",

-- L0036@000F.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
15 => X"0048",

-- L0037@0010.  data16 =  'e';
--  data16 = 0000000001100101;
16 => X"0065",

-- L0038@0011.  data16 =  'l';
--  data16 = 0000000001101100;
17 => X"006C",

-- L0039@0012.  data16 =  'l';
--  data16 = 0000000001101100;
18 => X"006C",

-- L0040@0013.  data16 =  'o';
--  data16 = 0000000001101111;
19 => X"006F",

-- L0041@0014.  data16 =  ' ';
--  data16 = 0000000000100000;
20 => X"0020",

-- L0042@0015.  data16 =  'W';
--  data16 = 0000000001010111;
21 => X"0057",

-- L0043@0016.  data16 =  'o';
--  data16 = 0000000001101111;
22 => X"006F",

-- L0044@0017.  data16 =  'r';
--  data16 = 0000000001110010;
23 => X"0072",

-- L0045@0018.  data16 =  'l';
--  data16 = 0000000001101100;
24 => X"006C",

-- L0046@0019.  data16 =  'd';
--  data16 = 0000000001100100;
25 => X"0064",

-- L0047@001A.  data16 =  '!';
--  data16 = 0000000000100001;
26 => X"0021",

-- L0048@001B.  data16 =  0xD;
--  data16 = 0000000000001101;
27 => X"000D",

-- L0049@001C.  data16 =  0xA;
--  data16 = 0000000000001010;
28 => X"000A",

-- L0050@001D.  data16 =  0;
--  data16 = 0000000000000000;
29 => X"0000",

-- L0054@001E.Str2UART:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
30 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0055@001F.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
31 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0056@0020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
32 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0057@0021.  data16 =  0xE000;
--  data16 = 1110000000000000;
33 => X"E000",

-- L0058@0022.Str2ULoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
34 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0059@0023.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
35 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0060@0024.  data16 =  @Done - $;
--  data16 = 0000000000001100;
36 => X"000C",

-- L0061@0025.ChkTxdRdy:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
37 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0062@0026.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
38 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0063@0027.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
39 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0064@0028.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
40 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0065@0029.  data16 =  @Str2UOut - $;
--  data16 = 0000000000000011;
41 => X"0003",

-- L0066@002A.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
42 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0067@002B.  data16 =  @ChkTxdRdy - $;
--  data16 = 1111111111111010;
43 => X"FFFA",

-- L0068@002C.Str2UOut:  INY, LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 010, r_s = 000;
44 => X"0" & O"1" & O"6" & O"2" & O"0",

-- L0069@002D.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
45 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0070@002E.  DEY, INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 011, r_s = 000;
46 => X"2" & O"0" & O"2" & O"3" & O"0",

-- L0071@002F.  data16 =  @Str2ULoop - $;
--  data16 = 1111111111110011;
47 => X"FFF3",

-- L0072@0030.Done:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
48 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0073@0031.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
49 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0032.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
50 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0033.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
51 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0034.  data16 =  0;
--  data16 = 0000000000000000;
52 => X"0000",

-- L0006@0035.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
53 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@0036.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
54 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@0037.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
55 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@0038.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
56 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@0039.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
57 => X"FFFE",

-- L0013@003A.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
58 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@003B.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
59 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@003C.  data16 =  -1;
--  data16 = 1111111111111111;
60 => X"FFFF",

-- L0016@003D.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
61 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@003E.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
62 => X"FFF7",

-- L0021@003F.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
63 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0040.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
64 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0041.  data16 =  16;
--  data16 = 0000000000010000;
65 => X"0010",

-- L0024@0042.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
66 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0043.  data16 =  0;
--  data16 = 0000000000000000;
67 => X"0000",

-- L0027@0044.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
68 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0045.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
69 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@0046.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
70 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@0047.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
71 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@0048.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
72 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@0049.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
73 => X"0005",

-- L0033@004A.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
74 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@004B.  data16 =  0;
--  data16 = 0000000000000000;
75 => X"0000",

-- L0035@004C.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
76 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@004D.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
77 => X"0005",

-- L0037@004E.Y01:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
78 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0038@004F.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
79 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0050.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
80 => X"FFE2",

-- L0040@0051.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
81 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0052.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
82 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0053.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
83 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0054.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
84 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@0055.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
85 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@0056.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
86 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@0057.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
87 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@0058.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
88 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@0059.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
89 => X"FFEB",

-- L0049@005A.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
90 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@005B.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
91 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@005C.Str2VGA:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
92 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0009@005D.  STY, M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
93 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0011@005E.Str2VGALoop:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
94 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0012@005F.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
95 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0013@0060.  data16 =  @Str2VGAExit - $;
--  data16 = 0000000010000101;
96 => X"0085",

-- L0014@0061.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
97 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0015@0062.  data16 =  0xD;
--  data16 = 0000000000001101;
98 => X"000D",

-- L0016@0063.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
99 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0017@0064.  data16 =  @CarReturn - $;
--  data16 = 0000000001100001;
100 => X"0061",

-- L0019@0065.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
101 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0020@0066.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
102 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0021@0067.  data16 =  0xA;
--  data16 = 0000000000001010;
103 => X"000A",

-- L0022@0068.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
104 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0023@0069.  data16 =  @LineFeed - $;
--  data16 = 0000000001100011;
105 => X"0063",

-- L0025@006A.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
106 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0026@006B.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
107 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0027@006C.  data16 =  0x2;
--  data16 = 0000000000000010;
108 => X"0002",

-- L0028@006D.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
109 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0029@006E.  data16 =  @Cur2Home - $;
--  data16 = 0000000001110011;
110 => X"0073",

-- L0031@006F.  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
111 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0032@0070.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
112 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0033@0071.  data16 =  0x1;
--  data16 = 0000000000000001;
113 => X"0001",

-- L0034@0072.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
114 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0035@0073.  data16 =  @ClrScreen - $;
--  data16 = 0000000001011110;
115 => X"005E",

-- L0038@0074.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
116 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0039@0075.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
117 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0040@0076.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
118 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0041@0077.  data16 =  @GetCursorXY;
--  data16 = 0000000011110000;
119 => X"00F0",

-- L0042@0078.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
120 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@0079.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
121 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0044@007A.  data16 =  @DisplayAt - $;
--  data16 = 0000000010000000;
122 => X"0080",

-- L0045@007B.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
123 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0046@007C.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
124 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0047@007D.  data16 =  64;
--  data16 = 0000000001000000;
125 => X"0040",

-- L0048@007E.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0049@007F.  data16 =  @NextRow - $;
--  data16 = 0000000000000111;
127 => X"0007",

-- L0050@0080.NoScroll:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
128 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0051@0081.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
129 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0052@0082.  data16 =  @SetCursorXY;
--  data16 = 0000000011100111;
130 => X"00E7",

-- L0054@0083.NextChar:  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
131 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0055@0084.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
132 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0056@0085.  data16 =  @Str2VGALoop - $;
--  data16 = 1111111111011001;
133 => X"FFD9",

-- L0058@0086.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
134 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0059@0087.  data16 =  0;
--  data16 = 0000000000000000;
135 => X"0000",

-- L0060@0088.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
136 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0061@0089.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
137 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0062@008A.  data16 =  32;
--  data16 = 0000000000100000;
138 => X"0020",

-- L0063@008B.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
139 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0064@008C.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
140 => X"0003",

-- L0065@008D.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
141 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0066@008E.  data16 =  @NoScroll - $;
--  data16 = 1111111111110010;
142 => X"FFF2",

-- L0068@008F.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
143 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0069@0090.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
144 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0070@0091.  data16 =  0;
--  data16 = 0000000000000000;
145 => X"0000",

-- L0071@0092.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
146 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@0093.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
147 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0073@0094.  data16 =  0;
--  data16 = 0000000000000000;
148 => X"0000",

-- L0074@0095.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
149 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0075@0096.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
150 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0076@0097.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
151 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0077@0098.  data16 =  @GetRowBase - $;
--  data16 = 0000000000100101;
152 => X"0025",

-- L0078@0099.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
153 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0079@009A.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
154 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0080@009B.  data16 =  32;
--  data16 = 0000000000100000;
155 => X"0020",

-- L0081@009C.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
156 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0082@009D.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
157 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0083@009E.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
158 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0084@009F.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
159 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0085@00A0.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
160 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0086@00A1.  data16 =  64;
--  data16 = 0000000001000000;
161 => X"0040",

-- L0087@00A2.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
162 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0088@00A3.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
163 => X"0003",

-- L0089@00A4.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
164 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0090@00A5.  data16 =  @NxtCol;
--  data16 = 0000000010010101;
165 => X"0095",

-- L0091@00A6.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
166 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0092@00A7.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
167 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0093@00A8.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
168 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0094@00A9.  data16 =  32 - 1;
--  data16 = 0000000000011111;
169 => X"001F",

-- L0095@00AA.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
170 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0096@00AB.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
171 => X"0003",

-- L0097@00AC.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
172 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0098@00AD.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
173 => X"FFE5",

-- L0100@00AE.ClrLastRow:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
174 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0101@00AF.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
175 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0102@00B0.  data16 =  @GetRowBase - $;
--  data16 = 0000000000001101;
176 => X"000D",

-- L0103@00B1.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
177 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0104@00B2.  data16 =  0;
--  data16 = 0000000000000000;
178 => X"0000",

-- L0105@00B3.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
179 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0106@00B4.  data16 =  ' ';
--  data16 = 0000000000100000;
180 => X"0020",

-- L0107@00B5.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
181 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0108@00B6.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
182 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0109@00B7.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
183 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0110@00B8.  data16 =  64;
--  data16 = 0000000001000000;
184 => X"0040",

-- L0111@00B9.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
185 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0112@00BA.  data16 =  @ScrDone - $;
--  data16 = 0000000000001010;
186 => X"000A",

-- L0113@00BB.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
187 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0114@00BC.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
188 => X"FFF9",

-- L0117@00BD.GetRowBase:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
189 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0118@00BE.  data16 =  64;
--  data16 = 0000000001000000;
190 => X"0040",

-- L0119@00BF.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
191 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0120@00C0.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
192 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00C1.  data16 =  @MulU - $;
--  data16 = 1111111101111110;
193 => X"FF7E",

-- L0122@00C2.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
194 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0123@00C3.  data16 =  0x1000;
--  data16 = 0001000000000000;
195 => X"1000",

-- L0124@00C4.ScrDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
196 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0126@00C5.CarReturn:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
197 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0127@00C6.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
198 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0128@00C7.  data16 =  @GetCursorXY;
--  data16 = 0000000011110000;
199 => X"00F0",

-- L0129@00C8.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
200 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0130@00C9.  data16 =  0;
--  data16 = 0000000000000000;
201 => X"0000",

-- L0131@00CA.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
202 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0132@00CB.  data16 =  @NoScroll - $;
--  data16 = 1111111110110101;
203 => X"FFB5",

-- L0134@00CC.LineFeed:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
204 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0135@00CD.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
205 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0136@00CE.  data16 =  @GetCursorXY;
--  data16 = 0000000011110000;
206 => X"00F0",

-- L0137@00CF.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
207 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0138@00D0.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111000;
208 => X"FFB8",

-- L0140@00D1.ClrScreen:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
209 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0141@00D2.  data16 =  64;
--  data16 = 0000000001000000;
210 => X"0040",

-- L0142@00D3.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
211 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0143@00D4.  data16 =  32;
--  data16 = 0000000000100000;
212 => X"0020",

-- L0144@00D5.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
213 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0145@00D6.  JMP;
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
214 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0146@00D7.  data16 =  @MulU;
--  data16 = 0000000000111111;
215 => X"003F",

-- L0147@00D8.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
216 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0148@00D9.  data16 =  0x1000;
--  data16 = 0001000000000000;
217 => X"1000",

-- L0149@00DA.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
218 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0150@00DB.  data16 =  ' ';
--  data16 = 0000000000100000;
219 => X"0020",

-- L0151@00DC.ClrPos:  DEY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 011, r_s = 000;
220 => X"0" & O"0" & O"0" & O"3" & O"0",

-- L0152@00DD.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
221 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0153@00DE.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
222 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0154@00DF.  data16 =  @ClrPos - $;
--  data16 = 1111111111111101;
223 => X"FFFD",

-- L0155@00E0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
224 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0156@00E1.Cur2Home:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
225 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0157@00E2.  data16 =  0;
--  data16 = 0000000000000000;
226 => X"0000",

-- L0158@00E3.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
227 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@00E4.  data16 =  @NoScroll - $;
--  data16 = 1111111110011100;
228 => X"FF9C",

-- L0161@00E5.Str2VGAExit:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
229 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0162@00E6.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
230 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0164@00E7.SetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
231 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0165@00E8.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
232 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0166@00E9.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
233 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0167@00EA.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
234 => X"FF00",

-- L0168@00EB.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
235 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0169@00EC.  INY, r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
236 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0170@00ED.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
237 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0171@00EE.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
238 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0172@00EF.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
239 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0174@00F0.GetCursorXY:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
240 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0175@00F1.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
241 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0176@00F2.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
242 => X"FF00",

-- L0177@00F3.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
243 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0178@00F4.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
244 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0179@00F5.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
245 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0180@00F6.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
246 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0181@00F7.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
247 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0182@00F8.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
248 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0183@00F9.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
249 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0185@00FA.DisplayAt:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
250 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0186@00FB.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
251 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0187@00FC.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
252 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0188@00FD.  data16 =  64;
--  data16 = 0000000001000000;
253 => X"0040",

-- L0189@00FE.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
254 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0190@00FF.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
255 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0191@0100.  data16 =  @MulU - $;
--  data16 = 1111111100111111;
256 => X"FF3F",

-- L0192@0101.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
257 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0193@0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
258 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0194@0103.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
259 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0195@0104.  data16 =  0x1000;
--  data16 = 0001000000000000;
260 => X"1000",

-- L0196@0105.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
261 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0197@0106.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
262 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 249 location(s) in following ranges will be filled with default value
-- 0107 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

