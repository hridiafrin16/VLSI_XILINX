
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Subtractor_8bit_tb is
end Subtractor_8bit_tb;

architecture Test of Subtractor_8bit_tb is
    signal A, B, DIFF : STD_LOGIC_VECTOR(7 downto 0);
    signal BORROW : STD_LOGIC;
begin
    UUT: entity work.Subtractor_8bit(Structural)
        port map(A => A, B => B, DIFF => DIFF, BORROW => BORROW);

    process
    begin
        A<=x"0A"; B<=x"03"; wait for 20 ns;
        assert (DIFF=x"07" and BORROW='0') report "Test 1 failed" severity error;

        A<=x"40"; B<=x"0B"; wait for 20 ns;
        assert (DIFF=x"35" and BORROW='0') report "Test 2 failed" severity error;

        A<=x"03"; B<=x"05"; wait for 20 ns;
        assert (DIFF=x"FE" and BORROW='1') report "Test 3 failed" severity error;

        A<=x"00"; B<=x"01"; wait for 20 ns;
        assert (DIFF=x"FF" and BORROW='1') report "Test 4 failed" severity error;

        A<=x"FF"; B<=x"FF"; wait for 20 ns;
        assert (DIFF=x"00" and BORROW='0') report "Test 5 failed" severity error;

        report "8-bit Subtractor tests completed" severity note;
        wait;
    end process;
end Test;