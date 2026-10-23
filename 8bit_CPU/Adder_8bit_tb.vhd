
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_8bit_tb is
end Adder_8bit_tb;

architecture Test of Adder_8bit_tb is
    signal A, B, SUM : STD_LOGIC_VECTOR(7 downto 0);
    signal COUT : STD_LOGIC;
begin
    UUT: entity work.Adder_8bit(Structural)
        port map(A => A, B => B, SUM => SUM, COUT => COUT);

    process
    begin
        A<=x"03"; B<=x"05"; wait for 20 ns;
        assert (SUM=x"08" and COUT='0') report "Test 1 failed" severity error;

        A<=x"0F"; B<=x"01"; wait for 20 ns;
        assert (SUM=x"10" and COUT='0') report "Test 2 failed" severity error;

        A<=x"FF"; B<=x"01"; wait for 20 ns;
        assert (SUM=x"00" and COUT='1') report "Test 3 failed" severity error;

        A<=x"FF"; B<=x"FF"; wait for 20 ns;
        assert (SUM=x"FE" and COUT='1') report "Test 4 failed" severity error;

        report "8-bit Adder tests completed" severity note;
        wait;
    end process;
end Test;