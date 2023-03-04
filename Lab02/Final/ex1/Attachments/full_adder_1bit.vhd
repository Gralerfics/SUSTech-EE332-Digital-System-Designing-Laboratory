library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_1bit is
    Port (
        A, B, Cin: in STD_LOGIC;
        S, Cout: out STD_LOGIC;
        S1out, S2out, S3out: out STD_LOGIC
    );
end full_adder_1bit;

architecture GateLevel of full_adder_1bit is
    signal s1, s2, s3: STD_LOGIC;
    constant gate_propagation_delay: time := 0 ns;
begin
    s1 <= (A xor B) after gate_propagation_delay;
    s2 <= (Cin and s1) after gate_propagation_delay;
    s3 <= (A and B) after gate_propagation_delay;
    S <= (s1 xor Cin) after gate_propagation_delay;
    Cout <= (s2 or s3) after gate_propagation_delay;
    S1out <= s1;
    S2out <= s2;
    S3out <= s3;
end GateLevel;
