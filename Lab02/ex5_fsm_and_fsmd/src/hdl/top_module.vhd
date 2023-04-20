library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

use work.types.all;


entity top_module is
    port (
        clk_sys, rst: in std_logic;
        btn_left_in, btn_right_in, btn_up_in, btn_down_in: in std_logic;
        btn_ok_in: in std_logic;
        busy_led: out std_logic;
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of top_module is
    component fibonacci is
        port (
            clk, rst, en: in std_logic;
            start: in std_logic;
            n_in: in int;
            ready: out std_logic;
            f_out: out int
        );
    end component;

    component button_state is
        generic (
            PERIOD: integer := 1000 -- 10 us
        );
        port (
            clk, rst: in std_logic;
            btn_in: in std_logic;
            btn_out: out std_logic
        );
    end component;

    component frequency_divider is
        generic (
            freq: integer := 1000
        );
        port (
            clk_sys, rst: in std_logic;
            pulse: out std_logic
        );
    end component;
        
    component seven_segments_display_driver is
        port (
            clk_sys, rst: in std_logic;
            nums: in bcd_array_t(7 downto 0);
            pts: in std_logic_vector(7 downto 0);
            anodes_n: out std_logic_vector(7 downto 0);
            segs_n: out std_logic_vector(0 to 7)
        );
    end component;

    signal btn_left, btn_right, btn_up, btn_down, btn_ok: std_logic;

    signal func_ready, func_start, func_en: std_logic;
    signal func_input, func_result: int;

    signal display_nums: bcd_array_t(7 downto 0);
    signal display_pts: std_logic_vector(7 downto 0);

    type mode_t is (input_mode, compute_mode, result_mode);
    signal mode, mode_next: mode_t;
    signal pulse: std_logic;

    constant INPUT_MAX_LENGTH: integer := 2;
    signal input_focal, input_focal_next: integer;
    signal input_nums, input_nums_next: bcd_array_t(7 downto 0);

    constant RESULT_MAX_LENGTH: integer := 20;
    signal result_offset, result_offset_next: integer;
    signal result_nums: bcd_array_t(RESULT_MAX_LENGTH - 1 downto 0);
    signal result_disp_nums: bcd_array_t(7 downto 0);
begin
    -- buttons.
        btn_left_state: button_state
            generic map (PERIOD => 1500)
            port map (clk => clk_sys, rst => rst, btn_in => btn_left_in, btn_out => btn_left);
        btn_right_state: button_state
            generic map (PERIOD => 1500)
            port map (clk => clk_sys, rst => rst, btn_in => btn_right_in, btn_out => btn_right);
        btn_up_state: button_state
            generic map (PERIOD => 1500)
            port map (clk => clk_sys, rst => rst, btn_in => btn_up_in, btn_out => btn_up);
        btn_down_state: button_state
            generic map (PERIOD => 1500)
            port map (clk => clk_sys, rst => rst, btn_in => btn_down_in, btn_out => btn_down);
        btn_ok_state: button_state
            generic map (PERIOD => 1500)
            port map (clk => clk_sys, rst => rst, btn_in => btn_ok_in, btn_out => btn_ok);

    -- compute and led.
        freq_div_func: frequency_divider
            generic map (
                freq => 10000000
            )
            port map (
                clk_sys => clk_sys, rst => rst,
                pulse => func_en
            );
        
        func: fibonacci port map (
            clk => clk_sys,
            rst => rst,
            en => func_en,
            start => func_start,
            n_in => func_input,
            ready => func_ready,
            f_out => func_result
        );
        func_start <= '1' when mode = compute_mode and btn_ok = '1' else '0';
        busy_led <= not func_ready;
    
    -- seven segments display.
        display: seven_segments_display_driver port map (
            clk_sys => clk_sys,
            rst => rst,
            nums => display_nums,
            pts => display_pts,
            anodes_n => anodes_n,
            segs_n => segs_n
        );

        display_pts <= (others => '0') when mode /= input_mode else
                       conv_std_logic_vector(shl(to_int(1), to_int(input_focal)), 8);
        display_nums <= input_nums when mode = input_mode or mode = compute_mode else
                        result_disp_nums when mode = result_mode else
                        (others => "0000");
    
    -- input numbers.
        func_input <= to_int(input_nums);

    -- result numbers.
        result_nums <= to_bcd_array_20(func_result);
        res_disp_gen: for i in 7 downto 0 generate
            result_disp_nums(i) <= result_nums(result_offset + i) when result_offset + i < RESULT_MAX_LENGTH else "0000";
        end generate;

    -- fsm.
        freq_div_fsm: frequency_divider
            generic map (
                freq => 7
            )
            port map (
                clk_sys => clk_sys, rst => rst,
                pulse => pulse
            );

        process (clk_sys, rst, pulse) is
        begin
            if rst = '1' then
                mode <= input_mode;
                input_focal <= 0;
                input_nums <= (others => "0000");
                result_offset <= 0;
            elsif rising_edge(clk_sys) and pulse = '1' then
                mode <= mode_next;
                input_focal <= input_focal_next;
                input_nums <= input_nums_next;
                result_offset <= result_offset_next;
            end if;
        end process;

        process (mode, input_focal, input_nums, result_offset, btn_left, btn_right, btn_up, btn_down, btn_ok, func_ready) is
        begin
            mode_next <= mode;
            input_focal_next <= input_focal;
            input_nums_next <= input_nums;
            result_offset_next <= result_offset;

            case mode is
                when input_mode =>
                    if btn_ok = '1' then
                        mode_next <= compute_mode;
                    elsif btn_left = '1' then
                        if input_focal = INPUT_MAX_LENGTH - 1 then
                            input_focal_next <= 0;
                        else
                            input_focal_next <= input_focal + 1;
                        end if;
                    elsif btn_right = '1' then
                        if input_focal = 0 then
                            input_focal_next <= INPUT_MAX_LENGTH - 1;
                        else
                            input_focal_next <= input_focal - 1;
                        end if;
                    elsif btn_up = '1' then
                        if input_nums(input_focal) = "1001" then
                            input_nums_next(input_focal) <= "0000";
                        else
                            input_nums_next(input_focal) <= input_nums(input_focal) + 1;
                        end if;
                    elsif btn_down = '1' then
                        if input_nums(input_focal) = "0000" then
                            input_nums_next(input_focal) <= "1001";
                        else
                            input_nums_next(input_focal) <= input_nums(input_focal) - 1;
                        end if;
                    end if;
                when compute_mode =>
                    mode_next <= compute_mode;
                    if func_ready = '1' then
                        mode_next <= result_mode;
                    end if;
                when result_mode =>
                    mode_next <= result_mode;
                    if btn_ok = '1' then
                        mode_next <= input_mode;
                    elsif btn_left = '1' then
                        if result_offset = RESULT_MAX_LENGTH - 8 then
                            result_offset_next <= RESULT_MAX_LENGTH - 8;
                        else
                            result_offset_next <= result_offset + 1;
                        end if;
                    elsif btn_right = '1' then
                        if result_offset = 0 then
                            result_offset_next <= 0;
                        else
                            result_offset_next <= result_offset - 1;
                        end if;
                    end if;
                when others =>
                    mode_next <= input_mode;
            end case;
        end process;
end architecture;
