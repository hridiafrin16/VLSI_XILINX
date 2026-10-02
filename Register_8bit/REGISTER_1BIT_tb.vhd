library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTER_1BIT_tb is
end REGISTER_1BIT_tb;

architecture Behavioral of REGISTER_1BIT_tb is

    component REGISTER_1BIT
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

    signal D   : STD_LOGIC := '0';
    signal CLK : STD_LOGIC := '0';
    signal Q   : STD_LOGIC;
    signal Qn  : STD_LOGIC;

begin

    uut: REGISTER_1BIT
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Qn  => Qn
        );

    stimulus: process
    begin

        D <= '0';
        CLK <= '0';
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= '1';
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= '0';
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        D <= '1';
        wait for 10 ns;

        CLK <= '1';
        wait for 10 ns;

        CLK <= '0';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;