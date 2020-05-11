;         ________
;   PB5  |_  \/  _| vcc
;   PB3  |_      _| PB2/SCL/SCK
;   PB4  |_      _| PB1
;   GND  |_      _| PB0/SDA
;        | ______ |

; CPU Frequency: 8 MHz
; Placa Digispark
; sudo /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher -cdigispark --timeout 60 -Uflash:w:blink_led.hex:i
;
;
; PB1 -> Resistor -> LED -> GND
; Clock: prescale of CK/16384


.nolist
.include "tn85def.inc"
.list

.cseg
.org 0x0000
rjmp main

.org OC1Aaddr  
reti

main:
      ldi R16, (1 << PB1) 
      out DDRB, R16
      
      clr R16
      ldi R16, (1 << CTC1) | (1 << COM1A0) | (1 << CS13) | (1 << CS12) | (1 << CS11) | (1 << CS10) ;CK/16384
      out TCCR1, R16
      
      clr R16
      ldi R16, 200
      out OCR1A, R16

      clr R16
      out TCNT1, R16  


loop:
      rjmp loop