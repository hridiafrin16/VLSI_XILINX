library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_Gate_tb is
end AND_Gate_tb;

architecture Test of AND_Gate_tb is
    signal A, B, Y : STD_LOGIC;
begin
    UUT: entity work.AND_Gate
        port map (A => A, B => B, Y => Y);

    process
    begin
        A <= '0'; B <= '0'; wait for 10 ns;
        assert Y = '0' report "AND 00 failed" severity error;

        A <= '0'; B <= '1'; wait for 10 ns;
        assert Y = '0' report "AND 01 failed" severity error;

        A <= '1'; B <= '0'; wait for 10 ns;
        assert Y = '0' report "AND 10 failed" severity error;

        A <= '1'; B <= '1'; wait for 10 ns;
        assert Y = '1' report "AND 11 failed" severity error;

        report "AND Gate Test Completed";
        wait;
    end process;
end Test;