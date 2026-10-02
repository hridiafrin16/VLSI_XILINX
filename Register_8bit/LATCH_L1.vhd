library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LATCH_L1 is
    Port (
        S  : in  STD_LOGIC;
        R  : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end LATCH_L1;

architecture Structural of LATCH_L1 is

    component NAND_GATE
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal N1 : STD_LOGIC;
    signal N2 : STD_LOGIC;

begin

    NAND1: NAND_GATE
        port map (
            A => S,
            B => N2,
            Y => N1
        );

    NAND2: NAND_GATE
        port map (
            A => R,
            B => N1,
            Y => N2
        );

    Q  <= N1;
    Qn <= N2;

end Structural;