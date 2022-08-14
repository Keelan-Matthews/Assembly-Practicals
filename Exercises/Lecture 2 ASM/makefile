l2: l2.o
	ld -o l2 l2.o

l2.o:
	yasm -f elf64 -g dwarf2 l2.asm
	
run:
	./l2

debug:
	gdb l2

clean:
	rm l2.o l2