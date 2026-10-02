library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH1 is
    Port (
        D  : in  STD_LOGIC;
        EN : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end D_LATCH1;

architecture Structural of D_LATCH1 is

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

    component SR_LATCH1
        Port (
            S  : in  STD_LOGIC;
            R  : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal Dn : STD_LOGIC;
    signal Sn : STD_LOGIC;
    signal Rn : STD_LOGIC;

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
            Y => Sn
        );

    NAND2: NAND_GATE
        port map (
            A => Dn,
            B => EN,
            Y => Rn
        );

    SR1: SR_LATCH1
        port map (
            S  => Sn,
            R  => Rn,
            Q  => Q,
            Qn => Qn
        );

end Structural;