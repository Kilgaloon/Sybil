CFLAGS=-Wall -g

compile:
	gcc ${CFLAGS} main.c config.c lib/parser.c lib/storage.c lib/log.c -o sybil
	
dir:
	mkdir /etc/sybil/
	echo "allowed_memory_size = 2M;" >> "/etc/sybil/sybil.ini" 
	echo "allowed_memory_key_size = 50KB;" >> "/etc/sybil/sybil.ini" 
	echo "allowed_memory_value_size = 255KB;" >> "/etc/sybil/sybil.ini" 
	echo "allowed_cache_size = 20M;" >> "/etc/sybil/sybil.ini" 
	
	mkdir /var/log/sybil/error.log

clean:
	rm -f sybil

memory-check:
	valgrind --leak-check=yes --track-origins=yes ./sybil