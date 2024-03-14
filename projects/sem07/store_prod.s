	.file	"store_prod.c"
	.text
	.globl	store_prod
	.type	store_prod, @function
store_prod:
	movq	%rsi, %rax
	movq	%rdx, %r9
	sarq	$63, %r9
	movq	%rsi, %r11
	sarq	$63, %r11
	movq	%r11, %rcx
	imulq	%rdx, %rcx
	movq	%r9, %rsi
	imulq	%rax, %rsi
	addq	%rsi, %rcx
	mulq	%rdx
	addq	%rcx, %rdx
	movq	%rax, (%rdi)
	movq	%rdx, 8(%rdi)
	ret
	.size	store_prod, .-store_prod
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
