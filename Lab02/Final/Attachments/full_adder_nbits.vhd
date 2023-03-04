library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_nbits is
    generic (
        bits: POSITIVE := 8
    );
    port (
        A, B: in STD_LOGIC_VECTOR(bits - 1 downto 0);
        S: out STD_LOGIC_VECTOR(bits - 1 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC
    );
end full_adder_nbits;

architecture Ripple of full_adder_nbits is
    component full_adder_1bit is
        Port (
            A, B, Cin: in STD_LOGIC;
            S, Cout: out STD_LOGIC
        );
    end component full_adder_1bit;

    signal Cmid: STD_LOGIC_VECTOR(bits downto 0);
begin
    Cmid(0) <= Cin;
    NBITS_ADDER: for i in 0 to bits - 1 generate
        ONEBIT_FULL_ADDER: full_adder_1bit
            port map (
                A => A(i), B => B(i), S => S(i),
                Cin => Cmid(i),
                Cout => Cmid(i + 1)
            );
    end generate;
    Cout <= Cmid(bits);
end Ripple;
