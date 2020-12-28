# Brute Force - EC311 Final Project
### Created by Long Chicken
[Jason Inirio](https://github.com/jasoninirio), [Arnav Gupta](https://github.com/arnavgupta1), [Talbot Taylor](https://github.com/talbotct), Branden Applewhite

## Implementation
Using the [Xilinx Nexys A7 FGPA Board](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/start)

## Demo Video

A demo of our final project can be viewed [here](https://youtu.be/53K4K4CjAhM)

## Overview

Hyper cyborgs, BR-UT3 and F0RCE, are put into a match of classic dystopian boxing.

With ultra 640 x 480 VGA graphics, an amazing custom background music, and fast responding player keyboard inputs, fight against our AI and retake your victory as the boxing robot champion!

## How to Run
#### Perquisites Needed:
- Audio speakers
- Keyboard with a USB/PS2 Port
- Nexys A7 FPGA Board
- VGA Cable

#### How to Play:
- **A** : Light Attack
- **D** : Heavy Attack

Push _final_alu.v_ to the board.\
Generate the bitstream and connect to the FPGA board.\
Play

## Code Overview

### Main Modules
**final_alu.v**: Calls all of the separate modules and transfers all of the inputs and outputs to wherever they are needed.

**vga_display.v**: Assigns each pixel on the VGA display based on the action that is currently happening 

**vga_controller.v**: Syncs up to the VGA so that vga_display can function correctly

**backend_MUX.v**: Controls the gameplay mechanics, invokes the LFSR, and controls the health registers

**LFSR.v**: A 8-bit linear feedback shift register that generates psuedo numbers for probability

**bruteforce_full.v**: Gathers user input that controls the player via keyboard

**Alarm_sound.v**: Audio module that outputs the background music

### Misc. Modules
**div_by_12.v**: Creates different octaves of a frequency

**sound_ROM.v**: ROM that holds a collection of notes that is decided by an 8-bit address

**testee.v**: Changes the clock in the Backend MUX for the CPU attack counter

### Testbenches
**backend_mux_tb.v**: Testbench for testing the Backend MUX, checking if health and damage system works

**LFSR_tb.v**: Testbench for testing the LFSR
