#!/bin/sh

~/Programas/avra-1.3.0-linux-i386-static/avra led_on.asm
sudo /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher -cdigispark --timeout 60 -Uflash:w:led_on.hex:i

#macos
#/Users/eduardo/Library/Arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher -cdigispark --timeout 60 -Uflash:w:led_on.hex:i
