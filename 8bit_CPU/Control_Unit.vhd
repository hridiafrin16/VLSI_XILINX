
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
    Port (
        OPCODE          : in  STD_LOGIC_VECTOR(3 downto 0);
        ACC_LOAD        : out STD_LOGIC;
        LOAD_IMMEDIATE  : out STD_LOGIC;
        ALU_OPCODE      : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Control_Unit;

architecture Behavioral of Control_Unit is
begin

    process(OPCODE)
    begin

        ACC_LOAD       <= '0';
        LOAD_IMMEDIATE <= '0';
        ALU_OPCODE     <= OPCODE;

        case OPCODE is

            when "0001" =>
                ACC_LOAD       <= '1';
                LOAD_IMMEDIATE <= '1';

            when "0010" =>
                ACC_LOAD <= '1';

            when "0011" =>
                ACC_LOAD <= '1';

            when "0100" =>
                ACC_LOAD <= '1';

            when "0101" =>
                ACC_LOAD <= '1';

            when others =>
                ACC_LOAD       <= '0';
                LOAD_IMMEDIATE <= '0';

        end case;

    end process;

end Behavioral;