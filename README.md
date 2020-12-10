# Brute Force - EC311 Final Project
### Created by Long Chicken
[Jason Inirio](https://github.com/jasoninirio), [Arnav Gupta](https://github.com/arnavgupta1), [Talbot Taylor](https://github.com/talbotct), Branden Applewhite

## Implementation
Using the [Xilinx Nexys A7 FGPA Board](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/start)

## Demo Video

A demo of our final project can be viewed [here](ATTACH YOUTUBE LINK HERE)

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

**final_alu**: Calls all of the separate modules and transfers all of the inputs and outputs to wherever they are needed.

**vga_display**: Assigns each pixel on the VGA display based on the action that is currently happening 

**vga_controller**: Syncs up to the VGA so that vga_display can function correctly

**backend_MUX**: Controls and invokes the LFSR

**LFSR**:

**bruteforce_full**:
