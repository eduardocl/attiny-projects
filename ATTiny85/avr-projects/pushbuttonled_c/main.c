#include <avr/io.h>
#include <util/delay.h> 

int main(void) {

    //PB5 - LED
    //PB4 - pushbutton

    //Pino A5 do nano
    DDRB = 0b00000001;
    PORTB |= 0b11111110;
    PORTB |= (0 << PB0);

    //_delay_ms(10000);

    while(1) {
      if (bit_is_clear(PINB, PB2)) {
	    PORTB = (0 << PB0);
      } else {	
        PORTB = (1 << PB0);
       }
        
    }

}

