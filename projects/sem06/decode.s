	.file	"decode.c"
	.text
	.globl	decode
	.type	decode, @function
decode:
	movq	(%rdi), %r8
	movq	(%rsi), %rcx
	movq	(%rdx), %rax
	movq	%r8, (%rsi)
	movq	%rcx, (%rdx)
	movq	%rax, (%rdi)
	ret
	.size	decode, .-decode
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
