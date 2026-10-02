library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTER_1BIT is
    Port (
        D   : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC;
        Qn  : out STD_LOGIC
    );
end REGISTER_1BIT;

architecture Structural of REGISTER_1BIT is

    component MASTER_SLAVE_D_FF
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

begin

    FF1: MASTER_SLAVE_D_FF
        port map (
            D   => D,
            CLK => CLK,
            Q   => Q,
            Qn  => Qn
        );

end Structural;