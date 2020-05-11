.nolist
.include "tn85def.inc"
.list



.cseg
.org 000000

rjmp Main ; Reset vector
reti ; INT0
reti ; PCI0
reti ; OC1A
reti ; OVF1
reti ; OVF0
reti ; ERDY
reti ; ACI
reti ; ADCC
reti ; OC1B
reti ; OC0A
reti ; OC0B
reti ; WDT
reti ; USI_START
reti ; USI_OVF


main:
    ldi     R16,   (1 << PB2) | (1 << PB0)
    out     DDRB,  R16
    out     PORTB, R16

loop:
    rjmp    loop
