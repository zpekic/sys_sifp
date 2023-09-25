--------------------------------------------------------
-- mcc V1.3.0924 - Custom microcode compiler (c)2020-... 
--    https://github.com/zpekic/MicroCodeCompiler
--------------------------------------------------------
-- Auto-generated file, do not modify. To customize, create 'code_template.vhd' file in mcc.exe folder
-- Supported placeholders:  [NAME], [FIELDS], [SIZES], [TYPE], [SIGNAL], [INSTANCE], [MEMORY].
--------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.all;
--use IEEE.numeric_std.all;

package fillscreen_code is

-- memory block size
constant CODE_DATA_WIDTH: 	positive := 16;
constant CODE_ADDRESS_WIDTH: 	positive := 8;
constant CODE_ADDRESS_LAST: 	positive := 255;


type fls_code_memory is array(0 to 255) of std_logic_vector(15 downto 0);

signal fls_uinstruction: std_logic_vector(15 downto 0);

--fls_uinstruction <= fls_microcode(to_integer(unsigned(TODO))); -- copy to file containing the control unit. TODO is typically replace with 'ui_address' control unit output

--
-- L0011.r_p: .valfield 4 values NOP, LDP|JMP|JUMP|GOTO, ADP|BRANCH, STP2, STP3, STP4, STP5, M[IMM], BAC|IF_AC, BAZ|IF_AZ, BXC|IF_XC, BXZ|IF_XZ, BYC|IF_YC, BYZ|IF_YZ, BSC|IF_SC, BSZ|IF_SZ default NOP;
--
alias fls_r_p: 	std_logic_vector(3 downto 0) is fls_uinstruction(15 downto 12);
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
constant r_p_BAZ: 	std_logic_vector(3 downto 0) := X"9";
constant r_p_IF_AZ: 	std_logic_vector(3 downto 0) := X"9";
constant r_p_BXC: 	std_logic_vector(3 downto 0) := X"A";
constant r_p_IF_XC: 	std_logic_vector(3 downto 0) := X"A";
constant r_p_BXZ: 	std_logic_vector(3 downto 0) := X"B";
constant r_p_IF_XZ: 	std_logic_vector(3 downto 0) := X"B";
constant r_p_BYC: 	std_logic_vector(3 downto 0) := X"C";
constant r_p_IF_YC: 	std_logic_vector(3 downto 0) := X"C";
constant r_p_BYZ: 	std_logic_vector(3 downto 0) := X"D";
constant r_p_IF_YZ: 	std_logic_vector(3 downto 0) := X"D";
constant r_p_BSC: 	std_logic_vector(3 downto 0) := X"E";
constant r_p_IF_SC: 	std_logic_vector(3 downto 0) := X"E";
constant r_p_BSZ: 	std_logic_vector(3 downto 0) := X"F";
constant r_p_IF_SZ: 	std_logic_vector(3 downto 0) := X"F";
---- Start boilerplate code (use with utmost caution!)
-- with fls_r_p select r_p <=
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
--      BAZ when r_p_BAZ,
--      BAZ when r_p_IF_AZ,
--      BXC when r_p_BXC,
--      BXC when r_p_IF_XC,
--      BXZ when r_p_BXZ,
--      BXZ when r_p_IF_XZ,
--      BYC when r_p_BYC,
--      BYC when r_p_IF_YC,
--      BYZ when r_p_BYZ,
--      BYZ when r_p_IF_YZ,
--      BSC when r_p_BSC,
--      BSC when r_p_IF_SC,
--      BSZ when r_p_BSZ;
--      BSZ when r_p_IF_SZ;
---- End boilerplate code

