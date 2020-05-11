MCU=attiny85
F_CPU=8000000
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-std=c99 -Wall -g -Os -mmcu=${MCU} -DF_CPU=${F_CPU} -I.
TARGET=main
SRCS=main.c

#digispark board
DIGISPARK_LAUNCHER=/root/.arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher
DIGISPARK_LAUNCHER_MAC=/Users/eduardo/Library/Arduino15/packages/digistump/tools/micronucleus/2.0a4/launcher

all: 
	${CC} ${CFLAGS} -o ${TARGET}.bin ${SRCS}
	${OBJCOPY} -j .text -j .data -O ihex ${TARGET}.bin ${TARGET}.hex

flash:
	sudo ${DIGISPARK_LAUNCHER}  -cdigispark --timeout 60 -Uflash:w:${TARGET}.hex:i 

flashmac: all
	${DIGISPARK_LAUNCHER_MAC}  -cdigispark --timeout 60 -Uflash:w:${TARGET}.hex:i 

clean:
	rm -f *.bin *.hex
