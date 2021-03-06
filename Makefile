# for debug add -g -O0 to line below
CFLAGS+=-g -pthread -O2 -Wall -Wextra -Wpedantic -Wstrict-overflow -fno-strict-aliasing -std=gnu11 -g -O0
prefix=/usr/local/bin
SYSTEMD_PATH=/lib/systemd/system/

all:
	${CC} main.c fiche.c -lz $(CFLAGS) -o fiche
	${CC} cleaner.c $(CFLAGS) -o cleaner

install: fiche
	install -m 0755 fiche $(prefix)
	cp extras/systemd/* $(SYSTEMD_PATH)

clean:
	rm -f fiche

.PHONY: clean
