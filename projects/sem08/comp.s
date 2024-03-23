	.file	"comp.c"
	.text
	.globl	comp
	.type	comp, @function
comp:
	cmpq	%rsi, %rdi
	setg	%al
	movzbl	%al, %eax
	ret
	.size	comp, .-comp
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
