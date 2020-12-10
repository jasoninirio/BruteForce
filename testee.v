`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 03:32:18 PM
// Design Name: 
// Module Name: testee
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


module testee(out, clk, rst);

output reg [1:0] out = 0;
input clk, rst;
wire feedback;

assign feedback = ~(out[1] ^ out[0]);

always @(posedge clk, posedge rst)
  begin
    if (rst)
      out = 1'b0;
    else
      
      out = {out[0],feedback};
  end

endmodule


