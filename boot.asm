[bits 16]
[org 0x7c00]

mov bx, msg
call print

jmp $

print:
    pusha
        start:
            mov ah, 0x0e
            mov al, [bx]
            cmp al, 0
            je end

            int 0x10
            inc bx
            jmp start
        end:
            ret
    popa


msg db "RIP your MBR...", 0

times 510 - ($ - $$) db 0
dw 0xaa55