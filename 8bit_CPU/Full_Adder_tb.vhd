
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_tb is
end Full_Adder_tb;

architecture Test of Full_Adder_tb is
    signal A, B, CIN, SUM, COUT : STD_LOGIC;
begin
    UUT: entity work.Full_Adder(Structural)
        port map(A => A, B => B, CIN => CIN, SUM => SUM, COUT => COUT);

    process
    begin
        A<='0'; B<='0'; CIN<='0'; wait for 10 ns;
        assert (SUM='0' and COUT='0') report "Test 1 failed" severity error;

        A<='0'; B<='0'; CIN<='1'; wait for 10 ns;
        assert (SUM='1' and COUT='0') report "Test 2 failed" severity error;

        A<='0'; B<='1'; CIN<='0'; wait for 10 ns;
        assert (SUM='1' and COUT='0') report "Test 3 failed" severity error;

        A<='0'; B<='1'; CIN<='1'; wait for 10 ns;
        assert (SUM='0' and COUT='1') report "Test 4 failed" severity error;

        A<='1'; B<='0'; CIN<='0'; wait for 10 ns;
        assert (SUM='1' and COUT='0') report "Test 5 failed" severity error;

        A<='1'; B<='0'; CIN<='1'; wait for 10 ns;
        assert (SUM='0' and COUT='1') report "Test 6 failed" severity error;

        A<='1'; B<='1'; CIN<='0'; wait for 10 ns;
        assert (SUM='0' and COUT='1') report "Test 7 failed" severity error;

        A<='1'; B<='1'; CIN<='1'; wait for 10 ns;
        assert (SUM='1' and COUT='1') report "Test 8 failed" severity error;

        report "Full Adder tests completed" severity note;
        wait;
    end process;
end Test;