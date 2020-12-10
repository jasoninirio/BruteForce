`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 04:11:30 PM
// Design Name: 
// Module Name: backend_mux_tb
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


module backend_mux_tb();

reg clk, reset;
reg [3:0] keyboard_input;
wire [7:0] p1_health_out, cpu_health_out;
wire cpu_isAttacking;

BackendMUX bm(clk, reset, keyboard_input, p1_health_out, cpu_health_out, cpu_isAttacking);

initial begin
#10 clk = 1; reset = 0; keyboard_input = 4'b0000;
end

always begin
#5 clk = ~clk;
end

always begin
#10 keyboard_input = 4'b0000; 
#10 keyboard_input = 4'b0001;
#10 keyboard_input = 4'b0010;
#10 keyboard_input = 4'b0000;
#10 keyboard_input = 4'b0001;
#10 keyboard_input = 4'b0010;
#10 keyboard_input = 4'b0000; 
#10 keyboard_input = 4'b0001;
#10 keyboard_input = 4'b0010;
#10 keyboard_input = 4'b0000;
#10 keyboard_input = 4'b0001; 
#10 keyboard_input = 4'b0010;
#10 keyboard_input = 4'b0000;
#10 keyboard_input = 4'b0001;
#10 keyboard_input = 4'b0010;
end

endmodule
