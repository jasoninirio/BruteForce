`timescale 1ns / 1ps
/*
BACKEND MUX - CONTROLS GAMEPLAY MECHANICS AND LOGIC:
    - Health System
    - Punch System
    - Probability Machine
    - Key Mapping
    - AI
    - In-Game Clock
*/

module BackendMUX(
    input wire clk, reset,
    input [3:0] keyboard_input,
    output reg [7:0] p1_health_out, cpu_health_out,
    output reg cpu_isAttacking
   );
   
   // Starting Health = 100
   reg [7:0] p1_health = 0;
   reg [7:0] cpu_health = 0;
   
   initial begin
        cpu_health_out = 100;
        p1_health_out = 100;
   end
////    p1_health = 8'b1100100;
////    cpu_health = 8'b1100100;
////    p1_health_out = 8'b1100100;
////    cpu_health_out = 8'b1100100;
////    p1_health_out = 8'b1100100;
////    cpu_health_out = 100
//   end
    
    // Attack Types:
    parameter STANDBY = 4'b0000,
            LIGHT = 4'b0001,
            HEAVY = 4'b0010;
            
    // Attack States:
    parameter NO_HIT = 2'b00,
            CRITICAL = 2'b01,
            NORMAL = 2'b10,
            MISS = 2'b11;
            
    wire [1:0] player_attackState; // attack state (STANDBY, CRIT., NORM., or MISS)
    reg [3:0] player_attackType; // type of attack
    reg player_damageCounter; // controls damage from player
    reg cpu_damageCounter; // controls damage from CPU
    wire [1:0] cpu_attackState;
    
    reg sec_clk;
    reg sec;
    reg [3:0] i;
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
                i <= 7;
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
         
    /*
    key mapping goes here for selecting attackType (LIGHT  OR HEAVY)
    
    ** p1_attack_type is a temp. value, replace with keyboard inputs
    */
    
    // PLAYER ATTACKING:
    LFSR player_LFSR(.clk (clk), .reset (reset), .type (keyboard_input), .isPlayer(1), .state (player_attackState)); // 8-bit LSFR
    LFSR CPU_LFSR(.clk (clk), .reset (reset), .type (1), .isPlayer(0), .state (cpu_attackState)); // 8-bit LFSR
    
//    change_clk cc(clk,reset,sec_clk);
    always @ (*) begin
        player_attackType = keyboard_input;
        case(player_attackType)
            STANDBY:
                cpu_health_out = cpu_health_out - 0;
            LIGHT:
                case(player_attackState)
                    CRITICAL:
                        cpu_health_out = cpu_health_out - 2;
                    NORMAL:
                        cpu_health_out = cpu_health_out - 1;
                    MISS:
                        cpu_health_out = cpu_health_out - 0;
                    NO_HIT:
                        cpu_health_out = cpu_health_out - 0;
                endcase
            HEAVY:
                case(player_attackState)
                    CRITICAL:
                        cpu_health_out = cpu_health_out - 4;
                    NORMAL:
                        cpu_health_out = cpu_health_out - 2;
                    MISS:
                        cpu_health_out = cpu_health_out - 0;
                    NO_HIT:
                        cpu_health_out = cpu_health_out - 0;
                endcase
//            default: // any other keyboard input
//                cpu_health_out = cpu_health_out + 0;
        endcase
//        cpu_health_out <= cpu_health;
        
//        p1_health_out <= p1_health;
    end
    
//    assign cpu_health_out = cpu_health + player_damageCounter;
    
    always @(posedge sec_clk)
    begin
    
            case(cpu_attackState)
            CRITICAL: begin
                p1_health_out = p1_health_out - 6;
                cpu_isAttacking = 1;
                end
            NORMAL: begin
                p1_health_out = p1_health_out - 5;
                cpu_isAttacking = 1;
                end
            MISS: begin
                p1_health_out = p1_health_out - 0;
                cpu_isAttacking = 0;
                end
            NO_HIT: begin
                p1_health_out = p1_health_out - 0;
                cpu_isAttacking = 0;
                end
            endcase
            
     end
//        assign p1_health_out = p1_health + cpu_damageCounter;
    
    // CPU ATTACKING:
//    wire fifth_clk, sixth_clk, seventh_clk;
//    CPU_attackclk CPU_clk(.clk(clk), .reset(reset), .fifth_clk(fifth_clk), .sixth_clk(sixth_clk), .seventh_clk(seventh_clk)); // CPU attack clk
//    LFSR CPU_LFSR(.clk (clk), .reset (reset), .type (0), .isPlayer(0), .state (cpu_attackState));
    
    // CPU Attack Dmg and States
//    always @ (*) begin
//        case(cpu_attackState)
//            CRITICAL: begin
//                cpu_damageCounter = CRITICAL_H_DMG;
//                cpu_isAttacking = 1;
//                end
//            NORMAL: begin
//                cpu_damageCounter = NORM_H_DMG;
//                cpu_isAttacking = 1;
//                end
//            MISS: begin
//                cpu_damageCounter = MISS_DMG;
//                cpu_isAttacking = 0;
//                end
//            NO_HIT: begin
//                cpu_damageCounter = NO_DMG;
//                cpu_isAttacking = 0;
//                end
//        endcase
//    end
    
    // HEALTH AND DAMAGE MANAGER:
//    always @ (posedge clk) begin
//        cpu_health <= cpu_health - player_damageCounter;
//        cpu_health_out <= cpu_health;
        
//        p1_health <= p1_health - cpu_damageCounter;
//        p1_health_out <= p1_health;
//   end
   
endmodule
