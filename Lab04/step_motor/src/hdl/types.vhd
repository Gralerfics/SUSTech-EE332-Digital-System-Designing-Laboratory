library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


package types is
    type step_table_t is array (NATURAL range <>) of std_logic_vector(3 downto 0);

    subtype bcd_t is std_logic_vector(3 downto 0);
    function to_bcd(x: integer) return bcd_t;
    function to_integer(x: bcd_t) return integer;

    type bcd_array_t is array (natural range <>) of bcd_t;
end package;


package body types is
    function to_bcd(x: integer) return bcd_t is
    begin
        return std_logic_vector(to_unsigned(x, 4));
    end function;

    function to_integer(x: bcd_t) return integer is
    begin
        return to_integer(unsigned(x));
    end function;
end package body;
