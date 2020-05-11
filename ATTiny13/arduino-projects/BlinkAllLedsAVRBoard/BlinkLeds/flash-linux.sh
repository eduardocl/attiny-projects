AVR_DUDE=/home/eduardo/Programas/arduino-1.8.9/hardware/tools/avr/bin
CONF_OPT=-C/home/eduardo/Programas/arduino-1.8.9/hardware/tools/avr/etc/avrdude.conf
PORT=/dev/ttyUSB0
HEX=/tmp/arduino_build_609468/BlinkLeds.ino.hex

#run the magic
$AVR_DUDE/avrdude $CONF_OPT  -v -pattiny13 -carduino -P$PORT -b19200 -Uflash:w:$HEX:i