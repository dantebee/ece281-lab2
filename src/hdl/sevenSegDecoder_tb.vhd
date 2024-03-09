--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : sevenSegDecoder_tb.vhd
--| AUTHOR(S)     : Dante Benedetti
--| CREATED       : 01/30/2019 Last Modified 03/09/2024
--| DESCRIPTION   : This file implements a test bench for the full adder top level design.
--|
--| DOCUMENTATION : None
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : top_basys3.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is

    component sevenSegDecoder is
        port ( 
            i_D : in STD_LOGIC_VECTOR (3 downto 0);
            o_S : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component sevenSegDecoder;
    
    signal w_sw : std_logic_vector (3 downto 0) := x"0";
    signal w_seg : std_logic_vector (6 downto 0) := "0000000";

begin
        --PORT MAPS
        sevenSegDecoder_inst : sevenSegDecoder port map (
        i_D => w_sw,
        o_S => w_seg
        );
        
        test_process : process 
        begin
        
            w_sw <= x"0"; wait for 10 ns;
                assert w_seg = "1000000" report "error on x0" severity failure;
            w_sw <= x"1"; wait for 10 ns;
                assert w_seg = "1111001" report "error on x1" severity failure;
            w_sw <= x"2"; wait for 10 ns;
                assert w_seg = "0100100" report "error on x2" severity failure;
            w_sw <= x"3"; wait for 10 ns;
                assert w_seg = "0110000" report "error on x3" severity failure;
            w_sw <= x"4"; wait for 10 ns;
                assert w_seg = "0011001" report "error on x4" severity failure;
            w_sw <= x"5"; wait for 10 ns;
                assert w_seg = "0010010" report "error on x5" severity failure;
            w_sw <= x"6"; wait for 10 ns;
                assert w_seg = "0000010" report "error on x6" severity failure;
            w_sw <= x"7"; wait for 10 ns;
                assert w_seg = "1111000" report "error on x7" severity failure;
            w_sw <= x"8"; wait for 10 ns;
                assert w_seg = "0000000" report "error on x8" severity failure;
            w_sw <= x"9"; wait for 10 ns;
                assert w_seg = "0011000" report "error on x9" severity failure;
            w_sw <= x"A"; wait for 10 ns;
                assert w_seg = "0001000" report "error on xA" severity failure;
            w_sw <= x"B"; wait for 10 ns;
                assert w_seg = "0000011" report "error on xB" severity failure;
            w_sw <= x"C"; wait for 10 ns;
                assert w_seg = "0100111" report "error on xC" severity failure;
            w_sw <= x"D"; wait for 10 ns;
                assert w_seg = "0100001" report "error on xD" severity failure;
            w_sw <= x"E"; wait for 10 ns;
                assert w_seg = "0000110" report "error on xE" severity failure;
            w_sw <= x"F"; wait for 10 ns;
                assert w_seg = "0001110" report "error on xF" severity failure;    
            
        wait;
        end process;    

end test_bench;
