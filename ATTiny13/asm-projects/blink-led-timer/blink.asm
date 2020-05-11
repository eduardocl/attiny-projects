;
; ***************************************
; * Timer to blink a LED
;*
; * (C)2017 by www.avr-asm-tutorial.net *
; ***************************************
;
.NOLIST
.INCLUDE "tn13def.inc"
.LIST
;
; ---------- Registers ----------------
.def rmp = R16 ; Multi purpose register
;
; ---------- Timing -------------------
; Internal RC-Oscillator = 9,600,000 Hz
; Clock prescaler CLKPR =8
; Internal contr. clock = 1,200,000 Hz
; TC0 precaler = 1,024
; TC0 tick = 1,171.875 cs/s
; TC0 cycle = 256
; TC0 single cycle = 4.578 cs/s
; TC0 toggle frequency = 2.289 cs/s
;
; ---------- Start --------------------
; PB0 as output
sbi DDRB,DDB0 ; PB0 as output
; Select Compare Match
ldi rmp,0xFF ; Match at 255
out OCR0A,rmp ; to Compare Match A
; toggle PB0 at Compare Match
ldi rmp,1<<COM0A0 ; Toggle Mode
out TCCR0A,rmp ; to control port A
; Start timer
ldi rmp,(1<<CS02)|(1<<CS00) ; prescaler 1024
out TCCR0B,rmp ; to control port B
Loop:
	rjmp Loop
