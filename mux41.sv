`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.03.2022 04:08:24
// Design Name: 
// Module Name: mux41
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
module mux21(input logic d0,d1,s0,
             output logic y);
assign y = ((d0 & ~s0) | (d1 & s0));                         
endmodule


module mux41( input logic a0,a1,a2,a3,a4,s1,s2,
              output logic y);
logic n1,n2;    
mux21 mux1( a0,a1,s1,n1);
mux21 mux2( a2,a3,s1,n2);
mux21 mux3(n1,n2,s2,y);
endmodule 

