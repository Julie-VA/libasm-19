section .text
	global _ft_write

_ft_write:
	mov	rax, 0x2000004	; rax = 0x2000004 (sys_write code)
	syscall				; call sys_write
	jc	error			; in case of error
	ret

error:
	mov	rax, -1
	ret

; fd = rdi, buffer = rsi, bytes = rdx
; arguments are passed on the registers rdi, rsi, rdx, r10, r8 and r9 (https://filippo.io/making-system-calls-from-assembly-in-mac-os-x/)
; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/