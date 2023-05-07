library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;


entity combinational_multiplier_16 is
    port (
        a, b: in std_logic_vector(15 downto 0);
        y: out std_logic_vector(31 downto 0)
    );
end entity;


architecture arch_1 of combinational_multiplier_16 is
    signal au, bv0, bv1, bv2, bv3, bv4, bv5, bv6, bv7, bv8, bv9, bv10, bv11, bv12, bv13, bv14, bv15: std_logic_vector(15 downto 0);
    signal p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, prod: std_logic_vector(31 downto 0);
begin
    au <= a;
    bv0 <= (others => b(0));
    bv1 <= (others => b(1));
    bv2 <= (others => b(2));
    bv3 <= (others => b(3));
    bv4 <= (others => b(4));
    bv5 <= (others => b(5));
    bv6 <= (others => b(6));
    bv7 <= (others => b(7));
    bv8 <= (others => b(8));
    bv9 <= (others => b(9));
    bv10 <= (others => b(10));
    bv11 <= (others => b(11));
    bv12 <= (others => b(12));
    bv13 <= (others => b(13));
    bv14 <= (others => b(14));
    bv15 <= (others => b(15));
    p0 <= "0000000000000000" & (bv0 and au);
    p1 <= "000000000000000" & (bv1 and au) & '0';
    p2 <= "00000000000000" & (bv2 and au) & "00";
    p3 <= "0000000000000" & (bv3 and au) & "000";
    p4 <= "000000000000" & (bv4 and au) & "0000";
    p5 <= "00000000000" & (bv5 and au) & "00000";
    p6 <= "0000000000" & (bv6 and au) & "000000";
    p7 <= "000000000" & (bv7 and au) & "0000000";
    p8 <= "00000000" & (bv8 and au) & "00000000";
    p9 <= "0000000" & (bv9 and au) & "000000000";
    p10 <= "000000" & (bv10 and au) & "0000000000";
    p11 <= "00000" & (bv11 and au) & "00000000000";
    p12 <= "0000" & (bv12 and au) & "000000000000";
    p13 <= "000" & (bv13 and au) & "0000000000000";
    p14 <= "00" & (bv14 and au) & "00000000000000";
    p15 <= "0" & (bv15 and au) & "000000000000000";
    prod <= (((p0 + p1) + (p2 + p3)) + ((p4 + p5) + (p6 + p7))) + (((p8 + p9) + (p10 + p11)) + ((p12 + p13) + (p14 + p15)));
    y <= prod;
end architecture;


architecture arch_2 of combinational_multiplier_16 is
    signal au, bv0, bv1, bv2, bv3, bv4, bv5, bv6, bv7, bv8, bv9, bv10, bv11, bv12, bv13, bv14, bv15: std_logic_vector(15 downto 0);
    signal pp0, pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9, pp10, pp11, pp12, pp13, pp14, pp15: std_logic_vector(16 downto 0);
    signal prod: std_logic_vector(31 downto 0);
begin
    au <= a;
    bv0 <= (others => b(0));
    bv1 <= (others => b(1));
    bv2 <= (others => b(2));
    bv3 <= (others => b(3));
    bv4 <= (others => b(4));
    bv5 <= (others => b(5));
    bv6 <= (others => b(6));
    bv7 <= (others => b(7));
    bv8 <= (others => b(8));
    bv9 <= (others => b(9));
    bv10 <= (others => b(10));
    bv11 <= (others => b(11));
    bv12 <= (others => b(12));
    bv13 <= (others => b(13));
    bv14 <= (others => b(14));
    bv15 <= (others => b(15));
    pp0 <= '0' & (bv0 and au);
    pp1 <= ('0' & pp0(16 downto 1)) + ('0' & (bv1 and au));
    pp2 <= ('0' & pp1(16 downto 1)) + ('0' & (bv2 and au));
    pp3 <= ('0' & pp2(16 downto 1)) + ('0' & (bv3 and au));
    pp4 <= ('0' & pp3(16 downto 1)) + ('0' & (bv4 and au));
    pp5 <= ('0' & pp4(16 downto 1)) + ('0' & (bv5 and au));
    pp6 <= ('0' & pp5(16 downto 1)) + ('0' & (bv6 and au));
    pp7 <= ('0' & pp6(16 downto 1)) + ('0' & (bv7 and au));
    pp8 <= ('0' & pp7(16 downto 1)) + ('0' & (bv8 and au));
    pp9 <= ('0' & pp8(16 downto 1)) + ('0' & (bv9 and au));
    pp10 <= ('0' & pp9(16 downto 1)) + ('0' & (bv10 and au));
    pp11 <= ('0' & pp10(16 downto 1)) + ('0' & (bv11 and au));
    pp12 <= ('0' & pp11(16 downto 1)) + ('0' & (bv12 and au));
    pp13 <= ('0' & pp12(16 downto 1)) + ('0' & (bv13 and au));
    pp14 <= ('0' & pp13(16 downto 1)) + ('0' & (bv14 and au));
    pp15 <= ('0' & pp14(16 downto 1)) + ('0' & (bv15 and au));
    prod <= pp15 & pp14(0) & pp13(0) & pp12(0) & pp11(0) & pp10(0) & pp9(0) & pp8(0) & pp7(0) & pp6(0) & pp5(0) & pp4(0) & pp3(0) & pp2(0) & pp1(0) & pp0(0);
    y <= prod;
end architecture;
