;         ________
;   PB5  |_  \/  _| vcc
;   PB3  |_      _| PB2/SCL/SCK
;   PB4  |_      _| PB1
;   GND  |_      _| PB0/SDA
;        | ______ |
 
.nolist
.include "tn85def.inc"
.list

vectors:
    rjmp main  ;; reset vector
    rjmp main     ;; unused interrupt vectors
    rjmp main     ;;   perhaps needed by tiny85 bootloaders
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main
    rjmp main

;.org 0x0000
;rjmp main

main:
    ldi     R16,   (1 << PB2) | (1 << PB0)  ; 0x0F
    out     DDRB,  R16
    out     PORTB, R16

loop:
    rjmp    loop
