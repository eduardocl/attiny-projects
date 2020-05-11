//Autor: Arduino e Cia

//I2C Master lib para ATTiny
#include <TinyWireM.h>
#include <LiquidCrystal_I2C.h>
#include <TinyDHT.h>

//Define o tipo do sensor DHT
#define DHTTYPE DHT11

//Sensor conectado no pino 1 Digispark
#define DHTPIN 1

//Endereco I2C do display LCD 16x2
#define END_DISP     0x27

DHT dht(DHTPIN, DHTTYPE);

LiquidCrystal_I2C lcd(END_DISP, 16, 2);

void setup()
{
  //Inicializa a biblioteca I2C
  TinyWireM.begin();
  //Inicializa o LCD
  lcd.init();
  //Inicializa o DHT22
  dht.begin();
  lcd.backlight();
}

void loop()
{
  //Leitura da umidade
  int8_t h = dht.readHumidity();
  //Leitura da temperatura: Use 0 para
  //Celsius, 1 para Fahrenheit
  int16_t t = dht.readTemperature(0);

  //Verifica se o sensor esta respondendo
  if ( t == BAD_TEMP || h == BAD_HUM )
  {
    lcd.clear();
    lcd.print("Erro sensor!");
  }
  else
  {
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("Temp.:    C");
    lcd.setCursor(7, 0);
    lcd.print(t);
    lcd.setCursor(0, 1);
    lcd.print("Umid.:    %");
    lcd.setCursor(7, 1);
    lcd.print(h);
  }
  delay(5000);
}
