org 100h
;find the sum of the first 5 natural numbers
.code
mov cx,5;
mov al,0
mov bl,0
    loop1:
        inc al
        add bl,al
        loop loop1
; the value of the sum 15d or 0fh in hexadecimal
; is stored on bl
; can use ax and bx too or ah and bh too