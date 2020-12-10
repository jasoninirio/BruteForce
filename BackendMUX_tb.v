`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 02:09:04 PM
// Design Name: 
// Module Name: BackendMUX_tb
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


module BackendMUX_tb();
reg clk;
reg reset;
reg [3:0] keyboard_input;
wire [6:0] p1_health_out;
wire [6:0] cpu_health_out;


BackendMUXs mechanics(clk, reset,keyboard_input, p1_health_out, cpu_health_out);


initial begin
#10 clk = 1; reset = 0; keyboard_input = 0;
end

always begin
#5 clk = ~clk;
end

always begin
#10 keyboard_input = 1;
#10 keyboard_input = 1;
#10 keyboard_input = 0;
#10 keyboard_input = 1;
#10 keyboard_input = 1;
#10 keyboard_input = 2;
#10 keyboard_input = 2;
#10 keyboard_input = 1;
#10 keyboard_input = 0;
#10 keyboard_input = 1;
#10 keyboard_input = 1;
#10 keyboard_input = 1;
#10 keyboard_input = 1;
end








endmodule
