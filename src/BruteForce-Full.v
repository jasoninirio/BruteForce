`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2020 04:37:02 PM
// Design Name: 
// Module Name: BruteForce-Full
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


module BruteForceFull(
    input clk, reset,
    input clk_kb, data_kb,
    output reg [3:0] keyboard_input,
    output reg [9:0] led
    );
    
//    parameter CRITICAL_H_DMG = 10,
//            CRITICAL_L_DMG = 5,
//            NORM_H_DMG = 5,
//            NORM_L_DMG = 2,
//            MISS_DMG = 0,
//            NO_DMG = 0;
    
//    // Attack Types:
//    parameter STANDBY = 4'b0011,
//            LIGHT = 4'b0001,
//            HEAVY = 4'b0010;
            
//    // Attack States:
//    parameter NO_HIT = 2'b00,
//            CRITICAL = 2'b01,
//            NORMAL = 2'b10,
//            MISS = 2'b11;
    
    // VARIABLES
    parameter DAMAGE = 5;
    reg [9:0] pHealth;
    reg [2:0] playerDamage;
    
    reg [9:0] cHealth;
    reg cpuDamage;
//    reg [3:0] keyboard_input;
    
    // KEYBOARD MODULE
    reg [7:0] data_curr;
    reg [3:0] data_out, b;
    reg flag;
    
    initial begin
        b<=4'h1; 
        flag<=1'b0; 
        data_curr<=8'h45; 
        keyboard_input<=4'b0000;
        data_out<=4'b0000;
        cHealth <= 10'b1111111111;
        pHealth <= 10'b1111111111;
        led <= 10'b1111111111;
    end
    
    always @(negedge clk_kb) begin  //Active for negative edge of clk from keyboard 
    
        case(b) 
            1:; //first bit 
            2:data_curr[0]<=data_kb; 
            3:data_curr[1]<=data_kb; 
            4:data_curr[2]<=data_kb; 
            5:data_curr[3]<=data_kb; 
            6:data_curr[4]<=data_kb; 
            7:data_curr[5]<=data_kb; 
            8:data_curr[6]<=data_kb; 
            9:data_curr[7]<=data_kb;
            10:flag<=1'b1; //Parity bit 
            11:flag<=1'b0; //Ending bit 
        
        endcase 
        
         if(b<=10) 
         b<=b+1'b1; 
         
         else if(b==11) 
         b<=1; 
     
    end 
     
    always @(negedge clk_kb) begin //Active for negative edge of clk from keyboard  
        //value 1 from hex on keyboard to binary to be displayed
        case (data_curr)
        8'h1C: data_out = 4'b0001; //letter a for user 1 light punch 
        8'h23: data_out = 4'b0010; //letter d for user 1 heavy punch
        8'h29: data_out = 4'b0011; // space bar
    //    8'h05: data_out = 4'b0011; //F1 key for user 2 left punch
    //    8'h04: data_out = 4'b0100; //F3 key for user 2 right punch
        endcase
    end
            
    always@(posedge flag) begin // Printing data obtained to led set 1 (0,1,2,3)
     if(data_out==4'b0001)
         keyboard_input[3:0]<=data_out; 
     else if(data_out==4'b0010)
         keyboard_input[3:0]<=data_out; 
     else if(data_out==4'b0011)
         keyboard_input[3:0]<=data_out;
    end
    
    always @ (posedge flag) begin
        if (reset) begin
            cHealth <= 10'b1111111111;
            pHealth <= 10'b1111111111;
            led <= 10'b1111111111;
        end
        case(keyboard_input)
            4'b0011:
                cHealth <= cHealth;
            4'b0010:
                cHealth <= cHealth << 1;
            4'b0001:
                cHealth <= cHealth << 1;
            default:
                cHealth <= cHealth;
        endcase
    
    // health system for cpu
        case(cHealth)
            10'b1111111111:
                led[9:0] <= 10'b111111111;
            10'b1111111110:
                led[9:0] <= 10'b111111110;
            10'b1111111100:
                led[9:0] <= 10'b111111100;
            10'b1111111000:
                led[9:0] <= 10'b111111000;
            10'b1111110000:
                led[9:0] <= 10'b111110000;
            10'b1111100000:
                led[9:0] <= 10'b111100000;
            10'b1111000000:
                led[9:0] <= 10'b1111000000;
            10'b1110000000:
                led[9:0] <= 10'b111000000;
            10'b1100000000:
                led[9:0] <= 10'b110000000;
            10'b1000000000:
                led[9:0] <= 10'b100000000;
            10'b0000000000:
                led[9:0] <= 10'b000000000;
        endcase
    end
endmodule
