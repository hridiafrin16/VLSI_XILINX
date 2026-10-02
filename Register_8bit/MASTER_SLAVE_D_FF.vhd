library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MASTER_SLAVE_D_FF is
    Port (
        D  : in  STD_LOGIC;
        CLK : in  STD_LOGIC;
        Q  : out STD_LOGIC;
        Qn : out STD_LOGIC
    );
end MASTER_SLAVE_D_FF;

architecture Structural of MASTER_SLAVE_D_FF is

    component NOT_GATE
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    component D_LATCH1
        Port (
            D  : in  STD_LOGIC;
            EN : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    component Second_D_LATCH
        Port (
            D  : in  STD_LOGIC;
            EN : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal CLKn : STD_LOGIC;
    signal Qm   : STD_LOGIC;
    signal Qmn  : STD_LOGIC;

begin

    -- NOT gate for inverted clock
    NOT1: NOT_GATE
        port map (
            A => CLK,
            Y => CLKn
        );

    -- Master latch
    MASTER: D_LATCH1
        port map (
            D  => D,
            EN => CLKn,
            Q  => Qm,
            Qn => Qmn
        );

    -- Slave latch
    SLAVE: Second_D_LATCH
        port map (
            D  => Qm,
            EN => CLK,
            Q  => Q,
            Qn => Qn
        );

end Structural;