--
-- L0031.r_a: .regfield 3 values NOA, LDA, XOR, SLC, SRC, ADC, SBC, STA|A default NOA;
--
alias fls_r_a: 	std_logic_vector(2 downto 0) is fls_uinstruction(11 downto 9);
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
-- update_r_a: process(clk, fls_r_a)
-- begin
--	if (rising_edge(clk)) then
--		case fls_r_a is
----			when r_a_NOA =>
----				r_a <= r_a;
--			when r_a_LDA =>
--				r_a <= LDA;
--			when r_a_XOR =>
--				r_a <= XOR;
--			when r_a_SLC =>
--				r_a <= SLC;
--			when r_a_SRC =>
--				r_a <= SRC;
--			when r_a_ADC =>
--				r_a <= ADC;
--			when r_a_SBC =>
--				r_a <= SBC;
--			when r_a_STA|A =>
--				r_a <= STA|A;
--			when others =>
--				null;
--		end case;
-- end if;
-- end process;
---- End boilerplate code

--
-- L0043.r_x: .valfield 3 values NOX, CPX, INX, DEX, LDX, ADX, M[X], STX|X default NOX;
--
alias fls_r_x: 	std_logic_vector(2 downto 0) is fls_uinstruction(8 downto 6);
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
-- with fls_r_x select r_x <=
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
alias fls_r_y: 	std_logic_vector(2 downto 0) is fls_uinstruction(5 downto 3);
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
-- with fls_r_y select r_y <=
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
alias fls_r_s: 	std_logic_vector(2 downto 0) is fls_uinstruction(2 downto 0);
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
-- with fls_r_s select r_s <=
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
-- L0078.data16: .valfield r_p .. r_s values * default 0;
--
alias fls_data16: 	std_logic_vector(15 downto 0) is fls_uinstruction(15 downto 0);
-- Values from X"0000" to X"FFFF" allowed
---- Start boilerplate code (use with utmost caution!)
--  data16 <= fls_data16;
---- End boilerplate code



