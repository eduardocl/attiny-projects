#!/bin/sh
DIGISPARK_LAUNCHER="sudo /root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher"
$DIGISPARK_LAUNCHER -cdigispark --timeout 60 -Uflash:w:ctc.hex:i 