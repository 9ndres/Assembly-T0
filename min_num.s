# 07/11/2021
# Purpose: Echoes the minimum number from "data_items"
# %eax: Current item being read.
# %ebx: Minimum number.
# %edi: Current index.

.section .data
data_items:
   .long 12, 12, 45, 3, 2, 999

.section .text
.globl _start
_start:
   movl $0, %edi
   movl data_items(, %edi, 4), %eax
   movl %eax, %ebx

init_loop:
   cmpl $999, %eax  # Use 1010 to terminate init_loop
   je loop_exit
   incl %edi
   movl data_items(, %edi, 4), %eax
   cmpl %ebx, %eax
   jge init_loop
   movl %eax, %ebx
   jmp init_loop

loop_exit:
   movl $1, %eax
   int $0x80
