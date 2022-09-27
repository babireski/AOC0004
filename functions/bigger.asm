    .text
    .globl main

main:
    li      $v0, 5             # Integer input system service code
    syscall                    # Reads the first integer input
    or      $s0, $v0, $zero    # Moves $v0 content to $s0
    li      $v0, 5             # Integer input system service code
    syscall                    # Reads the second integer input
    or      $s1, $v0, $zero    # Moves $v0 content to $s1
    jal     bigger             # Jumps to bigger and saves the return adress in $ra
    move    $a0, $v0
    li      $v0, 1
    syscall

end:
    li      $v0, 10            # End execution system service code
    syscall                    # Ends execution

bigger:
    slt     $t0, $s0, $s1      # $t0 = $s0 < $s1
    beq     $t0, $zero, first

second:
    move    $v0, $s1
    j       return

first:
    move    $v0, $s0

return:
    jr      $ra
