`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2021 11:06:49
// Design Name: 
// Module Name: full_adder_structural
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

module and1(input logic a,b,
           output logic x);
assign x = a & b; 
endmodule         
module or1(input logic a,b,
           output logic x); 
assign x = a | b;           
endmodule 
module xor1(input logic a,b,
           output logic x); 
assign x = a ^ b;           
endmodule           
module full_adder_structural(input logic a,b,c,
                 output logic x,y);
logic n1;
logic n2;
logic n3; 

xor1 xorgate1(a,b,n1);
xor1 xorgate2(n1,c,x);
and1 andgate1(n1,c,n2);
and1 andgate2(a,b,n3);
or1 orgate1(n2,n3,y);
endmodule
