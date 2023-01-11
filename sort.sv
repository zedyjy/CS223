`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.12.2022 11:34:11
// Design Name: 
// Module Name: sort
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

module sort(input clk, input sortsig, input reg [3:0] in [7:0], 
                 output reg [3:0] out [7:0]);
                 
 
                 always @ (posedge clk) begin
                    if(sortsig) begin
                    
                    out <= in;
            
               
               end
         end
         
         always_comb begin
            if(sortsig) begin
                for(int i = 1; i <= 7; i++) begin
                    automatic int j = i;
                    while(j > 0 && out[j] > out[j-1]) begin
                        out[j] <= out[j-1];
                        out[j-1] <= out[j];
                        j=j-1;
                        end
                     end
                   end
                 end
endmodule