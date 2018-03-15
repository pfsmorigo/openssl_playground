CC=gcc
CFLAGS=-ggdb3 -O0 -I /usr/local/include/openssl
LIBS=-L /usr/local/lib -lssl -lcrypto
OUTPUT=chacha20_poly1305 evp_sym_enc_dec

all: $(OUTPUT)
	@echo "done"

evp_sym_enc_dec: evp_sym_enc_dec.o
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

chacha20_poly1305: chacha20_poly1305.o
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f $(OUTPUT) *.o

gdb:
	export LD_LIBRARY_PATH=/usr/local/lib
	export LD_LIBRARY_PATH=/usr/local/ssl/lib:$LD_LIBRARY_PATH
	gdb chacha20_poly1305

.PHONY: all clean
