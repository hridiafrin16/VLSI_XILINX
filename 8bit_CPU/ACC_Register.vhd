
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ACC_Register is
    Port (
        CLK  : in  STD_LOGIC;
        LOAD : in  STD_LOGIC;
        DATA : in  STD_LOGIC_VECTOR(7 downto 0);
        Q    : out STD_LOGIC_VECTOR(7 downto 0)
    );
end ACC_Register;

architecture Structural of ACC_Register is

    component D_Flip_Flop
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC
        );
    end component;

    component MUX_2to1
        Port (
            A   : in  STD_LOGIC;
            B   : in  STD_LOGIC;
            SEL : in  STD_LOGIC;
            Y   : out STD_LOGIC
        );
    end component;

    signal Q_internal : STD_LOGIC_VECTOR(7 downto 0);
    signal D_internal : STD_LOGIC_VECTOR(7 downto 0);

begin

    GEN_ACC: for i in 0 to 7 generate

        -- LOAD = 1: new DATA
        -- LOAD = 0: retain previous Q
        MUX_ACC: MUX_2to1
            port map (
                A   => Q_internal(i),
                B   => DATA(i),
                SEL => LOAD,
                Y   => D_internal(i)
            );

        FF_ACC: D_Flip_Flop
            port map (
                D   => D_internal(i),
                CLK => CLK,
                Q   => Q_internal(i)
            );

    end generate GEN_ACC;

    Q <= Q_internal;

end Structural;