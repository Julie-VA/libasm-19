section .text
	global _ft_write
	extern ___error

_ft_write:
	mov		rax, 0x2000004	; rax = 0x2000004 (sys_write code)
	syscall					; call sys_write
	jc		_error			; in case of error
	ret

_error:
	push	rax			; save error code
	call	___error	; puts pointer to errno in rax
	mov		rbx, rax	; place pointer in rbx
	pop		rax			; restore error code in rax
	mov		[rbx], rax	; move error code to errno location
	mov		rax, -1		; set return value
	ret

; fd = rdi, buffer = rsi, bytes = rdx
; arguments are passed on the registers rdi, rsi, rdx, r10, r8 and r9