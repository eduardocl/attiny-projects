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
; PB0 -> Resistor -> LED -> GND
; Clock: prescale of CK/16384


.nolist
.include "tn85def.inc"
.list

.cseg
.org 0x0000
rjmp main

.org OC1Aaddr  
rjmp compare_match

main:
      ldi R16, (1 << PB0)
      out DDRB, R16
      
      clr R16
      ldi R16, (1 << CTC1) | (1 << CS13) | (1 << CS12) | (1 << CS11) | (1 << CS10) ;CK/16384
      out TCCR1, R16
      
      clr R16
      ldi R16, 47  ;100ms
      out OCR1A, R16
      
      clr R16
      ldi R16, (1 << OCIE1A) ;/Timer/Counter1 Output Compare Match A Interrupt Enable
      out TIMSK, R16
      
      clr R16
      out TCNT1, R16
      sei               ;Habilita interrupções globais

loop:
      rjmp loop


compare_match:
   rcall toggle_led
   reti

toggle_led:
   SBIS PB0, 1       ;testa se PB0 == 1 - tem que ler o pino nao a porta!
   SBI  PORTB, PB0   ;nao? coloca 1 então
   SBIC PB0, 0       ;testa se PB0 == 0
   CBI  PORTB, PB0   ;nao? coloca 0 entao
   RET
