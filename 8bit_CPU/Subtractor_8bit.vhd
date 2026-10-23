
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Subtractor_8bit is
    Port (
        A, B  : in  STD_LOGIC_VECTOR(7 downto 0);
        DIFF  : out STD_LOGIC_VECTOR(7 downto 0);
        BORROW : out STD_LOGIC
    );
end Subtractor_8bit;

architecture Structural of Subtractor_8bit is
    component Full_Adder
        Port (
            A, B, CIN : in  STD_LOGIC;
            SUM, COUT : out STD_LOGIC
        );
    end component;

    component NOT_Gate
        Port (A : in STD_LOGIC; Y : out STD_LOGIC);
    end component;

    signal NB : STD_LOGIC_VECTOR(7 downto 0);
    signal C  : STD_LOGIC_VECTOR(8 downto 0);
begin
    C(0) <= '1';

    GEN_INV: for i in 0 to 7 generate
        INV: NOT_Gate port map(A => B(i), Y => NB(i));
    end generate;

    GEN_FA: for i in 0 to 7 generate
        FA: Full_Adder
            port map(
                A => A(i), B => NB(i), CIN => C(i),
                SUM => DIFF(i), COUT => C(i+1)
            );
    end generate;

    BORROW <= not C(8);
end Structural;