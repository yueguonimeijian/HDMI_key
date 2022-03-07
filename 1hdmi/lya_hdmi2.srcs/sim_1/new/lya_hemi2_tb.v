`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/07 15:03:09
// Design Name: 
// Module Name: lya_hemi2_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lya_hemi2_tb;

    reg sys_clk;
    reg KEY;
    
    wire oen;
    wire HDMI1_CLK_P;
    wire HDMI1_CLK_N;
    wire HDMI1_D2_P;
    wire  HDMI1_D2_N;
    wire  HDMI1_D1_P;
    wire  HDMI1_D1_N;
    wire  HDMI1_D0_P;
    wire  HDMI1_D0_N;
wire [3:0] LED;

initial
begin
sys_clk=1'b1;
KEY=1'b1;
#200
KEY=2'b10;
end

always #10 sys_clk=~sys_clk;

 top top1(
    .sys_clk(sys_clk),
    .KEY(KEY),
    
    .oen(oen),
    .HDMI1_CLK_P(HDMI1_CLK_P),
    .HDMI1_CLK_N(HDMI1_CLK_N),
    .HDMI1_D2_P(HDMI1_D2_P),
    .HDMI1_D2_N(HDMI1_D2_N),
    .HDMI1_D1_P(HDMI1_D1_P),
    .HDMI1_D1_N(HDMI1_D1_N),
    .HDMI1_D0_P(HDMI1_D0_P),
    .HDMI1_D0_N(HDMI1_D0_N),
    
    .LED(LED)
);


endmodule
