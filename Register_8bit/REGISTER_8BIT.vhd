library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REGISTER_8BIT is
    Port (
        D   : in  STD_LOGIC_VECTOR(7 downto 0);
        CLK : in  STD_LOGIC;
        Q   : out STD_LOGIC_VECTOR(7 downto 0);
        Qn  : out STD_LOGIC_VECTOR(7 downto 0)
    );
end REGISTER_8BIT;

architecture Structural of REGISTER_8BIT is

    component REGISTER_1BIT
        Port (
            D   : in  STD_LOGIC;
            CLK : in  STD_LOGIC;
            Q   : out STD_LOGIC;
            Qn  : out STD_LOGIC
        );
    end component;

begin

    REG0: REGISTER_1BIT
        port map (
            D   => D(0),
            CLK => CLK,
            Q   => Q(0),
            Qn  => Qn(0)
        );

    REG1: REGISTER_1BIT
        port map (
            D   => D(1),
            CLK => CLK,
            Q   => Q(1),
            Qn  => Qn(1)
        );

    REG2: REGISTER_1BIT
        port map (
            D   => D(2),
            CLK => CLK,
            Q   => Q(2),
            Qn  => Qn(2)
        );

    REG3: REGISTER_1BIT
        port map (
            D   => D(3),
            CLK => CLK,
            Q   => Q(3),
            Qn => Qn(3)
        );

    REG4: REGISTER_1BIT
        port map (
            D   => D(4),
            CLK => CLK,
            Q   => Q(4),
            Qn => Qn(4)
        );

    REG5: REGISTER_1BIT
        port map (
            D   => D(5),
            CLK => CLK,
            Q   => Q(5),
            Qn => Qn(5)
        );

    REG6: REGISTER_1BIT
        port map (
            D   => D(6),
            CLK => CLK,
            Q   => Q(6),
            Qn => Qn(6)
        );

    REG7: REGISTER_1BIT
        port map (
            D   => D(7),
            CLK => CLK,
            Q   => Q(7),
            Qn => Qn(7)
        );

end Structural;