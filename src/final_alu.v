`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2020 01:13:01 PM
// Design Name: 
// Module Name: final_alu
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


module final_alu(
    input clk, reset,
    input clk_kb, data_kb,
    output wire [9:0] led,
    output wire hSync, vSync,
    output wire [11:0] VGA,
    output wire speaker
    );
    
    wire [3:0] keyboard_input;
    wire [7:0] player_health, cpu_health;
    wire cpu_isAttacking;
    
    BruteForceFull bff(.clk(clk), .reset(reset), .clk_kb(clk_kb), .data_kb(data_kb), .keyboard_input(keyboard_input), .led(led));
    
    BackendMUX mux(.clk(clk), .reset(reset), .keyboard_input(keyboard_input), .p1_health_out (player_health), .cpu_health_out(cpu_health), .cpu_isAttacking(cpu_isAttacking));
    
    Alarm_Sound(.clk(clk), .speaker(speaker));
    
//    seven_seg ss(.clk(clk), .cpu_health_out(cpu_health), .p1_health_out(player_health), .hexnum(segment),.Anode_Activate(ss_digit));
    
    vga_display vga(.clk(clk), .reset(reset), .keyboard_input(keyboard_input), .cpu_isAttacking(cpu_isAttacking), .p1_health_out (player_health), .cpu_health_out(cpu_health), .hSync(hSync), .vSync(vSync), .VGA(VGA));
    
endmodule

