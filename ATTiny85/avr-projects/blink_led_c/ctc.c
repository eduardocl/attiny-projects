#include <avr/io.h>
#include <avr/interrupt.h>

//Clock 8 MHz
#define F_CPU = 8000000UL

uint16_t counter = 0;

/**
   Função que trata da interrupção de comparação
   quando TCNT1 >= OCR1A, troca-se o valor de PORTB
*/
ISR (TIM1_COMPA_vect) {
    PORTB ^= (1 << PB0); //toggle LED
}

/**
 * Toggle LED cada 500ms
 * PB0 --> Resistor --> LED --> GND
 * 
 * Usando Timer1 por que podemos usar prescaler de até CK/16384
 * 
 * OCR1C = 243 ; 500ms
 * OCR1C =  47 ; 100ms
 * 
 */
void setup() {
    DDRB |= (1 << PB0);     //Pino PB0 como 'output'
    TCCR1 |= (1 << CTC1) | (1 << CS13) | (1 << CS12) | (1 << CS11) | (1 << CS10); //Prescale = 16384
    OCR1C = 47;            //1 seg leva 122 overflows - 61 a metade
    TIMSK |= (1 << OCIE1A); //Timer/Counter0 Output Compare Match A Interrupt Enable
    TCNT1 = 0;              //Qdo TCNT == OCR0A a interrupção TIMER0_COMPA_vect é executada
    sei();                  //habilita interrupções globais
}

int main(void) {

    setup();

    while(1) {
        //nao precisa fazer nada
    }			

}
