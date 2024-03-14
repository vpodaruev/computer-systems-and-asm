	.file	"scale.c"
	.text
	.globl	scale
	.type	scale, @function
scale:
	leaq	(%rdi,%rdi,4), %rax
	leaq	(%rax,%rsi,2), %rax
	leaq	(%rax,%rdx,8), %rax
	ret
	.size	scale, .-scale
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
