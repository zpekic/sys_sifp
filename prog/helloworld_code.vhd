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
constant CODE_ADDRESS_WIDTH: 	positive := 9;
constant CODE_ADDRESS_LAST: 	positive := 511;


type cpu_code_memory is array(0 to 511) of std_logic_vector(15 downto 0);

signal cpu_uinstruction: std_logic_vector(15 downto 0);

--cpu_uinstruction <= cpu_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.r_p: .valfield 4 values NOP, LDP, BRANCH|IF_TRUE, JUMP|GOTO, P4, P2, P0, M[IMM], BAC|IF_AC|IF_A_GE, BAZ|IF_AZ|IF_A_EQ, BXC|IF_XC|IF_X_GE, BXZ|IF_XZ|IF_X_EQ, BYC|IF_YC|IF_Y_GE, BYZ|IF_YZ|IF_Y_EQ, BSC|IF_SC|IF_S_GE, BSZ|IF_SZ|IF_S_EQ default NOP;
--
alias cpu_r_p: 	std_logic_vector(3 downto 0) is cpu_uinstruction(15 downto 12);
constant r_p_NOP: 	std_logic_vector(3 downto 0) := X"0";
constant r_p_LDP: 	std_logic_vector(3 downto 0) := X"1";
constant r_p_BRANCH: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_IF_TRUE: 	std_logic_vector(3 downto 0) := X"2";
constant r_p_JUMP: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_GOTO: 	std_logic_vector(3 downto 0) := X"3";
constant r_p_P4: 	std_logic_vector(3 downto 0) := X"4";
constant r_p_P2: 	std_logic_vector(3 downto 0) := X"5";
constant r_p_P0: 	std_logic_vector(3 downto 0) := X"6";
constant r_p_M_IMM: 	std_logic_vector(3 downto 0) := X"7";
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
--      LDP when r_p_LDP,
--      BRANCH when r_p_BRANCH,
--      BRANCH when r_p_IF_TRUE,
--      JUMP when r_p_JUMP,
--      JUMP when r_p_GOTO,
--      P4 when r_p_P4,
--      P2 when r_p_P2,
--      P0 when r_p_P0,
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
-- L0031.r_a: .valfield 3 values NOA, LDA, XOR, SLC, SRC, ADC, AND, STA|A default NOA;
--
alias cpu_r_a: 	std_logic_vector(2 downto 0) is cpu_uinstruction(11 downto 9);
constant r_a_NOA: 	std_logic_vector(2 downto 0) := O"0";
constant r_a_LDA: 	std_logic_vector(2 downto 0) := O"1";
constant r_a_XOR: 	std_logic_vector(2 downto 0) := O"2";
constant r_a_SLC: 	std_logic_vector(2 downto 0) := O"3";
constant r_a_SRC: 	std_logic_vector(2 downto 0) := O"4";
constant r_a_ADC: 	std_logic_vector(2 downto 0) := O"5";
constant r_a_AND: 	std_logic_vector(2 downto 0) := O"6";
constant r_a_STA: 	std_logic_vector(2 downto 0) := O"7";
constant r_a_A: 	std_logic_vector(2 downto 0) := O"7";
---- Start boilerplate code (use with utmost caution!)
-- with cpu_r_a select r_a <=
--      NOA when r_a_NOA, -- default value
--      LDA when r_a_LDA,
--      XOR when r_a_XOR,
--      SLC when r_a_SLC,
--      SRC when r_a_SRC,
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

-- L0021@0001 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
1 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0022@0002 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
2 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0023@0003 007A.  data16 =  @VGA_Init - $;
--  data16 = 0000000001111010;
3 => X"007A",

-- L0025@0004 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
4 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0026@0005 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
5 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0027@0006 0044.  data16 =  @UART_Init - $;
--  data16 = 0000000001000100;
6 => X"0044",

-- L0043@0007 5003.EchoLoop:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
7 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0044@0008 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
8 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0045@0009 0009.  data16 =  @UART_GetChr - $;
--  data16 = 0000000000001001;
9 => X"0009",

