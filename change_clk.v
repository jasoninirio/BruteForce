`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 03:36:42 PM
// Design Name: 
// Module Name: change_clk
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


module change_clk(clk,reset,sec_clk);
input clk;
input reset;
output reg sec_clk;
reg sec;
reg i;
wire [1:0] out;

parameter FIFTH = 2'b00,
          SIXTH = 2'b01,
          SEVENTH = 2'b10,
          FOURTH = 2'b11;
 
testee clkchnge(out, clk, reset);


 
always @(posedge clk or posedge reset) //current time // 10 MHz
begin
    if(reset) begin
        sec <= 0;
        sec_clk <= 0;
    end
    else begin
        if(out == FIFTH) 
            i <= 5;
        else if (out == SIXTH)
            i <= 6;
        else if (out == SEVENTH)
            i <= 6;
        else
            i <= 4;
            
        sec <= sec + i;
        if(sec <= 500000000) 
        sec_clk <= 0;
    else if (sec >= 1000000000) begin
        sec_clk <= 1;
        sec <= 1;
    end
    else
        sec_clk <= 1;
    end
 end
 
 endmodule