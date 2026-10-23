
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PC is
    Port (
        CLK   : in  STD_LOGIC;
        RESET : in  STD_LOGIC;
        PC_IN : in  STD_LOGIC_VECTOR(3 downto 0);
        PC_OUT: out STD_LOGIC_VECTOR(3 downto 0)
    );
end PC;

architecture Structural of PC is

    component D_Flip_Flop
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

    signal D_internal : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Synchronous reset: RESET high hole PC = 0000
    D_internal <= "0000" when RESET = '1' else PC_IN;

    GEN_PC: for i in 0 to 3 generate

        FF: D_Flip_Flop
            port map (
                D   => D_internal(i),
                CLK => CLK,
                Q   => PC_OUT(i)
            );

    end generate GEN_PC;

end Structural;