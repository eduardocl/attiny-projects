; Blinky test program for AVR ATTiny25/45/85
; Assembled with avra in Linux and tested on the ATTiny85
; 
; Licensed similarly to the original blink program for the BB313
; Public Domain
;
; To experiment and build on this (drop tn45def.inc in the same folder):
; avra blinky45.asm
; avrdude -p attiny85 -c avrispmkii -P usb -U flash:w:blinky45.hex

.nolist

.include "tn85def.inc"      ; ATTiny45 definition file grabbed from: 
                            ; http://fab.cba.mit.edu/classes/MIT/863.09/
                            ; people/mellis/microcontrollers/tn45def.inc

.list

.equ tccr1_reg = 0b00011101
.cseg

.org 0x0000

rjmp init

init:
    ldi r17,(1<<DDB0)       ; Set DDR for B1 to output
    out DDRB,r17            
    nop
 
    ldi r16, tccr1_reg
    out TCCR1, r16
