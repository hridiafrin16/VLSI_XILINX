
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        A, B, CIN : in  STD_LOGIC;
        SUM, COUT : out STD_LOGIC
    );
end Full_Adder;

architecture Structural of Full_Adder is
    component Half_Adder
        Port (
            A, B       : in  STD_LOGIC;
            SUM, CARRY : out STD_LOGIC
        );
    end component;

    component OR_Gate
        Port (A, B : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    signal S1, C1, C2 : STD_LOGIC;
begin
    HA1: Half_Adder
        port map(A => A, B => B, SUM => S1, CARRY => C1);

    HA2: Half_Adder
        port map(A => S1, B => CIN, SUM => SUM, CARRY => C2);

    O1: OR_Gate
        port map(A => C1, B => C2, Y => COUT);
end Structural;