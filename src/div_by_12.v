`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2020 05:29:20 PM
// Design Name: 
// Module Name: div_by_12
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


module div_by_12(
input [5:0] numer, 
output reg [2:0] quotient, 
output [3:0] remain);

reg [3:0] remain_bit3_bit2;

assign remain = {remain_bit3_bit2, numer[1:0]}; // the first 2 bits are copied through

always @(numer[5:2]) // and just do a divide by "3" on the remaining bits
case(numer[5:2])
   0: begin quotient=0; remain_bit3_bit2=0; end
   1: begin quotient=0; remain_bit3_bit2=1; end
   2: begin quotient=0; remain_bit3_bit2=2; end
   3: begin quotient=1; remain_bit3_bit2=0; end
   4: begin quotient=1; remain_bit3_bit2=1; end
   5: begin quotient=1; remain_bit3_bit2=2; end
   6: begin quotient=2; remain_bit3_bit2=0; end
   7: begin quotient=2; remain_bit3_bit2=1; end
   8: begin quotient=2; remain_bit3_bit2=2; end
   9: begin quotient=3; remain_bit3_bit2=0; end
 10: begin quotient=3; remain_bit3_bit2=1; end
 11: begin quotient=3; remain_bit3_bit2=2; end
 12: begin quotient=4; remain_bit3_bit2=0; end
 13: begin quotient=4; remain_bit3_bit2=1; end
 14: begin quotient=4; remain_bit3_bit2=2; end
 15: begin quotient=5; remain_bit3_bit2=0; end
endcase
endmodule
