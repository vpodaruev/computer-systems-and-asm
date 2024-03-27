	.file	"cond.c"
	.text
	.globl	cond
	.type	cond, @function
cond:
	testq	%rsi, %rsi
	je	.L1
	cmpq	%rdi, (%rsi)
	jge	.L1
	movq	%rdi, (%rsi)
.L1:
	ret
	.size	cond, .-cond
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
