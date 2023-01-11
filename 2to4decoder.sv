`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2022 03:53:19
// Design Name: 
// Module Name: 2to4decoder
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

module to4decodermodule(input a1, b1, c1, output y0, y1, y2, out);
wire w1, w2;
to_2_decoder dec1(a1, b1, w1, w2);
to_2_decoder dec2(w1, c1, y0,y1);
to_2_decoder dec3(w2, c1, y2,out);
endmodule

