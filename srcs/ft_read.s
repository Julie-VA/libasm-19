section .text
	global _ft_read

_ft_read:
	mov	rax, 0x2000003	; rax = 0x2000003 (sys_read code)
	syscall				; call sys_read
	jc	error			; in case of error
	ret

error:
	mov	rax, -1
	ret