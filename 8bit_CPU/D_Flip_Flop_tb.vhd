
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_Flip_Flop_tb is
end D_Flip_Flop_tb;

architecture Test of D_Flip_Flop_tb is
    signal D   : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;
begin

    UUT: entity work.D_Flip_Flop(Behavioral)
        port map (
            D => D,
            CLK => CLK,
            Q => Q
        );

    clock_process: process
    begin
        while true loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
    end process;

    stimulus: process
    begin
        D <= '1';
        wait for 10 ns;
        assert Q = '1'
            report "Test 1 failed" severity error;

        D <= '0';
        wait for 10 ns;
        assert Q = '0'
            report "Test 2 failed" severity error;

        D <= '1';
        wait for 10 ns;
        assert Q = '1'
            report "Test 3 failed" severity error;

        report "D Flip-Flop tests completed" severity note;
        wait;
    end process;

end Test;