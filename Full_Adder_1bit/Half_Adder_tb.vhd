library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder_tb is
end Half_Adder_tb;

architecture behavior of Half_Adder_tb is

    component Half_Adder
        Port (
            A     : in STD_LOGIC;
            B     : in STD_LOGIC;
            Sum   : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
    end component;

    signal A     : STD_LOGIC := '0';
    signal B     : STD_LOGIC := '0';
    signal Sum   : STD_LOGIC;
    signal Carry : STD_LOGIC;

begin

    uut: Half_Adder
        port map (
            A     => A,
            B     => B,
            Sum   => Sum,
            Carry => Carry
        );

    stim_proc: process
    begin

        A <= '0';
        B <= '0';
        wait for 100 ns;

        A <= '0';
        B <= '1';
        wait for 100 ns;

        A <= '1';
        B <= '0';
        wait for 100 ns;

        A <= '1';
        B <= '1';
        wait for 100 ns;

        wait;

    end process;

end behavior;