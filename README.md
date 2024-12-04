# SLib
My assembly util library to speed up coding, with some useful functions

## Functions

| Function      | File              | Description                                                                 | RAX                      | RBX               | RDX              | R10                  |
| ------------- | ----------------- | --------------------------------------------------------------------------- | ------------------------ | ----------------- | ---------------- | -------------------- |
| convertAscii  | convertAscii.asm  | Converts a value from its ascii format to its intger format, and vice versa | Pointer to output buffer | N/A               | Pointer to input | 0 (atoi) or 1 (itoa) |
| print         | io.asm            | Prints out a string to STDOUT                                               | Pointer to text          | Pointer to length | N/A              | N/A                  |
| read          | io.asm            | Takes in a string from STDIN                                                | Pointer to input buffer  | Pointer to length | N/A              | N/A                  |
| exit          | io.asm            | Smoothly exits the program                                                  | N/A                      | N/A               | N/A              | N/A                  |
| open          | file.asm          | Open a file and store the file descriptor                                   | Pointer to file path     | Pointer to FD buffer | N/A | N/A |
| openOrCreate | file.asm | Open a file or create it if it doesn't exist, then store the file descriptor | Pointer to file path | Pointer to FD buffer | File permissions | N/A |

## Linking

To link the library, use ld with all the library files as usual, but add the `-r` (relocatable) option, and the output being `lib.o`. Then, when linking your main program, your inputs should be `lib.o` and your program.
