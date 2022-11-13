	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	mygetch
	.type	mygetch, @function
mygetch:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 160
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -144[rbp]
	mov	rsi, rax
	mov	edi, 0
	call	tcgetattr@PLT
	mov	rax, QWORD PTR -144[rbp]
	mov	rdx, QWORD PTR -136[rbp]
	mov	QWORD PTR -80[rbp], rax
	mov	QWORD PTR -72[rbp], rdx
	mov	rax, QWORD PTR -128[rbp]
	mov	rdx, QWORD PTR -120[rbp]
	mov	QWORD PTR -64[rbp], rax
	mov	QWORD PTR -56[rbp], rdx
	mov	rax, QWORD PTR -112[rbp]
	mov	rdx, QWORD PTR -104[rbp]
	mov	QWORD PTR -48[rbp], rax
	mov	QWORD PTR -40[rbp], rdx
	mov	rax, QWORD PTR -96[rbp]
	mov	QWORD PTR -32[rbp], rax
	mov	eax, DWORD PTR -88[rbp]
	mov	DWORD PTR -24[rbp], eax
	mov	eax, DWORD PTR -68[rbp]
	and	eax, -11
	mov	DWORD PTR -68[rbp], eax
	lea	rax, -80[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 0
	call	tcsetattr@PLT
	call	getchar@PLT
	mov	DWORD PTR -148[rbp], eax
	lea	rax, -144[rbp]
	mov	rdx, rax
	mov	esi, 0
	mov	edi, 0
	call	tcsetattr@PLT
	mov	eax, DWORD PTR -148[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	ret
	.size	mygetch, .-mygetch
	.globl	get_string
	.type	get_string, @function
get_string:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 0
.L5:
	mov	eax, 0
	call	mygetch
	mov	DWORD PTR -4[rbp], eax
	mov	rdx, QWORD PTR stdout[rip]
	mov	eax, DWORD PTR -4[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	putc@PLT
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, DWORD PTR -4[rbp]
	mov	BYTE PTR [rax], dl
	cmp	DWORD PTR -4[rbp], 4
	jne	.L5
	mov	eax, DWORD PTR -8[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	BYTE PTR [rax], 0
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rdx, 1[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	leave
	ret
	.size	get_string, .-get_string
	.section	.rodata
.LC0:
	.string	"\nmax: %c\n"				#строка в printf в лок функции
.LC1:
	.string	"\nmin: %c\n"				#строка в printf в лок функции
	.text
	.globl	get_chars
	.type	get_chars, @function
get_chars:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	DWORD PTR -16[rbp], 0
	mov	DWORD PTR -12[rbp], 130
	mov	DWORD PTR -8[rbp], -1
	jmp	.L8
.L11:
	mov	eax, DWORD PTR -16[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	DWORD PTR -4[rbp], eax
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -12[rbp]
	jge	.L9
	cmp	DWORD PTR -4[rbp], 4
	je	.L9
	mov	eax, DWORD PTR -16[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -18[rbp], al
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -12[rbp], eax
.L9:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -8[rbp]
	jle	.L10
	cmp	DWORD PTR -4[rbp], 4
	je	.L10
	mov	eax, DWORD PTR -16[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	mov	BYTE PTR -17[rbp], al
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -8[rbp], eax
.L10:
	add	DWORD PTR -16[rbp], 1
.L8:
	mov	eax, DWORD PTR -16[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	test	al, al
	jne	.L11
	movsx	eax, BYTE PTR -17[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	movsx	eax, BYTE PTR -18[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	nop
	leave
	ret
	.size	get_chars, .-get_chars
	.section	.rodata
.LC2:
	.string	"\nstr1? "
	.text
	.globl	main
	.type	main, @function
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 4096
	or	QWORD PTR [rsp], 0
	sub	rsp, 1840
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	lea	rax, -10016[rbp]
	mov	QWORD PTR -10024[rbp], rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -10024[rbp]
	mov	rdi, rax
	call	get_string
	mov	rax, QWORD PTR -10024[rbp]
	mov	rdi, rax
	call	get_chars
	mov	eax, 0
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L14
	call	__stack_chk_fail@PLT
.L14:
	leave
	ret
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
