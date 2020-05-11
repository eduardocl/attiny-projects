~/Programas/arduino-1.8.9/hardware/tools/avr/bin/avrdude \
     -C/home/eduardo/Programas/arduino-1.8.9/hardware/tools/avr/etc/avrdude.conf \
      -v -pattiny13 -carduino -P/dev/ttyUSB0 -b19200 -Uflash:w:blink.hex:i