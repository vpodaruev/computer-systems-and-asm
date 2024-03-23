	.file	"branch.c"
	.text
	.globl	loop
	.type	loop, @function
loop:
	movq	%rdi, %rax
	jmp	.L2
.L3:
	sarq	%rax
.L2:
	testq	%rax, %rax
	jg	.L3
	ret
	.size	loop, .-loop
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
