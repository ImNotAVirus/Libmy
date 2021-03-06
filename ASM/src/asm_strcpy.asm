;
; char              *asm_strcpy(char *dest, const char *src);
;
BITS 64

SECTION .text
GLOBAL asm_strcpy

asm_strcpy:
    PUSH RCX
    MOV RCX, -1

_loop:
    INC RCX
    MOV AL, BYTE [RSI + RCX]
    MOV BYTE [RDI + RCX], AL
    CMP AL, 0
    JNE _loop

_end:
    MOV RAX, RDI
    POP RCX
    RET

