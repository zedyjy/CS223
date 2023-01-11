`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2022 09:41:06
// Design Name: 
// Module Name: lab5vol4
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

module flipflop(input logic clk, input logic reset, in, output logic out);
    always_ff @(posedge clk)
        if(reset) out<=1'b0;
        else out<=in;
endmodule

//module shiftRegFF(input logic clk, input logic reset,shift, load,
//        input logic[7:0] d, output logic[7:0] q, out);
    
//        logic[7:0] temp;
    
//            flipflop l0(load, reset, d[0], temp[0]);
//            flipflop l1(load, reset, d[1], temp[1]);
//            flipflop l2(load, reset, d[2], temp[2]);
//            flipflop l3(load, reset, d[3], temp[3]);
//            flipflop l4(load, reset, d[4], temp[4]);
//           flipflop l5(load, reset, d[5], temp[5]);
//            flipflop l6(load, reset, d[5], temp[6]);
//            flipflop l0(load, reset, d[7], temp[7]);
            
            
//    always_comb
//    if(shift) begin
//        flipflop f0(clk, reset, q[0], q[1]);
//        flipflop f1(clk, reset, q[1], q[2]);
//        flipflop f2(clk, reset, q[2], q[3]);
//        flipflop f3(clk, reset, q[3], q[4]);
//        flipflop f4(clk, reset, q[4], q[5]);
//        flipflop f5(clk, reset, q[5], q[6]);
//        flipflop f6(clk, reset, q[6], q[7]);
//        flipflop f0(clk, reset, q[7], 1'b0);
//    end
//    else if(load) begin
//        q=temp;
//    end
//    assign out=q[0];
//endmodule

module shiftreg(input logic clk, reset, load, shift, sin,
    input logic [7:0] d, output logic [7:0] q, output logic out);
    
    always_ff @(posedge clk)begin
            if(reset) q<=8'b00000000;
            else if(load) q<=d;
            else if(shift) q<={sin, q[7:1]};
            else q<=q;
        end
   assign out=q[0];
endmodule

module debounce(input logic clk, input logic button,output logic pulse );

logic [24:0] timer;
typedef enum logic [1:0]{S0,S1,S2,S3} states;
states state, nextState;
logic gotInput;

always_ff@(posedge clk)
    begin    
        state <= nextState;
        if(gotInput)
            timer <= 25000000;
        else
            timer <= timer - 1;
    end
always_comb
    case(state)
        S0: if(button) 
            begin //startTimer
                nextState = S1;    
                gotInput = 1;
            end
            else begin nextState = S0; gotInput = 0; end
        S1: begin nextState = S2; gotInput = 0; end
        S2: begin nextState = S3; gotInput = 0; end
        S3: begin if(timer == 0) nextState = S0; else nextState = S3; gotInput = 0; end
        default: begin nextState = S0; gotInput = 0; end
        endcase

assign pulse = ( state == S1 );
endmodule

module fullAdder(input logic clk, a, b, cin, output logic s, cout);

always@(clk) begin
    s<= a^b^cin;
    cout<= (a&b) | (cin&(a^b));
    end
endmodule

module serialAdder(input logic[7:0] a, b,
    input logic shift, reset, load, clk,
    output logic[7:0] out);
    
    logic[7:0] adda;
    logic[7:0] addb;
    //logic couta, coutb;
    //logic cin, sum, cout;
    logic pulsesh, pulseld, pulser;
    
    debounce shift(clk, shift, pulsesh);
    debounce load(clk, load, pulseld);
    debounce shift(clk, reset, pulser);
 
    fullAdder add( clk, couta, coutb, cin, sum, cout);
    flipflop flcarry(clk, pulser, cout, cin);
        shiftreg regout(clk, pulser, pulseld, pulsesh, sum, 8'b00000000, outreg, out);

    shiftreg rega(clk, pulser, pulseld, pulsesh, 1'b0, a, adda, couta);
    shiftreg regb(clk, pulser, pulseld, pulsesh, 1'b0, b, addb, coutb);
    
endmodule
module lab5vol4(

    );
endmodule
