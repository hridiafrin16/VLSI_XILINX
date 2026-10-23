
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2to1_tb is
end MUX_2to1_tb;

architecture Test of MUX_2to1_tb is
    signal A, B, SEL, Y : STD_LOGIC;
begin
    UUT: entity work.MUX_2to1(Structural)
        port map(A => A, B => B, SEL => SEL, Y => Y);

    process
    begin
        A<='0'; B<='1'; SEL<='0'; wait for 10 ns;
        assert Y='0' report "Test 1 failed" severity error;

        A<='0'; B<='1'; SEL<='1'; wait for 10 ns;
        assert Y='1' report "Test 2 failed" severity error;

        A<='1'; B<='0'; SEL<='0'; wait for 10 ns;
        assert Y='1' report "Test 3 failed" severity error;

        A<='1'; B<='0'; SEL<='1'; wait for 10 ns;
        assert Y='0' report "Test 4 failed" severity error;

        report "MUX tests completed" severity note;
        wait;
    end process;
end Test;