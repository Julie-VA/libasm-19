section .text
	global _ft_strdup
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

_ft_strdup:
	call	_ft_strlen	; call ft_strlen, len of src is in rax
	push	rdi			; push and save rdi on the stack
	inc		rax			; increment rax for the \0
	mov		rdi, rax	; cpy len in rdi, to be used by malloc
	call	_malloc		; call malloc, pointer to allocated memory is in rax
	pop		rcx			; pop the rdi save in rcx
	mov		rdi, rax	; prep args for ft_strcpy, first the dest
	mov		rsi, rcx	; then the src
	call	_ft_strcpy	; call ft_strcpy, the copied string is in rax
	ret
