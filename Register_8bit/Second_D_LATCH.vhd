library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Second_D_LATCH is
    Port (
        D  : in  STD_LOGIC;
        EN : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end Second_D_LATCH;

architecture Structural of Second_D_LATCH is

    component NOT_GATE
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component NAND_GATE
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component LATCH_L1
        Port (
            S  : in  STD_LOGIC;
            R  : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal Dn : STD_LOGIC;
    signal S  : STD_LOGIC;
    signal R  : STD_LOGIC;

begin

    NOT1: NOT_GATE
        port map (
            A => D,
            Y => Dn
        );

    NAND1: NAND_GATE
        port map (
            A => D,
            B => EN,
            Y => S
        );

    NAND2: NAND_GATE
        port map (
            A => Dn,
            B => EN,
            Y => R
        );

    LATCH1: LATCH_L1
        port map (
            S  => S,
            R  => R,
            Q  => Q,
            Qn => Qn
        );

end Structural;