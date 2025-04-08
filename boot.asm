; boot.asm
[ORG 0x7C00]
[BITS 16]

mv si , msg
call print

jmp $

print:
    mov ah, 0X0E
.loop:
    lodsb
    or al, al
    jz done
    int 0x10
    jmp .loop

done:
    ret
msg db "Booting Kernel...", 0

time 510-($-$$) db 0
dw 0xAA55
