
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC_Incrementer is
    Port (
        PC_IN  : in  STD_LOGIC_VECTOR(3 downto 0);
        PC_OUT : out STD_LOGIC_VECTOR(3 downto 0)
    );
end PC_Incrementer;

architecture Structural of PC_Incrementer is

    component Half_Adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            SUM   : out STD_LOGIC;
            CARRY : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(4 downto 0);

begin

    C(0) <= '1';

    GEN_INC: for i in 0 to 3 generate
        HA: Half_Adder
            port map (
                A     => PC_IN(i),
                B     => C(i),
                SUM   => PC_OUT(i),
                CARRY => C(i+1)
            );
    end generate GEN_INC;

end Structural;