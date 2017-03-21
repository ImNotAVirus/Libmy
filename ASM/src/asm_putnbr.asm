;
; void              asm_putnbr(int nbr)
;
BITS 64

SECTION .text
EXTERN asm_putchar
EXTERN asm_isneg
GLOBAL asm_putnbr

asm_putnbr:
    PUSH RAX
    PUSH RBX
    PUSH RDX
    CMP EDI, 0
    JNS _start

_isneg:
    PUSH RDI
    MOV RDI, 45             ; '-' char
    CALL asm_putchar
    POP RDI
    IMUL EDI, -1

_start:
    PUSH 0                  ; End of string
    MOV RAX, RDI
    MOV RBX, 10

_loop:
    XOR RDX, RDX            ; Clear high bits of RDX (dividend)
    IDIV RBX                ; Divide by 10
    PUSH RDX                ; Save remainder
    ADD BYTE [RSP], 0x30    ; Convert to printable char
    CMP RAX, 0
    JNE _loop

_loop_print:                ; Basic print loop
    POP RDI
    CALL asm_putchar
    CMP RDI, 0
    JNE _loop_print

_end:
    POP RDX
    POP RBX
    POP RAX
    RET