-- L0046@000A 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
10 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0047@000B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
11 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0048@000C 0015.  data16 =  @UART_OutChr - $;
--  data16 = 0000000000010101;
12 => X"0015",

-- L0049@000D 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
13 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0050@000E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
14 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0051@000F 0085.  data16 =  @VGA_OutChr - $;
--  data16 = 0000000010000101;
15 => X"0085",

-- L0052@0010 3000.  JUMP;
--  r_p = 0011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
16 => X"3" & O"0" & O"0" & O"0" & O"0",

-- L0053@0011 0007.  data16 =  @EchoLoop;
--  data16 = 0000000000000111;
17 => X"0007",

-- L0055@0012 003B.UART_GetChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
18 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0056@0013 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
19 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0057@0014 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
20 => X"E000",

-- L0058@0015 0230.RdStatus0:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
21 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0059@0016 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
22 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0060@0017 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
23 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0061@0018 0003.  data16 =  @GetChr - $;
--  data16 = 0000000000000011;
24 => X"0003",

-- L0062@0019 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0063@001A FFFB.  data16 =  @RdStatus0 - $;
--  data16 = 1111111111111011;
26 => X"FFFB",

-- L0064@001B 0010.GetChr:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
27 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0065@001C 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
28 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0066@001D 7C00.  r_p = M[IMM], r_a = AND;
--  r_p = 0111, r_a = 110, r_x = 000, r_y = 000, r_s = 000;
29 => X"7" & O"6" & O"0" & O"0" & O"0",

-- L0067@001E 00FF.  data16 =  0x00FF;
--  data16 = 0000000011111111;
30 => X"00FF",

-- L0068@001F 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
31 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0069@0020 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
32 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0071@0021 003B.UART_OutChr:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
33 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0072@0022 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
34 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0073@0023 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
35 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0074@0024 E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
36 => X"E000",

-- L0075@0025 0230.RdStatus1:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
37 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0076@0026 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
38 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0077@0027 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
39 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0078@0028 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
40 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0079@0029 0003.  data16 =  @OutChr - $;
--  data16 = 0000000000000011;
41 => X"0003",

-- L0080@002A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
42 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0081@002B FFFA.  data16 =  @RdStatus1 - $;
--  data16 = 1111111111111010;
43 => X"FFFA",

-- L0082@002C 0212.OutChr:  INY, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 010, r_s = 010;
44 => X"0" & O"1" & O"0" & O"2" & O"2",

-- L0083@002D 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
45 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0084@002E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
46 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0085@002F 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
47 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0087@0030 0380.UART_OutStr:  LDA, M[X];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 000, r_s = 000;
48 => X"0" & O"1" & O"6" & O"0" & O"0",

-- L0088@0031 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
49 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0089@0032 0006.  data16 =  @Done - $;
--  data16 = 0000000000000110;
50 => X"0006",

-- L0090@0033 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
51 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0091@0034 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
52 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0092@0035 FFEC.  data16 =  @UART_OutChr - $;
--  data16 = 1111111111101100;
53 => X"FFEC",

-- L0093@0036 2080.  INX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
54 => X"2" & O"0" & O"2" & O"0" & O"0",

-- L0094@0037 FFF9.  data16 =  @UART_OutStr - $;
--  data16 = 1111111111111001;
55 => X"FFF9",

-- L0095@0038 1002.Done:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
56 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0097@0039 0001.StrClear:  data16 =  0x1;
--  data16 = 0000000000000001;
57 => X"0001",

-- L0098@003A 0000.  data16 =  0;
--  data16 = 0000000000000000;
58 => X"0000",

-- L0100@003B 0048.StrHWorld:  data16 =  'H';
--  data16 = 0000000001001000;
59 => X"0048",

-- L0101@003C 0065.  data16 =  'e';
--  data16 = 0000000001100101;
60 => X"0065",

-- L0102@003D 006C.  data16 =  'l';
--  data16 = 0000000001101100;
61 => X"006C",

-- L0103@003E 006C.  data16 =  'l';
--  data16 = 0000000001101100;
62 => X"006C",

