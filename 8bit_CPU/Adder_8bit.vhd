
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder_8bit is
    Port (
        A, B : in  STD_LOGIC_VECTOR(7 downto 0);
        SUM  : out STD_LOGIC_VECTOR(7 downto 0);
        COUT : out STD_LOGIC
    );
end Adder_8bit;

architecture Structural of Adder_8bit is
    component Full_Adder
        Port (
            A, B, CIN : in  STD_LOGIC;
            SUM, COUT : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(8 downto 0);
begin
    C(0) <= '0';

    GEN_FA: for i in 0 to 7 generate
        FA: Full_Adder
            port map(
                A => A(i), B => B(i), CIN => C(i),
                SUM => SUM(i), COUT => C(i+1)
            );
    end generate;

    COUT <= C(8);
end Structural;