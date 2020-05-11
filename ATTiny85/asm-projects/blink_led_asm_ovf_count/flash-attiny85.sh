
#!/bin/sh

#/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude -C/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf -v -pattiny85 -carduino -P/dev/cu.wchusbserial410 -b19200 -Uflash:w:blink_led.hex:i 
AVRDUDE=/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude
AVRCONF=/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf
OPTS="-v -pattiny85 -carduino"
PORT=/dev/cu.wchusbserial410
$AVRDUDE -C$AVRCONF -v -pattiny85 -carduino -P$PORT -b19200 -Uflash:w:blink_led.hex:i


