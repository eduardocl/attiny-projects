#include <DigisparkLiquidCrystal_I2C.h>


#include <TinyWireM.h>                  // I2C Master lib for ATTinys which use USI - comment this out to use with standard arduinos
          // for LCD w/ GPIO MODIFIED for the ATtiny85

#define GPIO_ADDR     0x27             // (PCA8574A A0-A2 @5V) typ. A0-A3 Gnd 0x20 / 0x38 for A - 0x27 is the address of the Digispark LCD modules.

LiquidCrystal_I2C lcd(GPIO_ADDR,16,2);  // set address & 16 chars / 2 lines


float temp;
int tempPin = A3; // analog input pin
float tempc;  //variable to store temperature in degree Celsius
float vout;  //temporary variable to hold sensor reading


void setup(){
  pinMode(tempPin,INPUT); // Configuring pin A1 as input
  TinyWireM.begin();                    // initialize I2C lib - comment this out to use with standard arduinos
  lcd.init();                           // initialize the lcd 
  lcd.backlight();                      // Print a message to the LCD.
  lcd.print("Electrosoft!");
  delay(500);
}

void loop(){

  vout=analogRead(tempPin);
  vout=(vout*500)/1023;
  tempc=vout; // Storing value in Degree Celsius
 
  lcd.setCursor(0,0);
  lcd.print("in DegreeC= ");
  lcd.setCursor(0,1);
  lcd.print(tempc);

  delay(1000); //Delay of 1 second for ease of viewing in serial monitor
  
}
