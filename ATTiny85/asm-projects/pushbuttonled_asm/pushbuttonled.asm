;********************************
; written by: Eduardo Lopes
; date: 2019/09/10
; version: 1.0
; file saved as: pushbuttonled.asm
; for AVR: ATTiny85
; clock frequency: 8MHz
; Digispark bord
;********************************
;
;
;         ________
;   PB5  |_  \/  _| vcc
;   PB3  |_      _| PB2/SCL/SCK
;   PB4  |_      _| PB1
;   GND  |_      _| PB0/SDA
;        | ______ |
;
; Compilation:
;            avra pushbuttonled.asm
; Flashing:
;            sudo /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher -cdigispark \ 
;                 --timeout 60 -Uflash:w:pushbuttonled.hex:i
;
;
; PB0 -> Resistor -> LED -> GND
; PB1 -> pushbutton -> GND
;
;   This simple program change the LED, turning it on or off after pushing the 
;   the button.    
;
;   Liga ou desliga o LED ao apertar um botão
;

.nolist
.include "tn85def.inc"
.list

.cseg
.org 0x0000  
rjmp main

.org	INT0addr    
        reti	; External Interrupt 0
.org	PCI0addr    
        reti	; Pin change Interrupt Request 0
.org	OC1Aaddr	
        reti	; Timer/Counter1 Compare Match 1A
.org	OVF1addr	
        reti	; Timer/Counter1 Overflow
.org	OVF0addr	
        reti	; Timer/Counter0 Overflow
.org	ERDYaddr	
        reti	; EEPROM Ready
.org	ACIaddr	    
        reti	; Analog comparator
.org	ADCCaddr	
        reti 	; ADC Conversion ready
.org	OC1Baddr	
        reti	; Timer/Counter1 Compare Match B
.org	OC0Aaddr	
        reti	; Timer/Counter0 Compare Match A
.org	OC0Baddr	
        reti	; Timer/Counter0 Compare Match B
.org	WDTaddr	    
        reti	; Watchdog Time-out
.org	USI_STARTaddr	
        reti	; USI START
.org	USI_OVFaddr	 
        reti	; USI Overflow


main:
    ;Pin zero as output
    ldi R16, (0 << PB2) | (1 << PB0)     ;Pino 0 como 'output' para ligar o LED
    out DDRB,  R16

    clr R16
    ldi R16, (1 << PB2)
    out PORTB, R16

    ;Wait for push button
    rcall wait_push_button  ;espera o botão ser acionado
    ;Toggle LED value
    rcall toggle_led        ;liga ou desliga o LED
    
    rjmp main               ;loop

wait_push_button:
    sbic PB2, 1             ;pula uma linha indo para 'ret' se botão for acionado
    rjmp wait_push_button   
    ret

toggle_led:
   SBIS PB0, 1       ;testa se PB0 == 1 - tem que ler o pino nao a porta!
   SBI  PORTB, PB0   ;nao? coloca 1 então
   SBIC PB0, 0       ;testa se PB0 == 0
   CBI  PORTB, PB0   ;nao? coloca 0 entao
   RET
