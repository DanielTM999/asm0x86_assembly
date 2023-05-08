section .data ; definir constantes
    ;global
    CALL_METHOD equ 0x80 ; chama o karnel
    LN equ 0xA;pula linha
    NULL equ 0xD ;null (final de string)

   ;EAX => AX/AL(registrador Accumulator(opreções aritiméticas[maior uso]))
    SYS_OVER equ 0x1 ; chamada de saida
    SYS_READ equ 0x3 ; metodo de leitura
    SYS_WRITE equ 0x4 ; metodo escrita

   ;EBX => BX/BL(registrador base(Ponteiro para dados))
   EXIT equ 0x0 => ; finalizacao
   STD_IN equ 0x0 ; entrada padrão
   STD_OUT equ 0x1 ; saida padrão
section .text

section .data
    msg db "Hello World!", LN, NULL
    len equ $- msg

global _start

_start:

    mov EAX, SYS_WRITE; prepara o metodo  de escrita
    mov EBX, SYS_OVER; chama a saida
    mov ECX, msg; pega a msg
    mov EDX, len; pega o tamanho da msg
    int CALL_METHOD; chama o karnel/mtd


    mov EAX, SYS_OVER ; define o fim do programa
    mov EBX, EXIT ; valor de rotorno no SO base
    int CALL_METHOD
