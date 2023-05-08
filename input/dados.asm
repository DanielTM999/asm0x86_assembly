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

section .data
    question equ "informe um numero", LN, NULL
    len equ $- question

section .bss ; local para definir variavel
    num1 resb 1 ; crua uma variavel do 1bit(resb = byte)

section .text



global _start ;inicio

_start:

    mov EAX, SYS_WRITE ; prepara o metodo  de escrita
    mov EBX, SYS_OVER; chama a saida
    mov ECX, question; pega a msg
    mov EDX, len; pega o tamanho da msg
    int CALL_METHOD; chama o karnel/mtd


    mov EAX, STD_IN; pega o valor da entrada
    mov EBX, STD_OUT;devove o valor para o ponteiro pelo metodo de saida
    mov ECX, num1; pega o valor da variavel
    mov ECX, 0x1 ; cria um tamanho(pode ser menor mais não maior => posi ficaria sobrando bytes perda de ficioncia de memoria{sedo menos ele add + 1byte})
    int CALL_METHOD ; chama o karnel/mtd


    mov EAX, SYS_OVER ;chama saind main
    mov EBX, STD_IN ; chama entrada main
    int EXT_P; chama mdt main
