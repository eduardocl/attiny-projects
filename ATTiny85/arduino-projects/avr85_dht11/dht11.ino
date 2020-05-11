//Programa: Digispark com DHT11 e display LCD 16x2 I2C
//Autor: Arduino e Cia

//I2C Master lib para ATTiny
#include <TinyWireM.h>
#include <TinyDHT.h>

#define DHTTYPE DHT11
#define DHTPIN 1
DHT dht(DHTPIN, DHTTYPE);

void setup()
{
  //Inicializa a biblioteca I2C
  TinyWireM.begin();
  dht.begin();
}

void loop()
{
  //Leitura da umidade
  int8_t h = dht.readHumidity();
  //Leitura da temperatura: Use 0 para
  //Celsius, 1 para Fahrenheit
  int16_t t = dht.readTemperature(0);

  Serial.print(t);

  delay(5000);
}
