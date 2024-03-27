	.file	"loop_while.c"
	.text
	.globl	loop_while
	.type	loop_while, @function
loop_while:
	movl	$0, %eax
	jmp	.L2
.L3:
	leaq	(%rdi,%rsi), %rdx
	addq	%rdx, %rax
	subq	$1, %rdi
.L2:
	cmpq	%rsi, %rdi
	jg	.L3
	ret
	.size	loop_while, .-loop_while
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