-- L0104@003F 006F.  data16 =  'o';
--  data16 = 0000000001101111;
63 => X"006F",

-- L0105@0040 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
64 => X"0020",

-- L0106@0041 0057.  data16 =  'W';
--  data16 = 0000000001010111;
65 => X"0057",

-- L0107@0042 006F.  data16 =  'o';
--  data16 = 0000000001101111;
66 => X"006F",

-- L0108@0043 0072.  data16 =  'r';
--  data16 = 0000000001110010;
67 => X"0072",

-- L0109@0044 006C.  data16 =  'l';
--  data16 = 0000000001101100;
68 => X"006C",

-- L0110@0045 0064.  data16 =  'd';
--  data16 = 0000000001100100;
69 => X"0064",

-- L0111@0046 0021.  data16 =  '!';
--  data16 = 0000000000100001;
70 => X"0021",

-- L0112@0047 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
71 => X"000D",

-- L0113@0048 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
72 => X"000A",

-- L0114@0049 0000.  data16 =  0;
--  data16 = 0000000000000000;
73 => X"0000",

-- L0117@004A 7020.UART_Init:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
74 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0118@004B E000.  data16 =  0xE000;
--  data16 = 1110000000000000;
75 => X"E000",

-- L0119@004C 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
76 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0120@004D 0003.  data16 =  3;
--  data16 = 0000000000000011;
77 => X"0003",

-- L0121@004E 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
78 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0122@004F 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
79 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0123@0050 0010.  data16 =  0x10;
--  data16 = 0000000000010000;
80 => X"0010",

-- L0124@0051 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
81 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0125@0052 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
82 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0003@0053 0E03.CLC:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
83 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0004@0054 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
84 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0005@0055 0000.  data16 =  0;
--  data16 = 0000000000000000;
85 => X"0000",

-- L0006@0056 0600.ACSet:  SLC;
--  r_p = 0000, r_a = 011, r_x = 000, r_y = 000, r_s = 000;
86 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0007@0057 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
87 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0008@0058 1002.ACDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
88 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0011@0059 8000.SEC:  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
89 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0012@005A FFFE.  data16 =  @ACDone - $;
--  data16 = 1111111111111110;
90 => X"FFFE",

-- L0013@005B 0E03.CSet:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
91 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@005C 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
92 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0015@005D FFFF.  data16 =  -1;
--  data16 = 1111111111111111;
93 => X"FFFF",

-- L0016@005E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
94 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0017@005F FFF7.  data16 =  @ACSet - $;
--  data16 = 1111111111110111;
95 => X"FFF7",

-- L0021@0060 01C3.MulU:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
96 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0022@0061 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
97 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0023@0062 0010.  data16 =  16;
--  data16 = 0000000000010000;
98 => X"0010",

-- L0024@0063 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
99 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0025@0064 0000.  data16 =  0;
--  data16 = 0000000000000000;
100 => X"0000",

-- L0027@0065 0E03.CheckY0:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
101 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0028@0066 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
102 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0029@0067 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
103 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0030@0068 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
104 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0031@0069 8000.  IF_AC;
--  r_p = 1000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
105 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0032@006A 0005.  data16 =  @Y01 - $;
--  data16 = 0000000000000101;
106 => X"0005",

-- L0033@006B 7A00.Y00:  r_p = M[IMM], r_a = ADC;
--  r_p = 0111, r_a = 101, r_x = 000, r_y = 000, r_s = 000;
107 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0034@006C 0000.  data16 =  0;
--  data16 = 0000000000000000;
108 => X"0000",

-- L0035@006D 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
109 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0036@006E 0005.  data16 =  @Nextbit - $;
--  data16 = 0000000000000101;
110 => X"0005",

-- L0037@006F 5003.Y01:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
111 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0038@0070 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
112 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0039@0071 FFE2.  data16 =  @CLC - $;
--  data16 = 1111111111100010;
113 => X"FFE2",

