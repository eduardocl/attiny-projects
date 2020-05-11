/*
 Exercício:
     Fazer um timer de 50ms para ligar/desligar um LED
     usando o TIMER0, com prescaler (divisor) de 64. (8MHz/64)

 Tente mudar o if para outros valores, inclusive maior que 255 e
 veja o que acontece.
*/


#include <avr/io.h>
#include <avr/interrupt.h>

volatile uint8_t num_overflows;

ISR(TIMER0_OVF_vect) {
    num_overflows++;
}

void setup() {
   DDRB |= (1 << PB0);                 //Pino zero como saída
   TCCR0B = (1 << CS01) | (1 << CS00); //Divisor do clock: 64
   TIMSK =  (1 << TOIE0);              //habilita interrupção de overflow do TIMER0
   TCNT0 = 0;                          //Inicia o contador de zero
   sei();                              //habilita interrupções globais;
   num_overflows = 0;
}


int main(void) {

 setup();
  //20ms  -   9 ovfs
  //25ms  -  12 ovfs
  //50ms  -  24 ovfs 
  //100ms -  48 ovfs
  //300ms - 146 ovfs
  //500ms - 244 ovfs

  while(1) {
    if (num_overflows >= 18) { // 100ms
 	    PORTB ^= (1 << PB0); //toggle LED
	    num_overflows = 0;
	    TCNT0 = 0;
    }
  } 
}
