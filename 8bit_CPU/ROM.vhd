
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ROM is
    Port (
        ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
        INSTRUCTION : out STD_LOGIC_VECTOR(11 downto 0)
    );
end ROM;

architecture Behavioral of ROM is
begin

    process(ADDRESS)
    begin
        case ADDRESS is

            when "0000" =>
                INSTRUCTION <= x"13C"; -- LDI 0x3C

            when "0001" =>
                INSTRUCTION <= x"20F"; -- ADD 0x0F

            when "0010" =>
                INSTRUCTION <= x"30B"; -- SUB 0x0B

            when "0011" =>
                INSTRUCTION <= x"4F0"; -- AND 0xF0

            when "0100" =>
                INSTRUCTION <= x"50A"; -- OR 0x0A

            when "0101" =>
                INSTRUCTION <= x"34A"; -- SUB 0x4A

            when "0110" =>
                INSTRUCTION <= x"301"; -- SUB 0x01

            when others =>
                INSTRUCTION <= x"000";

        end case;
    end process;

end Behavioral;