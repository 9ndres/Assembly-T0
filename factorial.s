#PURPOSE - Given a number, this program computes the
#	   factorial. For example, the factorial of 
#	   3 is 3 * 2 * 1, or 6. The factorial of
#	   4 is 4 * 3 * 2 * 1, or 24, and so on.
#

#This program shows how to call a function recursively.

.section .data

#This program has no global data

.section .text

.globl _start
.globl factorial #this is unneded unless we want to share
		 #this function among other programs

_start: 
pushl $4 	#The factorial takes one argument - the
		# number we want a factorial of. So, it 
		#gets pushed
call factorial  #run the factorial function
addl $4, %esp   #Scrubs that was pushed on
		#the stack
movl %eax, %ebx #factorial returns the answer in %eax
		#but we want it in %ebx to send it as
		#our exit status
movl $1, %eax
int $0x80

.type factorial,@function
factorial:
pushl %ebp
movl %esp, %ebp
movl 8(%ebp), %eax
cmpl $1, %eax

je end_factorial
decl %eax
pushl %eax
call factorial
movl 8(%ebp), %ebx
imull %ebx, %eax
end_factorial:
movl %ebp, %esp
popl %ebp
ret
