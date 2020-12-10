`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 01:55:59 PM
// Design Name: 
// Module Name: LFSR_tb
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


module LFSR_tb();
reg clk;
reg reset;
reg [3:0] type;
reg isPlayer;
wire [1:0] state;

LFSR uut(clk, reset, type, isPlayer, state);


initial begin
#10 clk = 1; reset = 0; type = 0; isPlayer = 1;
end

always begin
#5 clk = ~clk;
end

always begin
#10 type = 1; 
#10 type = 2;
#10 type = 1; 
#10 type = 2;
#10 type = 1; 
#10 type = 2;
#10 type = 1; 
#10 type = 2;
#10 type = 1; 
#10 type = 2;
end

endmodule
