section .text
	global _ft_list_remove_if
	extern _free

; rdi = **begin, rsi = *data, rdx = (*cmp)(s1, s2)
_ft_list_remove_if:
	cmp		rdi, 0
	je		_exit				; if **begin == NULL, _exit
	cmp		QWORD [rdi], 0
	je		_exit				; if *begin == NULL, _exit
	cmp		rsi, 0
	je		_exit				; if *data == NULL, _exit
	cmp		rdx, 0
	je		_exit				; if cmp == NULL, _exit
	push	r12
	push	r13
	push	r14
	mov		r12, QWORD [rdi]	; save *begin in r12
	mov		r13, rsi			; save *data in r13
	mov		r14, rdx			; save cmp in r14
	jmp		_loop

_loop:
	cmp		QWORD [r12 + 8], 0
	je		_restore				; if *tmp = NULL, we're at the end, _restore
	mov	r8, QWORD [r12]
	push	rdi
	mov		rdi, QWORD [r12]		; cpy tmp->data in rdi (1st arg for cmp)
	mov		rsi, r13				; cpy *data in rsi (2nd arg)
	call	r14						; call cmp
	pop		rdi						; restore **begin
	cmp		rax, 0
	je		_delete_elem			; if rax == 0, that means tmp->data == data
	mov		r12, QWORD [r12 + 8]	; *tmp = tmp->next
	jmp		_loop

_delete_elem:
	pop	r14
	pop	r13
	pop	r12
	mov	rax, 100
	ret

_restore:
	pop	r14
	pop	r13
	pop	r12

_exit:
	mov	rax, 0
	ret

; DOESNT CHECK LAST