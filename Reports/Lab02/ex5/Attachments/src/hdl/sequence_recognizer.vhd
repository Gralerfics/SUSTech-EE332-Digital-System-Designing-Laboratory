library IEEE;
use IEEE.std_logic_1164.all;


entity sequence_recognizer is
    port (
        clk, rst: in std_logic;
        data: in std_logic;
        match: out std_logic
    );
end entity;


architecture Behavioral of sequence_recognizer is
    type state_t is (S0, S1, S2, S3);
    signal state, state_next: state_t := S0;
begin
    process (clk, rst)
    begin
        if rst = '1' then
            state <= S0;
        elsif rising_edge(clk) then
            state <= state_next;
        end if;
    end process;
    
    process (state, data)
    begin
        state_next <= state;
        match <= '0';
        case state is
            when S0 =>
                if data = '1' then
                    state_next <= S1;
                end if;
            when S1 =>
                if data = '0' then
                    state_next <= S2;
                end if;
            when S2 =>
                if data = '1' then
                    state_next <= S3;
                    match <= '1';
                else
                    state_next <= S0;
                end if;
            when S3 =>
                match <= '1';
        end case;
    end process;
end architecture;
