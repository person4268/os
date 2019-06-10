global outb

; Sends byte over i/o port
outb:

    mov al, [esp + 8] ; C puts arguments on stack. Each variable is idk how big
    mov dx, [esp + 4] ; Stack grows downwards

    out dx, al

    ret