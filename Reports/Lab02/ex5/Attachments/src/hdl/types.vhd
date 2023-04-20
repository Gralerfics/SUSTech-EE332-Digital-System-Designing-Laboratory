library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.numeric_std;


package types is
    constant INT_RADIX: natural := 70;
    subtype int is unsigned(INT_RADIX - 1 downto 0);
    function to_int(x: integer) return int;
    function div_10(x: int) return int;
    function shift_l(x, count: int) return int;
    function shift_r(x, count: int) return int;

    type mat2_t is record
        a11, a12: int;
        a21, a22: int;
    end record;
    function "*"(A: mat2_t; B: mat2_t) return mat2_t;

    type vec2_t is record
        a1: int;
        a2: int;
    end record;
    function "*"(A: mat2_t; B: vec2_t) return vec2_t;
    
    subtype bcd_t is std_logic_vector(3 downto 0);
    function to_bcd(x: int) return bcd_t;
    function to_int(x: bcd_t) return int;

    type bcd_array_t is array (natural range <>) of bcd_t;
    function to_bcd_array_20(x: int) return bcd_array_t;
    function to_int(x: bcd_array_t) return int;
end package;


package body types is
    function to_int(x: integer) return int is
    begin
        return conv_unsigned(x, INT_RADIX);
    end function;

    function div_10(x: int) return int is
    begin
        return unsigned(ext(std_logic_vector(numeric_std."/"(numeric_std.unsigned(x), 10)), INT_RADIX));
    end function;

    function shift_l(x, count: int) return int is
    begin
        return shl(x, count);
    end function;

    function shift_r(x, count: int) return int is
    begin
        return shr(x, count);
    end function;

    function "*"(A: mat2_t; B: mat2_t) return mat2_t is
        variable C: mat2_t;
    begin
        C.a11 := conv_unsigned(A.a11 * B.a11 + A.a12 * B.a21, INT_RADIX);
        C.a12 := conv_unsigned(A.a11 * B.a12 + A.a12 * B.a22, INT_RADIX);
        C.a21 := conv_unsigned(A.a21 * B.a11 + A.a22 * B.a21, INT_RADIX);
        C.a22 := conv_unsigned(A.a21 * B.a12 + A.a22 * B.a22, INT_RADIX);
        return C;
    end function;

    function "*"(A: mat2_t; B: vec2_t) return vec2_t is
        variable C: vec2_t;
    begin
        C.a1 := conv_unsigned(A.a11 * B.a1 + A.a12 * B.a2, INT_RADIX);
        C.a2 := conv_unsigned(A.a21 * B.a1 + A.a22 * B.a2, INT_RADIX);
        return C;
    end function;

    function to_bcd(x: int) return bcd_t is
    begin
        return conv_std_logic_vector(x, 4);
    end function;

    function to_int(x: bcd_t) return int is
    begin
        return conv_unsigned(unsigned(x), INT_RADIX);
    end function;

    function to_bcd_array_20(x: int) return bcd_array_t is
        variable y, y_next: int;
        variable z: bcd_array_t(19 downto 0);
    begin
        y := x;
        for i in 0 to 19 loop
            y_next := div_10(y);
            z(i) := to_bcd(y - conv_unsigned(y_next * to_int(10), INT_RADIX));
            y := y_next;
        end loop;
        return z;
    end function;

    function to_int(x: bcd_array_t) return int is
        variable y: int;
    begin
        y := to_int(0);
        for i in x'length - 1 downto 0 loop
            y := conv_unsigned(y * to_int(10), INT_RADIX) + to_int(x(i));
        end loop;
        return y;
    end function;
end package body;