-- L0040@0072 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
114 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0041@0073 0800.Nextbit:  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
115 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0042@0074 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
116 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0043@0075 0238.  LDA, Y;
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 111, r_s = 000;
117 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0044@0076 0800.  SRC;
--  r_p = 0000, r_a = 100, r_x = 000, r_y = 000, r_s = 000;
118 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0045@0077 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
119 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0046@0078 02C2.  DEX, LDA, M[POP];
--  r_p = 0000, r_a = 001, r_x = 011, r_y = 000, r_s = 010;
120 => X"0" & O"1" & O"3" & O"0" & O"2",

-- L0047@0079 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
121 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0048@007A FFEB.  data16 =  @CheckY0 - $;
--  data16 = 1111111111101011;
122 => X"FFEB",

-- L0049@007B 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
123 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0050@007C 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
124 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0008@007D 5003.VGA_Init:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
125 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0009@007E 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
126 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0010@007F FFD4.  data16 =  @CLC - $;
--  data16 = 1111111111010100;
127 => X"FFD4",

-- L0011@0080 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
128 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0012@0081 0040.  data16 =  64;
--  data16 = 0000000001000000;
129 => X"0040",

-- L0013@0082 0E03.  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
130 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0014@0083 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
131 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0015@0084 0020.  data16 =  32;
--  data16 = 0000000000100000;
132 => X"0020",

-- L0016@0085 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
133 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0017@0086 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
134 => X"FF00",

-- L0018@0087 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
135 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0019@0088 0000.  data16 =  0;
--  data16 = 0000000000000000;
136 => X"0000",

-- L0020@0089 0E30.  STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 110, r_s = 000;
137 => X"0" & O"7" & O"0" & O"6" & O"0",

-- L0021@008A 0230.RowOffLoop:  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
138 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0022@008B 0A16.  INY, ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 010, r_s = 110;
139 => X"0" & O"5" & O"0" & O"2" & O"6",

-- L0023@008C 0EF0.  DEX, STA, M[Y];
--  r_p = 0000, r_a = 111, r_x = 011, r_y = 110, r_s = 000;
140 => X"0" & O"7" & O"3" & O"6" & O"0",

-- L0024@008D B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
141 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0025@008E 0003.  data16 =  @RowOffDone - $;
--  data16 = 0000000000000011;
142 => X"0003",

-- L0026@008F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
143 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0027@0090 FFFA.  data16 =  @RowOffLoop - $;
--  data16 = 1111111111111010;
144 => X"FFFA",

-- L0028@0091 0202.RowOffDone:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
145 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0029@0092 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
146 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0030@0093 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
147 => X"0001",

-- L0034@0094 0E03.VGA_OutChr:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
148 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0036@0095 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
149 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0037@0096 0002.  data16 =  0x2;
--  data16 = 0000000000000010;
150 => X"0002",

-- L0038@0097 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
151 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0039@0098 007D.  data16 =  @VGA_HOME - $;
--  data16 = 0000000001111101;
152 => X"007D",

-- L0041@0099 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
153 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0042@009A 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
154 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0043@009B 0001.  data16 =  0x1;
--  data16 = 0000000000000001;
155 => X"0001",

-- L0044@009C 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
156 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0045@009D 005F.  data16 =  @VGA_CLS - $;
--  data16 = 0000000001011111;
157 => X"005F",

-- L0047@009E 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
158 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0048@009F 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
159 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0049@00A0 0079.  data16 =  @GetCursorXY - $;
--  data16 = 0000000001111001;
160 => X"0079",

-- L0051@00A1 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
161 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0052@00A2 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
162 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0053@00A3 000D.  data16 =  0xD;
--  data16 = 0000000000001101;
163 => X"000D",

-- L0054@00A4 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
164 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0055@00A5 0048.  data16 =  @VGA_CR - $;
--  data16 = 0000000001001000;
165 => X"0048",

-- L0057@00A6 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
166 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0058@00A7 7400.  r_p = M[IMM], r_a = XOR;
--  r_p = 0111, r_a = 010, r_x = 000, r_y = 000, r_s = 000;
167 => X"7" & O"2" & O"0" & O"0" & O"0",

-- L0059@00A8 000A.  data16 =  0xA;
--  data16 = 0000000000001010;
168 => X"000A",

