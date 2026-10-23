
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ACC_Register_tb is
end ACC_Register_tb;

architecture Behavioral of ACC_Register_tb is

    component ACC_Register
        Port (
            CLK  : in  STD_LOGIC;
            LOAD : in  STD_LOGIC;
            DATA : in  STD_LOGIC_VECTOR(7 downto 0);
            Q    : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    signal CLK  : STD_LOGIC := '0';
    signal LOAD : STD_LOGIC := '0';
    signal DATA : STD_LOGIC_VECTOR(7 downto 0) := x"00";
    signal Q    : STD_LOGIC_VECTOR(7 downto 0);

begin

    UUT: ACC_Register
        port map (
            CLK  => CLK,
            LOAD => LOAD,
            DATA => DATA,
            Q    => Q
        );

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

        -- Load 3C
        LOAD <= '1';
        DATA <= x"3C";
        wait for 10 ns;

        assert Q = x"3C"
            report "ACC load 3C failed"
            severity error;

        -- LOAD = 0: retain previous value
        LOAD <= '0';
        DATA <= x"A5";
        wait for 10 ns;

        assert Q = x"3C"
            report "ACC hold test failed"
            severity error;

        -- Load A5
        LOAD <= '1';
        wait for 10 ns;

        assert Q = x"A5"
            report "ACC load A5 failed"
            severity error;

        -- Load zero
        DATA <= x"00";
        wait for 10 ns;

        assert Q = x"00"
            report "ACC zero load failed"
            severity error;

        report "ACC Register tests completed"
            severity note;

        wait;
    end process;

end Behavioral;