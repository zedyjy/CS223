`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2022 01:05:05
// Design Name: 
// Module Name: lab4_vol3
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


module lab4_vol3(
    input ckk,
    input reset,
    input SA,
    input SB,
    output logic [2:0] la,lb
    );
    typedef enum logic [2:0] {S0, S1, S2, S3, S4, S5, S6, S7} stateType;
    parameter green = 3'b011,
              yellow= 3'b001,
              red = 3'b111;
              
      reg[31:0] time1 = 0;
      reg clk1;
              always @(posedge ckk)
              begin
                  time1 <= time1 +1;
                  if(time1 == 300000000)
                      begin
                     time1 <= 0;
                      clk1 <= ~clk1;
                      end
                  end
stateType currentState, nextState;
always_ff @(posedge clk1 ,posedge reset)
if(reset)currentState <=S0;
    else  currentState <= nextState;
           always_comb
                case(currentState)
                   S0: if(~SB) nextState=S0;
                else nextState=S1;
                   S1:nextState=S2;
                   S2:nextState=S3;
                   S3:nextState=S4; 
                   S4: if (~SA&SB) nextState=S4;
                       else nextState=S5;
                   S5:nextState=S6;
                   S6:nextState=S7;
                   S7:nextState=S0;
                 endcase
                    
            always_comb
                  case(currentState)
                    S0:{la,lb} = {green,red};
                    S1:{la,lb} = {yellow,red};
                    S2:{la,lb} = {red,red};
                    S3:{la,lb} = {red,yellow};
                    S4:{la,lb} = {red,green};
                    S5:{la,lb} = {red,yellow};
                    S6:{la,lb} = {red,red};
                    S7:{la,lb} = {yellow,red};
                  endcase
endmodule

