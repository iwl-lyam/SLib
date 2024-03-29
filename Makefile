main:
	@echo "-------------------------------------------------------------------"
	@echo "ASSEMBLING"
	nasm -f elf64 -F dwarf -o io.o lib/io.asm
	nasm -f elf64 -F dwarf -o ascii.o lib/convertAscii.asm
	nasm -f elf64 -F dwarf -o test.o interrupt.asm

	@echo "LINKING"
	ld -o lib.o -r io.o ascii.o
	ld -o main lib.o test.o

run:
	@echo "ASSEMBLING"
	nasm -f elf64 -F dwarf -o io.o lib/io.asm
	nasm -f elf64 -F dwarf -o ascii.o lib/convertAscii.asm
	nasm -f elf64 -F dwarf -o test.o interrupt.asm

	@echo "LINKING"
	ld -o lib.o -r io.o ascii.o
	ld -o main lib.o test.o
	./main