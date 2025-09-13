.section .text
.globl _start

contador:
    pushq %rbp
    movq %rsp, %rbp
    # incrementa valor apontado por %rbx
    addq $1, (%rbx)

    popq %rbp
    ret

_start:

    pushq %rbp
    movq %rsp, %rbp
    # reserva espaço para x e a
    subq $16, %rsp

    movq $0, -8(%rbp)  # x = 0
    movq $0, -16(%rbp)  # a = 0

    # base pointer → rbx
    movq %rbp, %rbx
    # rbx = endereço de a
    subq $16, %rbx

    call contador
    call contador
    call contador
    call contador
    call contador

    # pega o valor de a
    movq -16(%rbp), %rax
    # coloca o valor em x
    movq %rax, -8(%rbp)

    movq -8(%rbp), %rdi

    addq $16, %rsp
    popq %rbp

    movq $60, %rax
    syscall
