# 07/11/2021
# Purpose: Invokes a system call and exits with status code of 3
# Registers: %eax, %ebx

.section .data

.section .text

.globl _start
_start:
   movl $3, %ebx
   movl $1, %eax
int $0x80

