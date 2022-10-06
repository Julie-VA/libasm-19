section .text
	global _ft_read
	extern ___error

_ft_read:
	mov	rax, 0x2000003	; rax = 0x2000003 (sys_read code)
	syscall				; call sys_read
	jc	_error			; in case of error
	ret

_error:
	push	rax			; save error code
	call	___error	; puts pointer to errno in rax
	mov		rbx, rax	; place pointer in rbx
	pop		rax			; restore error code in rax
	mov		[rbx], rax	; move error code to errno location
	mov		rax, -1		; set return value
	ret