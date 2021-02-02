#PURPOSE: This program finds the maximum number of a
#	  set of data items.
#
#VARIABLES: The registers have the following use
#
# %edi - Holds the index of the data item being examined
# %ebx - Smallest data item found
# %eax - Current data item
#
# The following memory allocations are used:
# data_items - Contains the item data. A 0 is uded to terminate
# 	       the data.
.section .data
data_items:
.long 389, 938, 38, 983, 22, 65, 0 

.section .text
.globl _start
_start:
movl $0, %edi
movl data_items(, %edi, 4 ), %eax
movl %eax, %ebx

start_loop:
cmpl $0, %eax
je loop_exit
incl %edi
movl data_items(, %edi, 4 ), %eax
cmp %ebx, %eax
jge start_loop
movl %eax, %ebx
jmp start_loop

loop_exit:
movl $1, %eax
int $0x80
