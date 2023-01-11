`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2022 03:47:33
// Design Name: 
// Module Name: 1_to_2_decoder
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


module to_2_decoder(input in,cin,output y0,y1);
assign y0 = in & cin;
assign y1 = in & ~cin;
endmodule
