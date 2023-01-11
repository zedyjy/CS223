`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2021 08:45:05
// Design Name: 
// Module Name: traffic_lights
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



module traffic_lights ( input logic sA, sB, clk, reset,
                        output logic [2:0]LA, [2:0]LB );
                        
    typedef enum logic [2:0] {S0,S1,S2,S3,S4,S5,S6,S7} statetype;
    statetype current, next;
    
    
    always_ff@(posedge clk, posedge reset) 
        if(reset) current <= S0;
        else current <= next;


   
    always_comb
    case(current)
        S0: if(sA) next = S0;
            else next = S1;

        S1: next = S2;
        S2: next = S3;
        S3: next = S4;
        S4: if(sB) next = S4;
            else next = S5;

        S5: next = S6;
        S6: next = S7;
        S7: next = S0;
	
        default: next = S0;
     endcase
     
        assign LA1 = (current == S2 | current == S3 | current == S4 | current == S5 | current == S6);
        assign LB1 = (current == S0 | current == S1 | current == S2 | current == S6 | current == S7);
        
        assign LA0 = (current == S1 | current == S7);
        assign LB0 = (current == S3 | current == S5);
                
endmodule


module traffic_lights_testbench ();
    logic [1:0] LA, LB;
    logic sA, sB,reset, clk;
    
    traffic_lights dut( sA, sB, clk, reset, LA, LB);
    initial
        begin
            reset = 1; #10;
            reset = 0; sA = 1; #10;
            sA = 0; #10;
            
            #10;
            #10;
            #10;
            
            sB = 1; #10;
            sB = 0; #10;

        end
    always
        begin
            clk <= 1; #5;
            clk <= 0; #5;
        end
endmodule





