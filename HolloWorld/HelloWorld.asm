section .data
    print equ 0x4 ; metodo de escrita
    init equ 0x1 ; metodo saida padrao
    exit equ 0x0 ; retorna o  ponteito null/0
    fim equ 0x80 ; interupt/ chama karnel
    msg db 'Hello World', 0xA ; define mensagem
    len equ $- msg ; ler o numero da msg
section .text

global _start

_start:

    mov EAX, print
    mov EBX, init
    mov ECX, msg
    mov EDX, len
    int fim


    mov EAX, init ; define o fim do programa
    mov EBX, exit ; valor de rotorno no SO base
    int fim