-- L0060@00A9 9000.  IF_AZ;
--  r_p = 1001, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
169 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0061@00AA 004F.  data16 =  @VGA_LF - $;
--  data16 = 0000000001001111;
170 => X"004F",

-- L0065@00AB 0206.  LDA, M[S];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 110;
171 => X"0" & O"1" & O"0" & O"0" & O"6",

-- L0066@00AC 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
172 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0067@00AD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
173 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0068@00AE 007B.  data16 =  @DisplayAt - $;
--  data16 = 0000000001111011;
174 => X"007B",

-- L0069@00AF 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
175 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0070@00B0 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
176 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0071@00B1 0040.  data16 =  64;
--  data16 = 0000000001000000;
177 => X"0040",

-- L0072@00B2 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
178 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0073@00B3 0003.  data16 =  @NextRow - $;
--  data16 = 0000000000000011;
179 => X"0003",

-- L0074@00B4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
180 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0075@00B5 003B.  data16 =  @SetCursorXY - $;
--  data16 = 0000000000111011;
181 => X"003B",

-- L0077@00B6 7100.NextRow:  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
182 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0078@00B7 0000.  data16 =  0;
--  data16 = 0000000000000000;
183 => X"0000",

-- L0079@00B8 0010.NextRow1:  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
184 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0080@00B9 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
185 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0081@00BA 0020.  data16 =  32;
--  data16 = 0000000000100000;
186 => X"0020",

-- L0082@00BB C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
187 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0083@00BC 0003.  data16 =  @ScrollUp - $;
--  data16 = 0000000000000011;
188 => X"0003",

-- L0084@00BD 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
189 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0085@00BE 0032.  data16 =  @SetCursorXY - $;
--  data16 = 0000000000110010;
190 => X"0032",

-- L0087@00BF 0000.ScrollUp:  NOP;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
191 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0088@00C0 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
192 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0089@00C1 0000.  data16 =  0;
--  data16 = 0000000000000000;
193 => X"0000",

-- L0090@00C2 003B.NxtRow:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
194 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0091@00C3 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
195 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0092@00C4 0000.  data16 =  0;
--  data16 = 0000000000000000;
196 => X"0000",

-- L0093@00C5 01C3.NxtCol:  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
197 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0094@00C6 5003.  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
198 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0095@00C7 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
199 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0096@00C8 005A.  data16 =  @GetRowBase - $;
--  data16 = 0000000001011010;
200 => X"005A",

-- L0097@00C9 003B.  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
201 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0098@00CA 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
202 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0099@00CB 0020.  data16 =  32;
--  data16 = 0000000000100000;
203 => X"0020",

-- L0100@00CC 03B0.  LDA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 001, r_x = 110, r_y = 110, r_s = 000;
204 => X"0" & O"1" & O"6" & O"6" & O"0",

-- L0101@00CD 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
205 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0102@00CE 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
206 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0103@00CF 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
207 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0104@00D0 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
208 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0105@00D1 0040.  data16 =  64;
--  data16 = 0000000001000000;
209 => X"0040",

-- L0106@00D2 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
210 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0107@00D3 0003.  data16 =  @ChkRow - $;
--  data16 = 0000000000000011;
211 => X"0003",

-- L0108@00D4 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
212 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0109@00D5 00C5.  data16 =  @NxtCol;
--  data16 = 0000000011000101;
213 => X"00C5",

-- L0110@00D6 0022.ChkRow:  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
214 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0111@00D7 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
215 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0112@00D8 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
216 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0113@00D9 001F.  data16 =  32 - 1;
--  data16 = 0000000000011111;
217 => X"001F",

-- L0114@00DA C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
218 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0115@00DB 0003.  data16 =  @ClrLastRow - $;
--  data16 = 0000000000000011;
219 => X"0003",

-- L0116@00DC 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
220 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0117@00DD FFE5.  data16 =  @NxtRow - $;
--  data16 = 1111111111100101;
221 => X"FFE5",

-- L0119@00DE 5003.ClrLastRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
222 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0120@00DF 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
223 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0121@00E0 0042.  data16 =  @GetRowBase - $;
--  data16 = 0000000001000010;
224 => X"0042",

