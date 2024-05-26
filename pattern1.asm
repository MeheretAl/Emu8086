; 1 2 3 4 5    
; 1 2 3 4
; 1 2 3    
; 1 2
; 1
org 100h

.data
limit dw 5           ; Number of loops for both the inner and outer loop
temp dw ?            ; Variable to hold the value of the current ASCII number

.code

mov cx, limit        ; Initialize loop counter register with 'limit'
; Outer loop
loop1:
    mov temp, 49     ; Assign ASCII value 49 to 'temp' variable (ASCII 49 is '1' in decimal)
    ; Inner loop
    loop2:
        mov ah, 02h  ; Prepare DOS to output a character
        mov dx, temp ; Put 'temp' in 'dx' register to be printed
        int 21h      ; DOS interrupt to print the character
        inc temp     ; Increment 'temp' by 1
        loop loop2  ; Continue inner loop until cx becomes zero

    mov cx, limit  ; Reset loop counter for outer loop
    dec limit      ; Decrease 'limit' by 1
    call newline   ; Call newline procedure
    loop loop1    ; Continue outer loop until cx becomes zero

; Procedure to output newline
newline proc
    mov ah, 02h    ; Prepare DOS to output characters
    mov dx, 0Ah    ; Carriage return (starts the cursor at the beginning of the line)
    int 21h        ; DOS interrupt
    mov dx, 0Dh    ; New line feed (jumps to the next line)
    int 21h        ; DOS interrupt
    ret            ; Return from procedure
