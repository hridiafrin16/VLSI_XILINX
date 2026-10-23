
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder_tb is
end Half_Adder_tb;

architecture Test of Half_Adder_tb is
    signal A, B, SUM, CARRY : STD_LOGIC;
begin
    UUT: entity work.Half_Adder(Structural)
        port map(A => A, B => B, SUM => SUM, CARRY => CARRY);

    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        assert (SUM='0' and CARRY='0') report "Test 1 failed" severity error;

        A <= '0'; B <= '1'; wait for 10 ns;
        assert (SUM='1' and CARRY='0') report "Test 2 failed" severity error;

        A <= '1'; B <= '0'; wait for 10 ns;
        assert (SUM='1' and CARRY='0') report "Test 3 failed" severity error;

        A <= '1'; B <= '1'; wait for 10 ns;
        assert (SUM='0' and CARRY='1') report "Test 4 failed" severity error;

        report "Half Adder tests completed" severity note;
        wait;
    end process;
end Test;