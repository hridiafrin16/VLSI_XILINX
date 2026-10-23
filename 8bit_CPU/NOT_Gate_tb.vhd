library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_Gate_tb is
end NOT_Gate_tb;

architecture Test of NOT_Gate_tb is
    signal A, Y : STD_LOGIC;
begin
    UUT: entity work.NOT_Gate
        port map (A => A, Y => Y);

    process
    begin
        A <= '0';
        wait for 10 ns;
        assert Y = '1'
            report "NOT 0 failed" severity error;

        A <= '1';
        wait for 10 ns;
        assert Y = '0'
            report "NOT 1 failed" severity error;

        report "NOT Gate Test Completed";
        wait;
    end process;
end Test;