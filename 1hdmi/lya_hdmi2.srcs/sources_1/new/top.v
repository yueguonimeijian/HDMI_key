`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/07 14:40:32
// Design Name: 
// Module Name: top
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


module top(
    input       sys_clk,
    input       KEY,
    
    output wire oen,
    output HDMI1_CLK_P,
    output HDMI1_CLK_N,
    output HDMI1_D2_P,
    output HDMI1_D2_N,
    output HDMI1_D1_P,
    output HDMI1_D1_N,
    output HDMI1_D0_P,
    output HDMI1_D0_N,
    
    output  [3:0]   LED
);

wire pixclk;
wire[7:0]   R,G,B;
wire HS,VS,DE;
assign VGA_HS   =   HS;
assign VGA_VS   =   VS;
assign  VGA_D   =   {R[7:4],G[7:2],B[7:4]};
hdmi_data_gen u_hdmi_data_gen
(
    .pix_clk            (pixclk),
    .turn_mode          (KEY),
    .VGA_R              (R),
    .VGA_G              (G),
    .VGA_B              (B),
    .VGA_HS             (HS),
    .VGA_VS             (VS),
    .VGA_DE             (DE),
    .mode                (LED)
);

wire pixclk_X5;
//wire i2c_clk;
wire lock;
wire[23:0]  RGB;
assign RGB={R,G,B};

rgb2dvi_0 rgbsd (
  .TMDS_Clk_p(HDMI1_CLK_P),    // output wire TMDS_Clk_p
  .TMDS_Clk_n(HDMI1_CLK_N),    // output wire TMDS_Clk_n
  .TMDS_Data_p({HDMI1_D2_P,HDMI1_D1_P,HDMI1_D0_P}),  // output wire [2 : 0] TMDS_Data_p
  .TMDS_Data_n({HDMI1_D2_N,HDMI1_D1_N,HDMI1_D0_N}),  // output wire [2 : 0] TMDS_Data_n
  .oen(oen),                  // output wire oen
  .aRst_n(lock),            // input wire aRst_n
  .vid_pData(RGB),      // input wire [23 : 0] vid_pData
  .vid_pVDE(DE),        // input wire vid_pVDE
  .vid_pHSync(HS),    // input wire vid_pHSync
  .vid_pVSync(VS),    // input wire vid_pVSync
  .PixelClk(pixclk),        // input wire PixelClk
  .SerialClk(pixclk_X5)      // input wire SerialClk
);

  clk_vga clk_vga
   (
    // Clock out ports
    .clk_out1(pixclk),     // output clk_out1
    .clk_out2(pixclk_X5),     // output clk_out2
    // Status and control signals
    .reset(1'b0), // input reset
    .locked(lock),       // output locked
   // Clock in ports
    .clk_in1(sys_clk));  

endmodule
