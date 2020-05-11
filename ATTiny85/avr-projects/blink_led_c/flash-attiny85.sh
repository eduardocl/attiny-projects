#!/bin/sh
AVRDUDE=/Applications/Arduino.app/Contents/Java/hardware/tools/avr/bin/avrdude
AVRCONF=/Applications/Arduino.app/Contents/Java/hardware/tools/avr/etc/avrdude.conf
OPTS="-v -pattiny85 -carduino"
PORT=/dev/cu.wchusbserial410

$AVRDUDE -C$AVRCONF $OPTS -P$PORT -b19200 -Uflash:w:main.hex:i 


