# Jun/05/2021
# Purpose: This code does nothing but returning a status code to the Linux kernel.
# Input: None.
# Output: Status code. echo $?

.section .data # assembler directive

.section .text # text section is where our program instructions live.
.globl _start  # don't throw our _start symbol after assembling.
 
_start:     # defintion of _start symbol.
   movl $1, %eax   # system call for exiting a program.

   movl $0, %ebx   # status number to return. 

int $0x80

