# Purpose: Returns the maximum element from a set of numbers.
# %eax: Current data item.
# %ebx: Larges data item found.
# %edi: Holds the index of the item being examined.

.section .data

data_items:
   .long 21, 12, 54, 45, 254, 0

.section .text

.globl _start
_start:
   movl $0, %edi 
   movl data_items(, %edi, 4), %eax
   movl %eax, %ebx
      
init_loop:
  cmpl $0, %eax
  je loop_exit
  incl %edi 
  movl data_items(, %edi, 4), %eax
  cmpl %ebx, %eax 
  jle init_loop
  movl %eax, %ebx 
  jmp init_loop 

loop_exit: 
  movl $1, %eax
  int $0x80   
