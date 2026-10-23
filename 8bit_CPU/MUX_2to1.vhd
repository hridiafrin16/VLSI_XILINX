
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX_2to1 is
    Port (
        A, B, SEL : in  STD_LOGIC;
        Y         : out STD_LOGIC
    );
end MUX_2to1;

architecture Structural of MUX_2to1 is
    component NOT_Gate
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component AND_Gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    component OR_Gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    signal NSEL, P1, P2 : STD_LOGIC;
begin
    I1: NOT_Gate port map(A => SEL, Y => NSEL);
    A1: AND_Gate port map(A => A, B => NSEL, Y => P1);
    A2: AND_Gate port map(A => B, B => SEL, Y => P2);
    O1: OR_Gate  port map(A => P1, B => P2, Y => Y);
end Structural;