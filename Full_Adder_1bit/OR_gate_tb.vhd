library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_gate_tb is
end OR_gate_tb;

architecture behavior of OR_gate_tb is

    component OR_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin

    uut: OR_gate
        port map (
            A => A,
            B => B,
            Y => Y
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