-- L0122@00E1 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
225 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0123@00E2 0000.  data16 =  0;
--  data16 = 0000000000000000;
226 => X"0000",

-- L0124@00E3 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
227 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0125@00E4 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
228 => X"0020",

-- L0126@00E5 0FB0.ClrRowLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
229 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0127@00E6 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
230 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0128@00E7 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
231 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0129@00E8 0040.  data16 =  64;
--  data16 = 0000000001000000;
232 => X"0040",

-- L0130@00E9 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
233 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0131@00EA 000E.  data16 =  @ScrDone - $;
--  data16 = 0000000000001110;
234 => X"000E",

-- L0132@00EB 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
235 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0133@00EC FFF9.  data16 =  @ClrRowLoop - $;
--  data16 = 1111111111111001;
236 => X"FFF9",

-- L0135@00ED 0202.VGA_CR:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
237 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0136@00EE 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
238 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0137@00EF 0000.  data16 =  0;
--  data16 = 0000000000000000;
239 => X"0000",

-- L0138@00F0 003B.SetCursorXY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
240 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0139@00F1 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
241 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0140@00F2 FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
242 => X"FF3E",

-- L0141@00F3 01F0.  STX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 110, r_s = 000;
243 => X"0" & O"0" & O"7" & O"6" & O"0",

-- L0142@00F4 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
244 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0143@00F5 FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
245 => X"FF3F",

-- L0144@00F6 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
246 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0145@00F7 01B8.  STY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 111, r_s = 000;
247 => X"0" & O"0" & O"6" & O"7" & O"0",

-- L0146@00F8 1002.ScrDone:  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
248 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0148@00F9 0202.VGA_LF:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
249 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0149@00FA 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
250 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0150@00FB FFBD.  data16 =  @NextRow1 - $;
--  data16 = 1111111110111101;
251 => X"FFBD",

-- L0152@00FC 0202.VGA_CLS:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
252 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0153@00FD 7200.  r_p = M[IMM], r_a = LDA;
--  r_p = 0111, r_a = 001, r_x = 000, r_y = 000, r_s = 000;
253 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0154@00FE 0020.  data16 =  ' ';
--  data16 = 0000000000100000;
254 => X"0020",

-- L0155@00FF 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
255 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0156@0100 0000.  data16 =  0;
--  data16 = 0000000000000000;
256 => X"0000",

-- L0157@0101 5003.ClrNextRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
257 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0158@0102 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
258 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0159@0103 0008.  data16 =  @ClearRow - $;
--  data16 = 0000000000001000;
259 => X"0008",

-- L0160@0104 0010.  INY;
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 010, r_s = 000;
260 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0161@0105 7008.  r_p = M[IMM], r_y = CPY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 001, r_s = 000;
261 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0162@0106 0020.  data16 =  32;
--  data16 = 0000000000100000;
262 => X"0020",

-- L0163@0107 C000.  IF_Y_GE;
--  r_p = 1100, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
263 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0164@0108 FFF0.  data16 =  @ScrDone - $;
--  data16 = 1111111111110000;
264 => X"FFF0",

-- L0165@0109 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
265 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0166@010A FFF7.  data16 =  @ClrNextRow - $;
--  data16 = 1111111111110111;
266 => X"FFF7",

-- L0168@010B 5003.ClearRow:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
267 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0169@010C 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
268 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0170@010D 0015.  data16 =  @GetRowBase - $;
--  data16 = 0000000000010101;
269 => X"0015",

-- L0171@010E 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
270 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0172@010F 003F.  data16 =  64 - 1;
--  data16 = 0000000000111111;
271 => X"003F",

-- L0173@0110 0FB0.ClrRLoop:  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
272 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0174@0111 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
273 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0175@0112 FFE6.  data16 =  @ScrDone - $;
--  data16 = 1111111111100110;
274 => X"FFE6",

-- L0176@0113 20C0.  DEX, BRANCH;
--  r_p = 0010, r_a = 000, r_x = 011, r_y = 000, r_s = 000;
275 => X"2" & O"0" & O"3" & O"0" & O"0",

