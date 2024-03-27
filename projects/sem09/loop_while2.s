	.file	"loop_while2.c"
	.text
	.globl	loop_while2
	.type	loop_while2, @function
loop_while2:
	testq	%rsi, %rsi
	jle	.L4
	movq	%rsi, %rax
.L3:
	imulq	%rdi, %rax
	subq	%rdi, %rsi
	testq	%rsi, %rsi
	jg	.L3
	ret
.L4:
	movq	%rsi, %rax
	ret
	.size	loop_while2, .-loop_while2
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
