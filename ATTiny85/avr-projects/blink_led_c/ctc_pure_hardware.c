#include <avr/io.h>
#include <avr/interrupt.h>

//Clock 8 MHz
#define F_CPU = 8000000UL
void setup() {
    DDRB |= (1 << PB1);
    TCCR1 |= (1 << CTC1) | (1 << COM1A0) | (1 << CS13) | (1 << CS12) | (1 << CS11) | (1 << CS10); //Prescale = 16384
    OCR1A = 20;            //1 seg leva 122 overflows - 61 a metade
    //TIMSK |= (1 << OCIE1A); //Timer/Counter0 Output Compare Match A Interrupt Enable
    TCNT1 = 0;              //Qdo TCNT == OCR0A a interrupção TIMER0_COMPA_vect é executada
}

int main(void) {

    setup();

    while(1) {
        //nao precisa fazer nada
    }			

}
