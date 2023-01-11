`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2021 23:58:20
// Design Name: 
// Module Name: D_flip_flop
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


module D_flip_flop(D,Q,Qx,reset,clk);
    input D;
    input reset;
    input clk;
    output reg Q;
    output Qx;
    
    assign Qx=~Q;
    
    always@(posedge clk)
    begin
    if(reset)
    Q=0;
    else
    Q=D;
    end
endmodule

module behavioral2_1mux(y,a,b,s);
    input logic a,b,s;
    output logic y;
    wire first_and,sec_and,s_c;
    
    not(s_c,s);
    and(first_and,a,s_c);
    and(sec_and,b,s);
    or(y,first_and_sec_and);
    
endmodule

module mux_logic(y,d0,d1,d2,d3,s1,s0);
    input logic d0;
    input logic d1;
    input logic d2;
    input logic d3;
    input logic s1;
    input logic s0;
    
    output logic y;
    
    wire muxone;
    wire muxtwo;
    
    behavioral2_1mux mux_1(muxone,d0,d1,s1);
    behavioral2_1mux mux_2(muxtwo,d2,d3,s1);
    behavioral2_1mux mux_3(y,muxone,muxtwo,s0);
endmodule
    
module functional(shl_in,shr_in,p_in,p_out,clk,reset,s0,s1);
    input shr_in;
    input shl_in;
    input s0,s1;
    input clk;
    input reset;
    
    input [3:0] p_in;
    output [3:0] p_out;
    
    reg[3:0]Q;
    reg[3:0]Qx;
    
    wire y0,y1,y2,y3;
    
    assign p_out=Q;
    
    mux_logic mux1(s0,s1,y0,Q[0],shr_in,Q[1],p_in[3]);
    D_flip_flop flp1(y0,Q[0],Qx[0],reset,clk);
    
    mux_logic mux2(s0,s1,y1,Q[1],Q[0],Q[2],p_in[2]);
    D_flip_flop flp2(y1,Q[1],Qx[1],reset,clk);
    
    mux_logic mux3(s0,s1,y2,Q[1],Q[2],Q[3],p_in[1]);
    D_flip_flop flp3(y2,Q[2],Qx[2],reset,clk);
    
    mux_logic mux4(s0,s1,y3,Q[3],Q[2],shl_in,p_in[0]);
    D_flip_flop flp4(y3,Q[3],Qx[3],reset,clk);
    
endmodule

