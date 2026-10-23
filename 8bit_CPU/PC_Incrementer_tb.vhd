
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_Incrementer_tb is
end PC_Incrementer_tb;

architecture Behavioral of PC_Incrementer_tb is

    component PC_Incrementer
        Port (
            PC_IN  : in  STD_LOGIC_VECTOR(3 downto 0);
            PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal PC_IN  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal PC_OUT : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: PC_Incrementer
        port map (
            PC_IN  => PC_IN,
            PC_OUT => PC_OUT
        );

    STIMULUS: process
    begin

        PC_IN <= "0000";
        wait for 10 ns;
        assert PC_OUT = "0001"
            report "Test 0 failed"
            severity error;

        PC_IN <= "0001";
        wait for 10 ns;
        assert PC_OUT = "0010"
            report "Test 1 failed"
            severity error;

        PC_IN <= "0010";
        wait for 10 ns;
        assert PC_OUT = "0011"
            report "Test 2 failed"
            severity error;

        PC_IN <= "0111";
        wait for 10 ns;
        assert PC_OUT = "1000"
            report "Test 7 failed"
            severity error;

        PC_IN <= "1111";
        wait for 10 ns;
        assert PC_OUT = "0000"
            report "Overflow test failed"
            severity error;

        report "PC Incrementer tests completed"
            severity note;

        wait;
    end process;

end Behavioral;