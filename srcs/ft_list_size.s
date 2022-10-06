section .text
	global _ft_list_size

_ft_list_size:
	cmp	rdi, 0
	je	_error		; if rdi == NULL, exit
	mov	rax, 0		; rax = 0
	mov	rcx, rdi	; save *begin in rcx
	jmp	_loop

_loop:
	cmp	rdi, 0
	je	_exit			; if rdi == NULL, 
	inc	rax				; increment rax
	mov	rdi, [rdi + 8]	; begin = begin.next
	jmp	_loop

_exit:
	mov	rdi, rcx	; restore *begin
	ret

_error:
	mov	rax, 0
	ret