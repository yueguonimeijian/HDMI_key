-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Mon Mar  7 14:35:14 2022
-- Host        : LAPTOP-IQ4BBTRE running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               d:/lya_lianxi/lya_finish/hdmi2/lya_hdmi2/lya_hdmi2.srcs/sources_1/ip/clk_vga/clk_vga_stub.vhdl
-- Design      : clk_vga
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_vga is
  Port ( 
    clk_out1 : out STD_LOGIC;
    clk_out2 : out STD_LOGIC;
    reset : in STD_LOGIC;
    locked : out STD_LOGIC;
    clk_in1 : in STD_LOGIC
  );

end clk_vga;

architecture stub of clk_vga is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk_out1,clk_out2,reset,locked,clk_in1";
begin
end;
