CC=gcc
CFLAGS=-I /usr/local/include/openssl
LIBS=-lssl -lcrypto
EVP_SYM_ENC_DEC_OBJ = evp_sym_enc_dec.o

evp_sym_enc_dec: $(EVP_SYM_ENC_DEC_OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -f *.o

.PHONY: clean
