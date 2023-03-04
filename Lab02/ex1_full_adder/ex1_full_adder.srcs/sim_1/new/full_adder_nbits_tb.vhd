library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity full_adder_nbits_tb is
    generic (
        bits: POSITIVE := 4
    );
end full_adder_nbits_tb;

architecture Behavioral of full_adder_nbits_tb is
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
    
    for UUT: full_adder_nbits use entity work.full_adder_nbits(Ripple);
    
    signal A_tb, B_tb, S_tb: STD_LOGIC_VECTOR(bits - 1 downto 0);
    signal Cin_tb, Cout_tb: STD_LOGIC; 
begin
    UUT: full_adder_nbits
        generic map (bits => bits)
        port map (A => A_tb, B => B_tb, S => S_tb, Cin => Cin_tb, Cout => Cout_tb);
    
    Cin_tb <= '0';
    process is
    begin
        for i in 0 to 8 loop
            A_tb <= STD_LOGIC_VECTOR(to_unsigned(i, bits));
            for j in 0 to 8 loop
                B_tb <= STD_LOGIC_VECTOR(to_unsigned(j, bits));
                wait for 10 ns;
            end loop;
        end loop;
        wait;
    end process;
end Behavioral;
