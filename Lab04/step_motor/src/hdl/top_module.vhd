library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

use work.constants.all;
use work.types.all;


entity top_module is
    port (
        clk_sys, rst: in std_logic;
        btn_left_in, btn_right_in, btn_up_in, btn_down_in: in std_logic;
        btn_ok_in: in std_logic;
        clockwise: in std_logic;
        channels: out std_logic_vector(3 downto 0);
        anodes_n: out std_logic_vector(7 downto 0);
        segs_n: out std_logic_vector(0 to 7)
    );
end entity;


architecture Behavioral of top_module is
    component step_motor_driver is
        port (
            clk_sys, rst: in std_logic;
            tick_num: in integer;
            clockwise: in std_logic;
            step_table: in step_table_t;
            channels: out std_logic_vector(3 downto 0)
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
        port (
            clk, rst: in std_logic;
            period: in integer;
            pulse: out std_logic
        );
    end component;
    
    constant INPUT_MAX_LENGTH: integer := 8;

    signal btn_left, btn_right, btn_up, btn_down, btn_ok: std_logic;
    signal display_pts: std_logic_vector(7 downto 0);
    signal nums, nums_next: bcd_array_t(7 downto 0);
    signal input_focal, input_focal_next: integer;
    signal tick_num, tick_num_next: integer;
    signal pulse: std_logic;
    signal drv_rst: std_logic;
begin
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
    
    motor_drv: step_motor_driver
        port map (
            clk_sys => clk_sys,
            rst => drv_rst,
            tick_num => tick_num,
            clockwise => clockwise,
            step_table => STEPTABLE_FULLSTEP,
            channels => channels
        );
    drv_rst <= rst or btn_ok;

    seven_seg_drv: seven_segments_display_driver
        port map (
            clk_sys => clk_sys,
            rst => rst,
            nums => nums,
            pts => display_pts,
            anodes_n => anodes_n,
            segs_n => segs_n
        );
    display_pts <= shl("00000001", std_logic_vector(to_unsigned(input_focal, 3)));
    
    freq_div_top: frequency_divider
        port map (
            clk => clk_sys,
            rst => rst,
            period => 14285714,
            pulse => pulse
        );
    
    process (clk_sys, rst) is
    begin
        if rst = '1' then
            input_focal <= 0;
            tick_num <= 3142764;
            nums <= (to_bcd(0), to_bcd(3), to_bcd(1), to_bcd(4), to_bcd(2), to_bcd(7), to_bcd(6), to_bcd(4));
        elsif rising_edge(clk_sys) and pulse = '1' then
            input_focal <= input_focal_next;
            tick_num <= tick_num_next;
            nums <= nums_next;
        end if;
    end process;
    tick_num_next <= tick_num when btn_ok = '0' else
                     to_integer(nums(7)) * 10000000 +
                     to_integer(nums(6)) * 1000000 +
                     to_integer(nums(5)) * 100000 +
                     to_integer(nums(4)) * 10000 +
                     to_integer(nums(3)) * 1000 +
                     to_integer(nums(2)) * 100 +
                     to_integer(nums(1)) * 10 +
                     to_integer(nums(0));
    process (clk_sys, rst, btn_left, btn_right, btn_up, btn_down, input_focal) is
    begin
        input_focal_next <= input_focal;
        nums_next <= nums;
        if btn_left = '1' then
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
            if nums(input_focal) = "1001" then
                nums_next(input_focal) <= "0000";
            else
                nums_next(input_focal) <= nums(input_focal) + 1;
            end if;
        elsif btn_down = '1' then
            if nums(input_focal) = "0000" then
                nums_next(input_focal) <= "1001";
            else
                nums_next(input_focal) <= nums(input_focal) - 1;
            end if;
        end if;
    end process;
end architecture;
