; 5 4 3 2 1
; 5 4 3 2
; 5 4 3
; 5 4
; 5


org 100h  ; Origin directive, setting starting address of the program

.data  ; Data segment where variables are defined
limit dw 5  ; Number of loops for both the inner and outer loop
temp dw ?  ; Variable to hold the value of the current ASCII number

.code  ; Code segment where the program instructions are located
    mov cx, limit  ; Initialize loop counter register with 'limit'
    
loop1:  ; Outer loop
    mov temp, 53  ; Assign ASCII value 53 to 'temp' variable (ASCII 53 is '5' in decimal)
    ; Inner loop
    loop2:
        mov ah, 02h  ; Prepare DOS to output a character
        mov dx, temp  ; Put 'temp' in 'dx' register to be printed
        int 21h  ; DOS interrupt to print the character
        dec temp  ; Decrement 'temp' by 1
        loop loop2  ; Continue inner loop until cx becomes zero
        
        mov cx, limit  ; Reset loop counter for outer loop
        dec limit  ; Decrease 'limit' by 1
        call newline  ; Call newline procedure
        loop loop1  ; Continue outer loop until cx becomes zero

; Procedure to output newline
newline proc
    mov ah, 02h  ; Prepare DOS to output characters
    mov dl, 0Ah  ; Carriage return (starts the cursor at the beginning of the line)
    int 21h  ; DOS interrupt
    mov dl, 0Dh  ; New line feed (jumps to the next line)
    int 21h  ; DOS interrupt
    ret  ; Return from procedure
newline endp  ; End of procedure