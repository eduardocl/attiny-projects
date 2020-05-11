#!/bin/sh

AVRA=avra
#DIGISPARK_LAUNCHER=/Users/eduardo/Library/Arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher
DIGISPARK_LAUNCHER="sudo /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher"

$AVRA blink_led.asm
$DIGISPARK_LAUNCHER -cdigispark --timeout 60 -Uflash:w:blink_led.hex:i 
