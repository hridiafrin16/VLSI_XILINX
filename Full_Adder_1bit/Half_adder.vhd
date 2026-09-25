library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port (
        A     : in STD_LOGIC;
        B     : in STD_LOGIC;
        Sum   : out STD_LOGIC;
        Carry : out STD_LOGIC
    );
end Half_Adder;

architecture Structural of Half_Adder is

    component AND_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component XOR_gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

begin

    XOR1: XOR_gate
        port map (
            A => A,
            B => B,
            Y => Sum
        );

    AND1: AND_gate
        port map (
            A => A,
            B => B,
            Y => Carry
        );

end Structural;