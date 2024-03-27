	.file	"fun_a.c"
	.text
	.globl	fun_a
	.type	fun_a, @function
fun_a:
	movl	$0, %eax
	jmp	.L2
.L3:
	xorq	%rdi, %rax
	shrq	%rdi
.L2:
	testq	%rdi, %rdi
	jne	.L3
	andl	$1, %eax
	ret
	.size	fun_a, .-fun_a
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
