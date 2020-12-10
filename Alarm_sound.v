`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/24/2020 04:52:08 PM
// Design Name: 
// Module Name: Alarm_Sound
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


module Alarm_Sound(input clk, output reg speaker);

    parameter clk_div = 1000000000/440/2;
    reg [14:0] count;
    
    reg [30:0] tone;
    always @(posedge clk) tone <= tone+1;
    
    wire [7:0] fullnote;
    sound_ROM sr(.clk(clk), .address(tone[29:22]), .note(fullnote));
    
    wire [2:0] octave;
    wire [3:0] note;
    div_by_12 get_octave_and_note(.numer(fullnote[5:0]), .quotient(octave), .remain(note));
    
    reg [8:0] clkdivider;
    always @*
    case(note)
        0: clkdivider = 9'd511;//A
        1: clkdivider = 9'd482;// A#/Bb
        2: clkdivider = 9'd455;//B
        3: clkdivider = 9'd430;//C
        4: clkdivider = 9'd405;// C#/Db
        5: clkdivider = 9'd383;//D
        6: clkdivider = 9'd361;// D#/Eb
        7: clkdivider = 9'd341;//E
        8: clkdivider = 9'd322;//F
        9: clkdivider = 9'd303;// F#/Gb
        10: clkdivider = 9'd286;//G
        11: clkdivider = 9'd270;// G#/Ab
        default: clkdivider = 9'd0;
    endcase    
    
    reg [8:0] counter_note;
    reg [7:0] counter_octave;
    always @(posedge clk) counter_note <= counter_note==0 ? clkdivider : counter_note-9'd1;
    always @(posedge clk) if(counter_note==0) counter_octave <= counter_octave==0 ? 8'd255 >> octave : counter_octave-8'd1;
    always @(posedge clk) if(counter_note == 0 && counter_octave == 0 && fullnote != 0 && tone[30] == 0) speaker <= ~speaker;
     
endmodule
