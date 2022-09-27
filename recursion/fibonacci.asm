    .text
    .globl main

main:
    # Input:
    li      $v0, 5
    syscall
    move    $a0, $v0

    # Function calling:
    jal     fibonacci

    # Output:
    move    $a0, $v0
    li      $v0, 1
    syscall

end:
    li      $v0, 10
    syscall

fibonacci:
    # Base case test:
    blt     $a0, 2, base

    # Context saving:
    addi    $sp, $sp, -4
    sw      $ra, 0($sp)

    # Recursion:
    addi    $a0, $a0, -1
    jal     fibonacci
    or      $t1, $t0, $zero
    or      $t0, $v0, $zero
    add     $v0, $v0, $t1

    # Context restore:
    lw      $ra, 0($sp)
    addi    $sp, $sp, 4

    # Return:
    jr      $ra

base:
    ori     $v0, $zero, 1
    ori     $t0, $zero, 1
    jr      $ra