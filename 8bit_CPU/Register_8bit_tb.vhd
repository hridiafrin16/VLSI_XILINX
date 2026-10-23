
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_8bit_tb is
end Register_8bit_tb;

architecture Test of Register_8bit_tb is

    signal D   : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: entity work.Register_8bit(Structural)
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q
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
        D <= x"3C";
        wait for 10 ns;
        assert Q = x"3C"
            report "Test 1 failed" severity error;

        D <= x"A5";
        wait for 10 ns;
        assert Q = x"A5"
            report "Test 2 failed" severity error;

        D <= x"00";
        wait for 10 ns;
        assert Q = x"00"
            report "Test 3 failed" severity error;

        D <= x"FF";
        wait for 10 ns;
        assert Q = x"FF"
            report "Test 4 failed" severity error;

        report "Register_8bit tests completed" severity note;
        wait;
    end process;

end Test;