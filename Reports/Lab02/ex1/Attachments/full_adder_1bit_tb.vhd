library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1bit_tb is

end full_adder_1bit_tb; 

architecture Behavioral of full_adder_1bit_tb is
    component full_adder_1bit is
        Port (
            A, B, Cin: in STD_LOGIC;
            S, Cout: out STD_LOGIC;
            S1out, S2out, S3out: out STD_LOGIC
        );
    end component full_adder_1bit;
    
    for UUT: full_adder_1bit use entity work.full_adder_1bit(Structure);

    signal A_tb, B_tb, Cin_tb: STD_LOGIC;
    signal S_tb, Cout_tb: STD_LOGIC;
    signal s1_tb, s2_tb, s3_tb: STD_LOGIC;
begin
    UUT: full_adder_1bit port map (A => A_tb, B => B_tb, Cin => Cin_tb, S => S_tb, Cout => Cout_tb, S1out => s1_tb, S2out => s2_tb, S3out => s3_tb);
    
    A_tb <= '1', '0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '1' after 40 ns, '0' after 50 ns, '1' after 60 ns, '0' after 70 ns;
    B_tb <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns;
    Cin_tb <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 50 ns, '0' after 60 ns;
end Behavioral;
