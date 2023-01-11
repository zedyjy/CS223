`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2021 11:23:11
// Design Name: 
// Module Name: two_bit_adder_behavioral
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


module two_bit_adder_behavioral(
    input logic a,
    input logic b,
    input logic c,
    input logic a2,
    input logic b2,
    output logic sum1,
    output logic cout2,
    output logic sum2
    );
    
logic cout1;
full_adder f1(a,b,c,sum1,cout1);
full_adder f2(cout1,a2,b2,sum2,cout2);                    

endmodule
