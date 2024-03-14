	.file	"remdiv.c"
	.text
	.globl	remdiv
	.type	remdiv, @function
remdiv:
	movq	%rdi, %rax
	movq	%rdx, %r8
	cqto
	idivq	%rsi
	movq	%rax, (%r8)
	movq	%rdx, (%rcx)
	ret
	.size	remdiv, .-remdiv
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
