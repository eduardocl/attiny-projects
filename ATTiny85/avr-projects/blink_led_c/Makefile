MCU=attiny85
F_CPU=8000000
CC=avr-gcc
OBJCOPY=avr-objcopy
CFLAGS=-std=c99 -Wall -g -Os -mmcu=${MCU} -DF_CPU=${F_CPU} -I.
TARGET=main
SRCS=main.c

all: ctc ctc_pure_hardware
	${CC} ${CFLAGS} -o ${TARGET}.bin ${SRCS}
	${OBJCOPY} -j .text -j .data -O ihex ${TARGET}.bin ${TARGET}.hex

ctc:
	${CC} ${CFLAGS} -o ctc.bin ctc.c
	${OBJCOPY} -j .text -j .data -O ihex ctc.bin ctc.hex

ctc:
	${CC} ${CFLAGS} -o ctc_pure_hardware.bin ctc_pure_hardware.c
	${OBJCOPY} -j .text -j .data -O ihex ctc_pure_hardware.bin ctc_pure_hardware.hex

flash:
	avrdude -p ${MCU} -c usbasp -U flash:w:${TARGET}.hex:i -F -P usb

clean:
	rm -f *.bin *.hex
