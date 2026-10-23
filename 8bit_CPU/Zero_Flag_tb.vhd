
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero_Flag_tb is
end Zero_Flag_tb;

architecture Behavioral of Zero_Flag_tb is

    component Zero_Flag
        Port (
            DATA : in  STD_LOGIC_VECTOR(7 downto 0);
            ZERO : out STD_LOGIC
        );
    end component;

    signal DATA : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal ZERO : STD_LOGIC;

begin

    UUT: Zero_Flag
        port map (
            DATA => DATA,
            ZERO => ZERO
        );

    STIMULUS: process
    begin

        DATA <= x"00";
        wait for 10 ns;
        assert ZERO = '1'
            report "Zero detection failed for 00"
            severity error;

        DATA <= x"01";
        wait for 10 ns;
        assert ZERO = '0'
            report "Zero detection failed for 01"
            severity error;

        DATA <= x"FF";
        wait for 10 ns;
        assert ZERO = '0'
            report "Zero detection failed for FF"
            severity error;

        DATA <= x"80";
        wait for 10 ns;
        assert ZERO = '0'
            report "Zero detection failed for 80"
            severity error;

        report "Zero Flag tests completed"
            severity note;

        wait;
    end process;

end Behavioral;