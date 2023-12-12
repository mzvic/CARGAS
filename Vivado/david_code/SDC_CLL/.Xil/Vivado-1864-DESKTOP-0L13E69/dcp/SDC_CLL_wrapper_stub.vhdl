-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SDC_CLL_wrapper is
  Port ( 
    JA_0 : out STD_LOGIC;
    JA_1 : in STD_LOGIC;
    JA_2 : in STD_LOGIC;
    JA_3 : out STD_LOGIC;
    JB_0 : out STD_LOGIC;
    JB_1 : in STD_LOGIC;
    JB_2 : in STD_LOGIC;
    JB_3 : out STD_LOGIC;
    JC_0 : out STD_LOGIC;
    JC_1 : out STD_LOGIC;
    JC_2 : out STD_LOGIC;
    JD_1 : in STD_LOGIC;
    JD_2 : out STD_LOGIC;
    clk : in STD_LOGIC;
    led : out STD_LOGIC_VECTOR ( 2 downto 0 );
    led_ind : out STD_LOGIC
  );

end SDC_CLL_wrapper;

architecture stub of SDC_CLL_wrapper is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
begin
end;
