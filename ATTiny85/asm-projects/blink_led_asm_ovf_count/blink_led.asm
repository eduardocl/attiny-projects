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
;


.nolist
.include "tn85def.inc"
.list

.def overflows = R17

.cseg
.org 0x0000
rjmp main

.org OVF0addr  
rjmp overflow_handler

main:

  ;ldi r16, low(RAMEND)
  ;out SPL, r16

  ldi  R16,   (1 << PB2) | (1 << PB0)  ;Pino zero e dois como 'output'
  out  DDRB,  R16

  clr  R16
  ldi  R16,  (1 << CS02)       ;256 prescaler
  out  TCCR0B, R16             ;Inicia o registrado contolador do Timer0

  clr  R16
  ldi  R16, (1 << TOIE0) 
  out  TIMSK, R16         ; habilita interrupcao overflow do timer 0

  ldi  R16, 0
  out  TCNT0, R16         ;inicia o contador com zero

  clr   overflows         ;inicia overflows com zero
  sei  		              ;habilita interrupcoes globais


flash_led:
   sbi PORTB, PB0        
   rcall delay_100ms        
   ;rcall delay_2_seg   
   cbi PORTB, PB0        
   rcall delay_100ms
   ;rcall delay_2_seg           
   rjmp flash_led            

;flash_led:
;   rcall toggle_led
;   rcall delay_100ms
;   rjmp flash_led

delay_100ms:
   clr overflows         ; set overflows to 0 
   sec_count:
     cpi overflows, 12   ; 
   brne sec_count        ; 
   ret                   ; 

delay_2_seg:
   clr overflows         ; set overflows to 0 
   sec_count_2s:
     cpi overflows, 244  ; 
   brne sec_count_2s     ; 
   ret                   ; 

overflow_handler:
   inc overflows         ; 
   cpi overflows, 255    ; reset o contador qdo atingir 255 - permite delay de mais de 1seg
   brne PC+2             ; se não for igual a 255 pula para reti
   clr overflows         ; 
   reti                  ; 

;toggle_led:
;   sbis PORTB, PB0
;   sbi  PORTB, PB0
;   sbic PORTB, PB0
;   cbi  PORTB, PB0
;   ret