-- L0177@0114 FFFC.  data16 =  @ClrRLoop - $;
--  data16 = 1111111111111100;
276 => X"FFFC",

-- L0179@0115 7120.VGA_HOME:  LDX, LDY, M[IMM];
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 100, r_s = 000;
277 => X"7" & O"0" & O"4" & O"4" & O"0",

-- L0180@0116 0000.  data16 =  0;
--  data16 = 0000000000000000;
278 => X"0000",

-- L0181@0117 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
279 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0182@0118 FFD8.  data16 =  @SetCursorXY - $;
--  data16 = 1111111111011000;
280 => X"FFD8",

-- L0184@0119 7020.GetCursorXY:  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
281 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0185@011A FF3E.  data16 =  0xFF00 + 62;
--  data16 = 1111111100111110;
282 => X"FF3E",

-- L0186@011B 0130.  LDX, M[Y];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 110, r_s = 000;
283 => X"0" & O"0" & O"4" & O"6" & O"0",

-- L0187@011C 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
284 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0188@011D 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
285 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0189@011E FF3F.  data16 =  0xFF00 + 63;
--  data16 = 1111111100111111;
286 => X"FF3F",

-- L0190@011F 01A0.  LDY, M[X];
--  r_p = 0000, r_a = 000, r_x = 110, r_y = 100, r_s = 000;
287 => X"0" & O"0" & O"6" & O"4" & O"0",

-- L0191@0120 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
288 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0192@0121 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
289 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0194@0122 0E03.GetRowBase:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
290 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0195@0123 7028.  r_p = M[IMM], r_y = ADY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 101, r_s = 000;
291 => X"7" & O"0" & O"0" & O"5" & O"0",

-- L0196@0124 FF00.  data16 =  0xFF00 + 0;
--  data16 = 1111111100000000;
292 => X"FF00",

-- L0197@0125 0230.  LDA, M[Y];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 110, r_s = 000;
293 => X"0" & O"1" & O"0" & O"6" & O"0",

-- L0198@0126 0E20.  LDY, A;
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 100, r_s = 000;
294 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0199@0127 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
295 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0200@0128 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
296 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0202@0129 5003.DisplayAt:  r_p = P2, r_s = M[PUSH];
--  r_p = 0101, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
297 => X"5" & O"0" & O"0" & O"0" & O"3",

-- L0203@012A 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
298 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0204@012B FFF7.  data16 =  @GetRowBase - $;
--  data16 = 1111111111110111;
299 => X"FFF7",

-- L0205@012C 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
300 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0206@012D 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
301 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0208@012E 0E03.VGATest:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
302 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0209@012F 7020.  r_p = M[IMM], r_y = LDY;
--  r_p = 0111, r_a = 000, r_x = 000, r_y = 100, r_s = 000;
303 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0210@0130 1000.  data16 =  0x1000;
--  data16 = 0001000000000000;
304 => X"1000",

-- L0211@0131 7100.  r_p = M[IMM], r_x = LDX;
--  r_p = 0111, r_a = 000, r_x = 100, r_y = 000, r_s = 000;
305 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0212@0132 0000.  data16 =  0;
--  data16 = 0000000000000000;
306 => X"0000",

-- L0213@0133 03C0.VGATLoop:  LDA, X;
--  r_p = 0000, r_a = 001, r_x = 111, r_y = 000, r_s = 000;
307 => X"0" & O"1" & O"7" & O"0" & O"0",

-- L0214@0134 0A06.  ADC, M[S];
--  r_p = 0000, r_a = 101, r_x = 000, r_y = 000, r_s = 110;
308 => X"0" & O"5" & O"0" & O"0" & O"6",

-- L0215@0135 0FB0.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a = 111, r_x = 110, r_y = 110, r_s = 000;
309 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0216@0136 0080.  INX;
--  r_p = 0000, r_a = 000, r_x = 010, r_y = 000, r_s = 000;
310 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0217@0137 7040.  r_p = M[IMM], r_x = CPX;
--  r_p = 0111, r_a = 000, r_x = 001, r_y = 000, r_s = 000;
311 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0218@0138 0800.  data16 =  64 * 32;
--  data16 = 0000100000000000;
312 => X"0800",

