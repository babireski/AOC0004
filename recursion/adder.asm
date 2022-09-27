    .data
    
newline: .ascii "\n"

    .text
    .globl main

main:
    # Input:
    li      $v0, 5
    syscall

    # End case test:
    beqz    $v0, end

    # Function calling:
    move    $a0, $v0
    jal     adder

    # Output:
    move    $a0, $v0
    li      $v0, 1
    syscall

    # Line skipping
    li      $v0, 4
    la      $a0, newline
    syscall

    # Loop:
    j       main

end:
    li      $v0, 10
    syscall

adder:
    # Base case test:
    beqz    $a0, base

    # Context saving:
    addi    $sp, $sp, -8
    sw      $s0, 0($sp)
    sw      $ra, 4($sp)

    # Recursion:
    li      $t0, 10
    div     $a0, $t0
    mflo    $a0
    mfhi    $s0
    jal     counter
    add     $v0, $v0, $s0

    # Context restore:
    lw      $s0, 0($sp)
    lw      $ra, 4($sp)
    addi    $sp, $sp, 8

    # Return:
    jr      $ra

base:
    or      $v0, $zero, $zero
    jr      $ra