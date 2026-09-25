library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_tb is
end Full_Adder_tb;

architecture behavior of Full_Adder_tb is

    component Full_Adder
        Port (
            A    : in STD_LOGIC;
            B    : in STD_LOGIC;
            Cin  : in STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal A    : STD_LOGIC := '0';
    signal B    : STD_LOGIC := '0';
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC;
    signal Cout : STD_LOGIC;

begin

    uut: Full_Adder
        port map (
            A    => A,
            B    => B,
            Cin  => Cin,
            Sum  => Sum,
            Cout => Cout
        );

    stim_proc: process
    begin

        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 100 ns;

        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 100 ns;

        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for 100 ns;

        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for 100 ns;

        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for 100 ns;

        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for 100 ns;

        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for 100 ns;

        A <= '1';
        B <= '1';
        Cin <= '1';
        wait for 100 ns;

        wait;

    end process;

end behavior;