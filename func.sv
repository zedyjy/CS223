`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2022 18:15:42
// Design Name: 
// Module Name: func
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
module mux21(input logic i0, i1,s, output logic y); 
    assign y = (i0 & ~s) | (i1 & s);
endmodule

module and1(input logic a,b,	
            output logic x);
assign x = a & b; 
endmodule 
module or1(input logic a,b,
           output logic x); 
assign x = a | b;           
endmodule

module mux41(input logic d0,d1,d2,d3,s0,s1,
output logic y);
assign y = ((d0 & ~s0 & ~s1) | (d1 & s0 & ~s1) | (d2 & ~s0 & s1) | (d3 & s0 & s1));
endmodule
 
module mux81( input logic a0,a1,a2,a3,a4,a5,a6,a7,s1,s2,s3,
              output logic y);
logic n1,n2,n3,n4;    
mux41 mux1( a0,a1,a2,a3,s1,s2,n1);
mux41 mux2( a4,a5,a6,a7,s1,s2,n2);
and1 and1(n2,s3,n3);
and1 and2(~s3,n1,n4);
or1 or1(n3,n4,y);           
endmodule


module func( input a, b, c, d, output y);
logic sel[2:0];
assign sel[0]=c;
assign sel[1]=b;
assign sel[2]=a;
mux81 mul( 0, 1, 0, 1, 1, 0, 1, 0, c,b,a, y);
endmodule