-- L0219@0139 A000.  IF_X_GE;
--  r_p = 1010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
313 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0220@013A 0003.  data16 =  @VGATestEx - $;
--  data16 = 0000000000000011;
314 => X"0003",

-- L0221@013B 2000.  BRANCH;
--  r_p = 0010, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
315 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0222@013C FFF7.  data16 =  @VGATLoop - $;
--  data16 = 1111111111110111;
316 => X"FFF7",

-- L0223@013D 0202.VGATestEx:  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
317 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0224@013E 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
318 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0227@013F 0003.StackTest:  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 011;
319 => X"0" & O"0" & O"0" & O"0" & O"3",

-- L0228@0140 01C3.  r_x = STX, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 111, r_y = 000, r_s = 011;
320 => X"0" & O"0" & O"7" & O"0" & O"3",

-- L0229@0141 0046.  CPX, M[S];
--  r_p = 0000, r_a = 000, r_x = 001, r_y = 000, r_s = 110;
321 => X"0" & O"0" & O"1" & O"0" & O"6",

-- L0230@0142 B000.  IF_XZ;
--  r_p = 1011, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
322 => X"B" & O"0" & O"0" & O"0" & O"0",

-- L0231@0143 0002.  data16 =  @ContY - $;
--  data16 = 0000000000000010;
323 => X"0002",

-- L0232@0144 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
324 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0233@0145 003B.ContY:  r_y = STY, r_s = M[PUSH];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 111, r_s = 011;
325 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0234@0146 000E.  CPY, M[S];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 001, r_s = 110;
326 => X"0" & O"0" & O"0" & O"1" & O"6",

-- L0235@0147 D000.  IF_YZ;
--  r_p = 1101, r_a = 000, r_x = 000, r_y = 000, r_s = 000;
327 => X"D" & O"0" & O"0" & O"0" & O"0",

-- L0236@0148 0002.  data16 =  @ContA - $;
--  data16 = 0000000000000010;
328 => X"0002",

-- L0237@0149 7FFF.  r_p = M[IMM], r_a = A, r_x = X, r_y = Y, r_s = S;
--  r_p = 0111, r_a = 111, r_x = 111, r_y = 111, r_s = 111;
329 => X"7" & O"7" & O"7" & O"7" & O"7",

-- L0238@014A 0E03.ContA:  r_a = STA, r_s = M[PUSH];
--  r_p = 0000, r_a = 111, r_x = 000, r_y = 000, r_s = 011;
330 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0239@014B 7320.  LDA, LDY, LDX, M[IMM];
--  r_p = 0111, r_a = 001, r_x = 100, r_y = 100, r_s = 000;
331 => X"7" & O"1" & O"4" & O"4" & O"0",

-- L0240@014C 0000.  data16 =  0;
--  data16 = 0000000000000000;
332 => X"0000",

-- L0241@014D 0202.  r_a = LDA, r_s = M[POP];
--  r_p = 0000, r_a = 001, r_x = 000, r_y = 000, r_s = 010;
333 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0242@014E 0022.  r_y = LDY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 100, r_s = 010;
334 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0243@014F 0102.  r_x = LDX, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 100, r_y = 000, r_s = 010;
335 => X"0" & O"0" & O"4" & O"0" & O"2",

-- L0244@0150 0002.  r_p = NOP, r_a = NOA, r_x = NOX, r_y = NOY, r_s = M[POP];
--  r_p = 0000, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
336 => X"0" & O"0" & O"0" & O"0" & O"2",

-- L0245@0151 1002.  r_p = LDP, r_s = M[POP];
--  r_p = 0001, r_a = 000, r_x = 000, r_y = 000, r_s = 010;
337 => X"1" & O"0" & O"0" & O"0" & O"2",

-- 174 location(s) in following ranges will be filled with default value
-- 0152 .. 01FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end helloworld_code;

