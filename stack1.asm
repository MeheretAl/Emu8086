org 100h          ; Set the origin for the program

mov ax, 1212h     ; Assign ax the value 1212h
push ax           ; Push ax onto the stack
                  ; Stack now contains 1212h on top

mov ax, 3211h     ; Assign ax the value 3211h
                  ; Now ax = 3211h

pop ax            ; Pop the top value from the stack into ax
                  ; ax now contains the value 1212h from the stack
                  ; Stack is now empty
