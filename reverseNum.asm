org 100h

include 'emu8086.inc' ; used for print function

.data
num dw 0
.code
mov cx,5
print 'Enter five integer numbers: '
l1:
    mov ah,01h;get input from user
    int 21h
    push ax;pushing every value onto ax
    inc num
    loop l1
    mov cx,num
        print 'The reverse order is: '
        l2:
        pop bx;pop top value of stack into bx
        mov ah,02h;prepare for print
        mov dx,bx;print bx  
        int 21h
        loop l2

        ret