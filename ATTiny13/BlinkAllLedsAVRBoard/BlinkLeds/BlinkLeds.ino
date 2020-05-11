/*
  Blink

  Turns an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the UNO, MEGA and ZERO
  it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
  the correct LED pin independent of which board is used.
  If you want to know what pin the on-board LED is connected to on your Arduino
  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products

  modified 8 May 2014
  by Scott Fitzgerald
  modified 2 Sep 2016
  by Arturo Guadalupi
  modified 8 Sep 2016
  by Colby Newman

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Blink
*/

#define LED_AZUL 0
#define LED_BUILTIN 1
#define LED_AMARELO 2
#define LED_VERMELHO 3 


// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(LED_AZUL, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(LED_AMARELO, OUTPUT);
  pinMode(LED_VERMELHO, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {

  uint8_t t = 150;
  
  digitalWrite(LED_AZUL, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(t);
  
  digitalWrite(LED_BUILTIN, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(t);
  
  digitalWrite(LED_VERMELHO, HIGH);
  delay(t);
  
  digitalWrite(LED_AMARELO, HIGH);
  delay(t);
  delay(t);
  //--------------------------------------------
  
  digitalWrite(LED_AZUL, LOW);   // turn the LED on (HIGH is the voltage level)
  delay(t);
  
  digitalWrite(LED_BUILTIN, LOW);   // turn the LED on (HIGH is the voltage level)
  delay(t);
  
  digitalWrite(LED_VERMELHO, LOW);
  delay(t);
  
  digitalWrite(LED_AMARELO, LOW);
  delay(t);
  delay(t);
}
