	.file	"fun_b.c"
	.text
	.globl	fun_b
	.type	fun_b, @function
fun_b:
	movl	$64, %edx
	movl	$0, %ecx
.L2:
	leaq	(%rcx,%rcx), %rax
	movq	%rdi, %rcx
	andl	$1, %ecx
	orq	%rcx, %rax
	movq	%rax, %rcx
	shrq	%rdi
	subq	$1, %rdx
	jne	.L2
	ret
	.size	fun_b, .-fun_b
	.ident	"GCC: (GNU) 13.2.1 20230801"
	.section	.note.GNU-stack,"",@progbits
