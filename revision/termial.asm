# Implementation of a termial function
# A termial can be recursively defines as n? = n + (n - 1)?
# Its name and notation was coined by Donald Knuth in his book The Art of Computer Programming

    .text
    .globl main

main:
    li      $v0, 5
    syscall
    or      $a0, $v0, $zero
    jal     termial
    or      $a0, $v0, $zero
    li      $v0, 1
    syscall

end:
    li      $v0, 10
    syscall

termial:
    beq     $a0, $zero, base
    addi    $sp, $sp, -8
    sw      $s0, 0($sp)
    sw      $ra, 4($sp)

    or      $s0, $a0, $zero
    addi    $a0, $a0, -1
    jal     termial
    add     $v0, $v0, $s0

    lw      $ra, 4($sp)
    lw      $s0, 0($sp)
    addi    $sp, $sp, 8
    jr      $ra

base:
    or      $v0, $zero, $zero
    jr      $ra