constant fls_microcode: fls_code_memory := (

-- L0022@0000.  NOP;
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
0 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0023@0001.  LDA, M[IMM];
--  r_p = 0111, r_a <= 001, r_x = 000, r_y = 000, r_s = 000;
1 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0024@0002.  data16 =  ' ';
--  data16 = 0000000000100000;
2 => X"0020",

-- L0025@0003.ALOOP:  LDY, M[IMM];
--  r_p = 0111, r_a <= 000, r_x = 000, r_y = 100, r_s = 000;
3 => X"7" & O"0" & O"0" & O"4" & O"0",

-- L0026@0004.  data16 =  0;
--  data16 = 0000000000000000;
4 => X"0000",

-- L0027@0005.YLOOP:  LDX, M[IMM];
--  r_p = 0111, r_a <= 000, r_x = 100, r_y = 000, r_s = 000;
5 => X"7" & O"0" & O"4" & O"0" & O"0",

-- L0028@0006.  data16 =  0;
--  data16 = 0000000000000000;
6 => X"0000",

-- L0029@0007.XLOOP:  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a <= 000, r_x = 000, r_y = 000, r_s = 011;
7 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0030@0008.  JMP;
--  r_p = 0001, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
8 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0031@0009.  data16 =  @DISPLAYAT;
--  data16 = 0000000000011101;
9 => X"001D",

-- L0032@000A.  INX;
--  r_p = 0000, r_a <= 000, r_x = 010, r_y = 000, r_s = 000;
10 => X"0" & O"0" & O"2" & O"0" & O"0",

-- L0033@000B.  CPX, M[IMM];
--  r_p = 0111, r_a <= 000, r_x = 001, r_y = 000, r_s = 000;
11 => X"7" & O"0" & O"1" & O"0" & O"0",

-- L0034@000C.  data16 =  80 - 1;
--  data16 = 0000000001001111;
12 => X"004F",

-- L0035@000D.  IF_XC;
--  r_p = 1010, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
13 => X"A" & O"0" & O"0" & O"0" & O"0",

-- L0036@000E.  data16 =  @XLOOP - $;
--  data16 = 1111111111111001;
14 => X"FFF9",

-- L0037@000F.  INY;
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 010, r_s = 000;
15 => X"0" & O"0" & O"0" & O"2" & O"0",

-- L0038@0010.  CPY, M[IMM];
--  r_p = 0111, r_a <= 000, r_x = 000, r_y = 001, r_s = 000;
16 => X"7" & O"0" & O"0" & O"1" & O"0",

-- L0039@0011.  data16 =  60 - 1;
--  data16 = 0000000000111011;
17 => X"003B",

-- L0040@0012.  IF_YC;
--  r_p = 1100, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
18 => X"C" & O"0" & O"0" & O"0" & O"0",

-- L0041@0013.  data16 =  @YLOOP - $;
--  data16 = 1111111111110010;
19 => X"FFF2",

-- L0042@0014.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a <= 000, r_x = 000, r_y = 000, r_s = 011;
20 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0043@0015.  JMP;
--  r_p = 0001, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
21 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0044@0016.  data16 =  @CLC;
--  data16 = 0000000000110011;
22 => X"0033",

-- L0045@0017.  ADC, M[IMM];
--  r_p = 0111, r_a <= 101, r_x = 000, r_y = 000, r_s = 000;
23 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0046@0018.  data16 =  1;
--  data16 = 0000000000000001;
24 => X"0001",

-- L0047@0019.STOP:  IF_AZ;
--  r_p = 1001, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
25 => X"9" & O"0" & O"0" & O"0" & O"0",

-- L0048@001A.  data16 =  @STOP - $;
--  data16 = 1111111111111111;
26 => X"FFFF",

-- L0049@001B.  BRANCH;
--  r_p = 0010, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
27 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0050@001C.  data16 =  @ALOOP - $;
--  data16 = 1111111111100111;
28 => X"FFE7",

-- L0053@001D.DISPLAYAT:  NOP;
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
29 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0054@001E.  STY, M[PUSH];
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 111, r_s = 011;
30 => X"0" & O"0" & O"0" & O"7" & O"3",

-- L0055@001F.  STA, M[PUSH];
--  r_p = 0000, r_a <= 111, r_x = 000, r_y = 000, r_s = 011;
31 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0056@0020.  LDA, Y;
--  r_p = 0000, r_a <= 001, r_x = 000, r_y = 111, r_s = 000;
32 => X"0" & O"1" & O"0" & O"7" & O"0",

-- L0057@0021.  r_p = STP2, r_s = M[PUSH];
--  r_p = 0011, r_a <= 000, r_x = 000, r_y = 000, r_s = 011;
33 => X"3" & O"0" & O"0" & O"0" & O"3",

-- L0058@0022.  JUMP;
--  r_p = 0001, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
34 => X"1" & O"0" & O"0" & O"0" & O"0",

-- L0059@0023.  data16 =  @CLC;
--  data16 = 0000000000110011;
35 => X"0033",

-- L0060@0024.  SLC;
--  r_p = 0000, r_a <= 011, r_x = 000, r_y = 000, r_s = 000;
36 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0061@0025.  SLC;
--  r_p = 0000, r_a <= 011, r_x = 000, r_y = 000, r_s = 000;
37 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0062@0026.  SLC;
--  r_p = 0000, r_a <= 011, r_x = 000, r_y = 000, r_s = 000;
38 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0063@0027.  SLC;
--  r_p = 0000, r_a <= 011, r_x = 000, r_y = 000, r_s = 000;
39 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0064@0028.  STA, M[PUSH];
--  r_p = 0000, r_a <= 111, r_x = 000, r_y = 000, r_s = 011;
40 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0065@0029.  SLC;
--  r_p = 0000, r_a <= 011, r_x = 000, r_y = 000, r_s = 000;
41 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0066@002A.  SLC;
--  r_p = 0000, r_a <= 011, r_x = 000, r_y = 000, r_s = 000;
42 => X"0" & O"3" & O"0" & O"0" & O"0",

-- L0067@002B.  ADC, M[POP];
--  r_p = 0000, r_a <= 101, r_x = 000, r_y = 000, r_s = 010;
43 => X"0" & O"5" & O"0" & O"0" & O"2",

-- L0068@002C.  ADC, M[IMM];
--  r_p = 0111, r_a <= 101, r_x = 000, r_y = 000, r_s = 000;
44 => X"7" & O"5" & O"0" & O"0" & O"0",

-- L0069@002D.  data16 =  0x1000;
--  data16 = 0001000000000000;
45 => X"1000",

-- L0070@002E.  LDY, A;
--  r_p = 0000, r_a <= 111, r_x = 000, r_y = 100, r_s = 000;
46 => X"0" & O"7" & O"0" & O"4" & O"0",

-- L0071@002F.  LDA, M[POP];
--  r_p = 0000, r_a <= 001, r_x = 000, r_y = 000, r_s = 010;
47 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0072@0030.  STA, r_x = M[X], r_y = M[Y];
--  r_p = 0000, r_a <= 111, r_x = 110, r_y = 110, r_s = 000;
48 => X"0" & O"7" & O"6" & O"6" & O"0",

-- L0073@0031.  LDY, M[POP];
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 100, r_s = 010;
49 => X"0" & O"0" & O"0" & O"4" & O"2",

-- L0074@0032.  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a <= 000, r_x = 000, r_y = 000, r_s = 010;
50 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0077@0033.CLC:  NOP;
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
51 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0078@0034.  STA, M[PUSH];
--  r_p = 0000, r_a <= 111, r_x = 000, r_y = 000, r_s = 011;
52 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0079@0035.  LDA, M[IMM];
--  r_p = 0111, r_a <= 001, r_x = 000, r_y = 000, r_s = 000;
53 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0080@0036.  data16 =  0;
--  data16 = 0000000000000000;
54 => X"0000",

-- L0081@0037.ACSet:  SRC;
--  r_p = 0000, r_a <= 100, r_x = 000, r_y = 000, r_s = 000;
55 => X"0" & O"4" & O"0" & O"0" & O"0",

-- L0082@0038.  LDA, M[POP];
--  r_p = 0000, r_a <= 001, r_x = 000, r_y = 000, r_s = 010;
56 => X"0" & O"1" & O"0" & O"0" & O"2",

-- L0083@0039.ACDone:  r_p = JMP, r_s = M[POP];
--  r_p = 0001, r_a <= 000, r_x = 000, r_y = 000, r_s = 010;
57 => X"1" & O"0" & O"0" & O"0" & O"2",

-- L0086@003A.SEC:  NOP;
--  r_p = 0000, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
58 => X"0" & O"0" & O"0" & O"0" & O"0",

-- L0087@003B.  IF_AC;
--  r_p = 1000, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
59 => X"8" & O"0" & O"0" & O"0" & O"0",

-- L0088@003C.  data16 =  @ACDone - $;
--  data16 = 1111111111111101;
60 => X"FFFD",

-- L0089@003D.CSet:  STA, M[PUSH];
--  r_p = 0000, r_a <= 111, r_x = 000, r_y = 000, r_s = 011;
61 => X"0" & O"7" & O"0" & O"0" & O"3",

-- L0090@003E.  LDA, M[IMM];
--  r_p = 0111, r_a <= 001, r_x = 000, r_y = 000, r_s = 000;
62 => X"7" & O"1" & O"0" & O"0" & O"0",

-- L0091@003F.  data16 =  1;
--  data16 = 0000000000000001;
63 => X"0001",

-- L0092@0040.  BRANCH;
--  r_p = 0010, r_a <= 000, r_x = 000, r_y = 000, r_s = 000;
64 => X"2" & O"0" & O"0" & O"0" & O"0",

-- L0093@0041.  data16 =  @ACSet - $;
--  data16 = 1111111111110110;
65 => X"FFF6",

-- 190 location(s) in following ranges will be filled with default value
-- 0042 .. 00FF

others => X"0" & O"0" & O"0" & O"0" & O"0"
);

end fillscreen_code;

