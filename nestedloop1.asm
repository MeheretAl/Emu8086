org 100h

.data
count dw ?

.code
mov cx,5 ; set outerloop counter to 5
l1:
    mov count,cx ; save outer loop counter for later
    mov cx,4;set inner loop counter
    l2:
        mov ah,02h; prepare for output
        mov dl,2Ah;2Ah is the ascii value for '*'
        int 21h; interrupt to print '*' onto the screen
        loop l2;loop l2 the counter decrements by itself so no need for dec cx
    mov cx,count;restore outer loop counter
    mov dl,0dh;carriage return
    int 21h
    mov dl,0ah ; new line 
    int 21h
    loop l1
