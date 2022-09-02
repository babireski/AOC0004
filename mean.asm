    .data

newline:
    .asciiz "\n"

message:
    .asciiz "ERRO"

    .text
    .globl main

main:
    li $t0,  0  # Somador
    li $t1,  0  # Contador
    li $t2, -1  # Comparador

input:
    li $v0, 5
    syscall
    beq $v0, $t2, sum
    add $t0, $t0, $v0
    addi $t1, $t1, 1
    j input

sum:
    move $a0, $t0
    li $v0, 1
    syscall

line:
    la $a0, newline
    li $v0, 4
    syscall

mean:
    beqz $t0, error
    div $a0, $t0, $t1
    li $v0, 1
    syscall
    j end

error:
    la $a0, message
    li $v0, 4
    syscall

end:
    li $v0, 10
    syscall