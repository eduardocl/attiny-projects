#!/bin/sh

~/Programas/avra-1.3.0-linux-i386-static/avra blink45.asm
sudo /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher -cdigispark --timeout 60 -Uflash:w:blink45.hex:i

#macos
#/Users/eduardo/Library/Arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher -cdigispark --timeout 60 -Uflash:w:led_on.hex:i
