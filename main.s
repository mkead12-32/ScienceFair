	.file	"main.c"
	.text
	.section	.rodata
.LC0:
	.string	"Fib: "
.LC1:
	.string	"%d"
.LC2:
	.string	"Fib(0) = 0"
.LC3:
	.string	"Fib(1) = 1"
.LC4:
	.string	"Fib(%d) = %lld\n"
.LC6:
	.string	"Time taken: %f seconds\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	call	clock@PLT
	movq	%rax, -40(%rbp)
	movq	$0, -56(%rbp)
	movq	$1, -48(%rbp)
	movl	-64(%rbp), %eax
	testl	%eax, %eax
	js	.L2
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L2:
	movl	-64(%rbp), %eax
	testl	%eax, %eax
	jle	.L3
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
.L3:
	movl	$2, -60(%rbp)
	jmp	.L4
.L5:
	movq	-56(%rbp), %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rdx
	movl	-60(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-48(%rbp), %rax
	movq	%rax, -56(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, -48(%rbp)
	addl	$1, -60(%rbp)
.L4:
	movl	-64(%rbp), %eax
	cmpl	%eax, -60(%rbp)
	jle	.L5
	call	clock@PLT
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	subq	-40(%rbp), %rax
	pxor	%xmm0, %xmm0
	cvtsi2sdq	%rax, %xmm0
	movsd	.LC5(%rip), %xmm1
	divsd	%xmm1, %xmm0
	movsd	%xmm0, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %xmm0
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.section	.rodata
	.align 8
.LC5:
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
