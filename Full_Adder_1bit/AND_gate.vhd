library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end AND_gate;

architecture Structural of AND_gate is

    component NAND_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal X : STD_LOGIC;

begin

    -- First NAND gate
    NAND1: NAND_gate
        port map (
            A => A,
            B => B,
            Y => X
        );

    -- Second NAND gate
    NAND2: NAND_gate
        port map (
            A => X,
            B => X,
            Y => Y
        );

end Structural;