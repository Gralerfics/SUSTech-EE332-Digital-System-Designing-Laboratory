library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

use work.types.all;


entity fibonacci is
    port (
        clk, rst, en: in std_logic;
        start: in std_logic;
        n_in: in int;
        ready: out std_logic;
        f_out: out int
    );
end entity;


architecture Behavioral of fibonacci is
    type state_t is (IDLE, OPERATE);

    signal state, state_next: state_t;
    signal n, n_next: int;
    signal T, T_next: mat2_t;
    signal f, f_next: vec2_t;
begin
    process (clk, rst, en) is
    begin
        if rst = '1' then
            state <= IDLE;
            n <= to_int(0);
            T <= (others => to_int(0));
            f <= (others => to_int(0));
        elsif rising_edge(clk) and en = '1' then
            state <= state_next;
            n <= n_next;
            T <= T_next;
            f <= f_next;
        end if;
    end process;

    process (start, n_in, state, n, T, f) is
    begin
        state_next <= state;
        n_next <= n;
        T_next <= T;
        f_next <= f;

        ready <= '0';
        f_out <= f.a2;
        
        case state is
            when IDLE =>
                if start = '1' then
                    if n_in = 0 or n_in = 1 then
                        state_next <= IDLE;
                        f_next <= (to_int(0), n_in);
                    else
                        state_next <= OPERATE;
                        n_next <= n_in - 1;
                        T_next <= (to_int(0), to_int(1), to_int(1), to_int(1));
                        f_next <= (to_int(0), to_int(1));
                    end if;
                else
                    state_next <= IDLE;
                end if;

                ready <= '1';
            when OPERATE =>
                if n = 1 then
                    state_next <= IDLE;
                    f_next <= T * f;
                else
                    state_next <= OPERATE;
                    n_next <= shift_r(n, to_int(1));
                    T_next <= T * T;
                    if n(0) = '1' then
                        f_next <= T * f;
                    else
                        f_next <= f;
                    end if;
                end if;

                ready <= '0';
        end case;
    end process;
end architecture;
