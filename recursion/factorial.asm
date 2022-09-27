    .text
    .globl main

main:
    # Input:
    li      $v0, 5
    syscall
    move    $a0, $v0

    # Function calling:
    jal     factorial

    #Output:
    move    $a0, $v0
    li      $v0, 1
    syscall

end:
    li      $v0, 10
    syscall

factorial:
    # Base case test:
    blt     $a0, 1, base

    # Context saving:
    addi    $sp, $sp, -8
    sw      $s0, 0($sp)
    sw      $ra, 4($sp)

    # Recursion:
    move    $s0, $a0
    addi    $a0, $a0, -1
    jal     factorial
    mul     $v0, $v0, $s0

    # Context restore:
    lw      $s0, 0($sp)
    lw      $ra, 4($sp)
    addi    $sp, $sp, 8

    # Return:
    jr      $ra

base:
    ori     $v0, $zero, 1
    jr      $ra
