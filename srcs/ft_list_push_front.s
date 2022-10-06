section .text
	global _ft_list_push_front
	extern _malloc

_ft_list_push_front:
	push	rsp
	mov		rax, 0
	cmp		rdi, 0
	je		_exit			; if rdi == NULL, exit
	push	rdi				; save list_begin on stack
	push	rsi				; save data on stack
	mov		rdi, 16			; 16 = size of t_list
	call	_malloc
	pop		rsi				; restore rsi
	pop		rdi				; restore rdi
	cmp		rax, 0			; compare rax with 0
	je		_exit			; if rax = 0 then go to _exit, malloc failed
	mov		[rax], rsi		; new.data = data
	mov		rcx, [rdi]		; save *begin in rcx	
	mov		[rax + 8], rcx	; new.next = *begin
	mov		[rdi], rax		; *begin = new
	jmp		_exit

_exit:
	mov	rax, 0	; set rax to 0
	pop	rsp
	ret
