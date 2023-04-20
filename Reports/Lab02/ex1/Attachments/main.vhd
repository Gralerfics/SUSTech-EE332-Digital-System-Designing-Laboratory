library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    generic (
        bits: POSITIVE := 4
    );
    Port (
        A, B: in STD_LOGIC_VECTOR(3 downto 0);
        S: out STD_LOGIC_VECTOR(3 downto 0);
        Cin: in STD_LOGIC;
        Cout: out STD_LOGIC
    );
end main;

architecture Main of main is
    component full_adder_nbits is
        generic (
            bits: POSITIVE
        );
        port (
            A, B: in STD_LOGIC_VECTOR(bits - 1 downto 0);
            S: out STD_LOGIC_VECTOR(bits - 1 downto 0);
            Cin: in STD_LOGIC;
            Cout: out STD_LOGIC
        );
    end component full_adder_nbits;
    
    for U0: full_adder_nbits use entity work.full_adder_nbits(Ripple);
begin
    U0: full_adder_nbits
        generic map (bits => bits)
        port map (A => A, B => B, S => S, Cin => Cin, Cout => Cout);
end Main;
