library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity D_LATCH1_tb is
end D_LATCH1_tb;

architecture Behavioral of D_LATCH1_tb is

    component D_LATCH1
        Port (
            D  : in  STD_LOGIC;
            EN : in  STD_LOGIC;
            Q  : out STD_LOGIC;
            Qn : out STD_LOGIC
        );
    end component;

    signal D  : STD_LOGIC := '0';
    signal EN : STD_LOGIC := '0';
    signal Q  : STD_LOGIC;
    signal Qn : STD_LOGIC;

begin

    uut: D_LATCH1
        port map (
            D  => D,
            EN => EN,
            Q  => Q,
            Qn => Qn
        );

    stimulus: process
    begin

        -- Enable OFF
        D <= '0';
        EN <= '0';
        wait for 10 ns;

        -- Enable ON, D = 0
        D <= '0';
        EN <= '1';
        wait for 10 ns;

        -- Enable ON, D = 1
        D <= '1';
        EN <= '1';
        wait for 10 ns;

        -- Enable OFF, output should hold
        D <= '0';
        EN <= '0';
        wait for 10 ns;

        -- Enable ON, D = 0
        D <= '0';
        EN <= '1';
        wait for 10 ns;

        wait;

    end process;

end Behavioral;