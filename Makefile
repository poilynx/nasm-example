all: hello gcd stringlength readarray

hello: hello.o
	gcc -m32 -o $@ $^
hello.o: hello.asm
	nasm -felf -o $@ $^

gcd: gcd.o
	gcc -m32 -o $@ $^
gcd.o: gcd.asm
	nasm -felf -o $@ $^

stringlength: stringlength.o
	gcc -m32 -o $@ $^
stringlength.o: stringlength.asm
	nasm -felf -o $@ $^

readarray: readarray.o
	gcc -m32 -o $@ $^
readarray.o: readarray.asm
	nasm -felf -o $@ $^

clean:
	$(RM) *.o
	$(RM) hello gcd stringlength readarray
