.section .text
.globl _start

soma:
    pushq %rbp
    movq %rsp, %rbp
    subq $8, %rsp             # espaço para tmp

    movq 16(%rbp), %rax       # rax = x (endereço)
    movq (%rax), %rcx         # rcx = *x

    movq 24(%rbp), %rbx       # rbx = y (endereço)
    movq (%rbx), %rdx         # rdx = *y

    cmpq %rdx, %rcx           # *x >= *y
    jle casonao               # se *x < *y, vai pro else

    addq %rdx, %rcx           # tmp = *x + *y
    movq %rcx, -8(%rbp)
    #movq -8(%rbp), (%rax)
    movq -8(%rbp), %rsi
    movq %rsi, (%rax)

    addq $8, %rsp
    popq %rbp
    ret

casonao:
    addq %rcx, %rdx           # tmp = *y + *x
    movq %rdx, -8(%rbp)       # tmp = rdx (salva a soma na tmp)
    #movq -8(%rbp), (%rbx)

    movq -8(%rbp), %rsi
    movq %rsi, (%rbx)         # *y = tmp (move da tmp para *y)
    addq $8, %rsp
    popq %rbp
    ret

_start:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

    # A
    movq $5, -8(%rbp)

    # B
    movq $3, -16(%rbp)

    movq %rbp, %rax
    subq $8, %rax             # rax = endereço de A

    movq %rbp, %rbx           # rbx = %rbp
    subq $16, %rbx            # rbx = endereço de B

    pushq %rax
    pushq %rbx

    call soma

    addq $16, %rsp            # limpa os dois pushes

    movq -8(%rbp), %rdi

    movq $60, %rax
    syscall
