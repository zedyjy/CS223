`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.10.2021 11:50:00
// Design Name: 
// Module Name: two_bit
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


module two_bit(
    input a,
    input b,
    input c,
    input a2,
    input b2,
    output sum1,
    output cout2,
    output sum2
    );
    logic cout1;
full_adder f1(a,b,c,sum1,cout1);
full_adder f2(cout1,a2,b2,sum2,cout2);                    

endmodule
