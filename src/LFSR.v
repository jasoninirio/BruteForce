`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2020 02:05:40 PM
// Design Name: 
// Module Name: ProbMachine
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


module LFSR(
    input clk, reset,
    input [3:0] type,
    input isPlayer,
    output reg[1:0] state
    );
    
    reg [7:0] random_done = 0;
    wire feedback;
    
    // Attack Types:
    parameter STANDBY = 4'b0000,
            LIGHT = 4'b0001,
            HEAVY = 4'b0010;
            
    // Attack States:
    parameter NO_HIT = 2'b00,
            CRITICAL = 2'b01,
            NORMAL = 2'b10,
            MISS = 2'b11;
            

assign feedback = ~(random_done[7] ^ random_done[6]);

always @(posedge clk)
begin
    if (reset)
      random_done = 8'b00000000;
    else
      random_done = {random_done[6:0],feedback};
 end        
            
    always @ (*) begin
//        if (count == 8) begin
//            random_done = random;
//        end
        
        if (isPlayer) begin // Player
            if (type == LIGHT) begin
                if (random_done >= 0 && random_done <= 26)
                     state <= CRITICAL;
                else if (random_done >= 27 && random_done <= 243)
                    state = NORMAL;
                else if (random_done >= 244 && random_done <= 255)
                    state = MISS;
                else
                    state = NO_HIT;
            end
            else if (type == HEAVY) begin
                if (random_done >= 0 && random_done <= 77)
                    state = CRITICAL;
                else if (random_done >= 78 && random_done <= 154)
                    state = NORMAL;
                else if (random_done >= 155 && random_done <= 255)
                    state = MISS;
                else
                    state = NO_HIT;
            end
            else
                state = NO_HIT;
        end
        else begin // CPU
            if (random_done >= 0 && random_done <= 69)
                state = CRITICAL;
            else if (random_done >= 69 && random_done <= 169)
                state = NORMAL;
            else if (random_done >= 169 && random_done <= 255)
                state = MISS;
            else
                state = NO_HIT;
        end
    end
    
endmodule

