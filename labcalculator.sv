`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2022 23:44:43
// Design Name: 
// Module Name: labcalculator
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
module halfAdder(
input logic a,input logic b, output logic c,output logic s
    );
logic s;
logic c;
always @ (a,b)
begin 
s = a^b;
c = a&b;
end
endmodule
module halfsubtractor(input logic a,input logic b, output logic c, output logic s);
logic s;
logic c;
always @ (a,b)
begin 
s = a^b;
c = ~a&b;
end
endmodule

module labcalculator(input logic a,input logic b,input logic c,input logic d, output logic y,output logic z);
logic a1,a2,a3,a4,a5,a6;
assign a1 = a^b;
assign a2 = ~(a&b);
halfAdder halfadder(a,b,a3,a4);
halfsubtractor halfsubtractor(a,b,a5,a6);
assign y= c? (d? (a5) : (a3)) : (d? (a2) : (a1));
assign z = c? (d?(a6) : (a4)) : 1;
endmodule


