section .text
	global _ft_list_sort

; rdi = **begin, rsi = strcmp(s1, s2)
_ft_list_sort:
	cmp	rdi, 0
	je	_error			; if **begin == NULL, error
	cmp	QWORD [rdi], 0
	je	_error			; if *begin == NULL, error
	cmp	rsi, 0
	je	_error			; if strcmp == NULL, error


	mov	rax, 4
	ret

_error:
	mov	rax, 0
	ret



;2314

;2 < 3 oui

;3 < 1 non -> inverse puis met 1 au tout debut -> 1234



;4321

;4 < 3 non -> inverse puis met 3 au debut -> 3421

;3 < 4 oui

;4 < 2 non -> inverse puis met 2 au debut -> 2341

;2 < 3 oui

;3 < 4 oui

;4 < 1 non -> inverse puis met 1 au debut -> 1234