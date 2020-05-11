#include <avr/io.h>
#include <util/delay.h> 

int main(void) {

    //PB5 - LED
    //PB4 - pushbutton

    //Pino A5 do nano
    DDRB = 0xff;
    DDRB |= (0 << PB4);
    PORTB |= (1 << PB4);
    while(1) {
      if (bit_is_set(PINB, PB4)) {
    	PORTB = (0 << PB5);
      } else {	
        PORTB = (1 << PB5);
       }
        
    }

}

