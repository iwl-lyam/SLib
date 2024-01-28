# SLib
My assembly util library to speed up coding, with some useful functions

## Functions

| Function      | File              | Description                                                                 | RAX                      | RBX               | RDX              | R10                  |
| ------------- | ----------------- | --------------------------------------------------------------------------- | ------------------------ | ----------------- | ---------------- | -------------------- |
| convertAscii  | convertAscii.asm  | Converts a value from its ascii format to its intger format, and vice versa | Pointer to output buffer | N/A               | Pointer to input | 0 (atoi) or 1 (itoa) |
| print         | io.asm            | Prints out a string to STDOUT                                               | Pointer to text          | Pointer to length | N/A              | N/A                  |
