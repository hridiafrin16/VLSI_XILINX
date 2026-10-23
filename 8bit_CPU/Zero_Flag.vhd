
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Zero_Flag is
    Port (
        DATA : in  STD_LOGIC_VECTOR(7 downto 0);
        ZERO : out STD_LOGIC
    );
end Zero_Flag;

architecture Structural of Zero_Flag is

    component OR_Gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component NOT_Gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal O1, O2, O3, O4 : STD_LOGIC;
    signal O5, O6, O7 : STD_LOGIC;

begin

    G1: OR_Gate port map(A => DATA(0), B => DATA(1), Y => O1);
    G2: OR_Gate port map(A => DATA(2), B => DATA(3), Y => O2);
    G3: OR_Gate port map(A => DATA(4), B => DATA(5), Y => O3);
    G4: OR_Gate port map(A => DATA(6), B => DATA(7), Y => O4);

    G5: OR_Gate port map(A => O1, B => O2, Y => O5);
    G6: OR_Gate port map(A => O3, B => O4, Y => O6);
    G7: OR_Gate port map(A => O5, B => O6, Y => O7);

    INV_ZERO: NOT_Gate
        port map(A => O7, Y => ZERO);

end Structural;