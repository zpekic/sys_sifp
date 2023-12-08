--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.ALL;
use STD.textio.all;
use ieee.std_logic_textio.all;

package sifp_package is

constant char_zero: std_logic_vector(7 downto 0) := X"00";
constant char_lf: std_logic_vector(7 downto 0) := X"0A";
constant char_cr: std_logic_vector(7 downto 0) := X"0D";
constant nop: std_logic_vector(7 downto 0) := X"00";

impure function c(char: in character) return std_logic_vector;
impure function i(char: in character) return std_logic_vector;

--type mem2k8 is array(0 to 2047) of std_logic_vector(7 downto 0);
type mem1k16 is array(0 to 1023) of std_logic_vector(15 downto 0);
--type mem256x8 is array(0 to 255) of std_logic_vector(7 downto 0);
--type mem512x8 is array(0 to 511) of std_logic_vector(7 downto 0);
--type mem64x12 is array(0 to 63) of std_logic_vector(11 downto 0);
--type mem64x4 is array(0 to 63) of std_logic_vector(3 downto 0);
type mem32x4 is array (0 to 31) of std_logic_vector(3 downto 0);
type mem16x32 is array (0 to 15) of std_logic_vector(31 downto 0);
type mem16x8 is array(0 to 15) of std_logic_vector(7 downto 0);
--type mem4x14 is array(0 to 3) of std_logic_vector(13 downto 0);
--type mem4x10 is array(0 to 3) of std_logic_vector(9 downto 0);

impure function init_filememory(file_name : in string; depth: in integer; default_value: std_logic_vector(15 downto 0)) return mem1k16;

constant bitcnt5: mem32x4 := (
	X"0",	X"1", X"1", X"2", X"1", X"2", X"2", X"3",
	X"1",	X"2", X"2", X"3", X"2", X"3", X"3", X"4",
	X"1",	X"2", X"2", X"3", X"2", X"3", X"3", X"4",
	X"2",	X"3", X"3", X"4", X"3", X"4", X"4", X"5"
);

constant hex2ascii: mem16x8 := (
	c('0'),
	c('1'),
	c('2'),
	c('3'),
	c('4'),
	c('5'),
	c('6'),
	c('7'),
	c('8'),
	c('9'),
	c('A'),
	c('B'),
	c('C'),
	c('D'),
	c('E'),
	c('F')
);

-- locations 2..7 match the outputs of the internal tracer program CPU executes
constant reg2ascii: mem16x8 := (
	c('0'),
	c('1'),
	c('F'),	
	c('A'),	
	c('X'),	
	c('Y'),
	c('S'),
	c('P'),
	c('8'),
	c('9'),
	c('a'),
	c('b'),
	c('c'),
	c('d'),
	c('e'),
	c('f')
);

--	
-- type <new_type> is
--  record
--    <type_name>        : std_logic_vector( 7 downto 0);
--    <type_name>        : std_logic;
-- end record;
--
-- Declare constants
--
-- constant <constant_name>		: time := <time_unit> ns;
-- constant <constant_name>		: integer := <value;
--
-- Declare functions and procedure
--
-- function <function_name>  (signal <signal_name> : in <type_declaration>) return <type_declaration>;
-- procedure <procedure_name> (<type_declaration> <constant_name>	: in <type_declaration>);
--

end sifp_package;

package body sifp_package is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
impure function c(char: in character) return std_logic_vector is
begin
	return std_logic_vector(to_unsigned(natural(character'pos(char)), 8));
end c;
 
impure function i(char: in character) return std_logic_vector is
begin
	return X"80" xor c(char);
end i;

impure function init_filememory(file_name : in string; depth: in integer; default_value: std_logic_vector(15 downto 0)) return mem1k16 is
variable temp_mem : mem1k16;
variable i, temp_addr: integer range 0 to (depth - 1);
--variable location: std_logic_vector(7 downto 0);
file input_file : text open read_mode is file_name;
variable input_line : line;
variable line_current: integer := 0;
variable address: std_logic_vector(15 downto 0);
variable byte_count, record_type, byte_value: std_logic_vector(7 downto 0);
variable firstChar: character;
variable count: integer;
variable isOk: boolean;

begin
	-- fill with default value
	for i in 0 to depth - 1 loop	
			temp_mem(i) := default_value;
	end loop;

	 -- parse the file for the data
	 -- format described here: https://en.wikipedia.org/wiki/Intel_HEX
	 assert false report file_name & ": loading up to " & integer'image(depth) & " bytes." severity note;
	 loop 
		line_current := line_current + 1;
      readline (input_file, input_line);
		exit when endfile(input_file); --till the end of file is reached continue.

		read(input_line, firstChar);
		if (firstChar = ':') then
			hread(input_line, byte_count);
			hread(input_line, address);
			hread(input_line, record_type);
			case record_type is
				when X"00" => -- DATA
					count := to_integer(unsigned(byte_count));
					if (count > 0) then
						temp_addr := to_integer(unsigned(address)) / 2;
						report file_name & ": parsing line " & integer'image(line_current) & " for " & integer'image(count) & " bytes at address " & integer'image(temp_addr) severity note;

						for i in 0 to (count / 2) - 1 loop
							-- assume "big-endian" (MSByte first)
							hread(input_line, byte_value);
							temp_mem(temp_addr)(15 downto 8) := byte_value;
							hread(input_line, byte_value);
							temp_mem(temp_addr)(7 downto 0) := byte_value;
							-- increment address
							temp_addr := temp_addr + 1;
						end loop;
					else
						report file_name  & ": line " & integer'image(line_current) & " has no data" severity note;
					end if;
				when X"01" => -- EOF
					report file_name & ": line " & integer'image(line_current) & " eof record type detected" severity note;
					exit;
				when others =>
					report file_name & ": line " & integer'image(line_current) & " unsupported record type detected" severity failure;
			end case;
		else
			report file_name & ": line " & integer'image(line_current) & " does not start with ':' " severity failure;
		end if;
	end loop; -- next line in file

	file_close(input_file);

   return temp_mem;
	
end init_filememory;

end sifp_package;
