NAME := perse

lib: FORCE
	@echo "-------------------------------------------------------------------"
	@echo "ASSEMBLING"
	nasm -f elf64 -F dwarf -o io.o lib/io.asm
	nasm -f elf64 -F dwarf -o ascii.o lib/convertAscii.asm
	nasm -f elf64 -F dwarf -o file.o lib/file.asm

	@echo "LINKING"
	ld -o lib.o -r io.o ascii.o file.o

run:
	@echo "ASSEMBLING"
	nasm -f elf64 -F dwarf -o "$(NAME).o" "$(NAME).asm"

	@echo "LINKING"
	ld -o main lib.o "$(NAME).o"
	./main

FORCE: ;
