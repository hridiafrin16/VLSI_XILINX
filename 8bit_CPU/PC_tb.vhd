
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_tb is
end PC_tb;

architecture Behavioral of PC_tb is

    component PC
        Port (
            CLK    : in  STD_LOGIC;
            RESET  : in  STD_LOGIC;
            PC_IN  : in  STD_LOGIC_VECTOR(3 downto 0);
            PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    signal CLK    : STD_LOGIC := '0';
    signal RESET  : STD_LOGIC := '0';
    signal PC_IN  : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal PC_OUT : STD_LOGIC_VECTOR(3 downto 0);

begin

    UUT: PC
        port map (
            CLK    => CLK,
            RESET  => RESET,
            PC_IN  => PC_IN,
            PC_OUT => PC_OUT
        );

    -- Clock: 10 ns period
    CLK_PROCESS: process
    begin
        while true loop
            CLK <= '0';
            wait for 5 ns;
            CLK <= '1';
            wait for 5 ns;
        end loop;
    end process;

    STIMULUS: process
    begin

        -- Reset PC to 0000
        RESET <= '1';
        PC_IN <= "0000";
        wait for 10 ns;
        assert PC_OUT = "0000"
            report "Reset test failed"
            severity error;

        -- Load address 0001
        RESET <= '0';
        PC_IN <= "0001";
        wait for 10 ns;
        assert PC_OUT = "0001"
            report "PC load 1 failed"
            severity error;

        -- Load address 0010
        PC_IN <= "0010";
        wait for 10 ns;
        assert PC_OUT = "0010"
            report "PC load 2 failed"
            severity error;

        -- Load address 0101
        PC_IN <= "0101";
        wait for 10 ns;
        assert PC_OUT = "0101"
            report "PC load 5 failed"
            severity error;

        -- Reset again
        RESET <= '1';
        wait for 10 ns;
        assert PC_OUT = "0000"
            report "Second reset test failed"
            severity error;

        report "PC test completed successfully"
            severity note;

        wait;
    end process;

end Behavioral;