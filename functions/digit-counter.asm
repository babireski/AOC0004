#  Register usage:
#
#  $s0 → n
#  $s1 → number of digits of n

    .text
    .globl main

main:
    li      $v0, 5           # Integer input system service code
    syscall                  # Reads the first integer input
    or      $s0, $v0, $zero  # Moves $v0 content to $s0
    li      $s1, 0           # Counter
    jal     count            # Jumps to count and saves the return adress in $ra
    or      $a0, $s1, $zero  # Moves $s1 content to $a0
    li      $v0, 1           # Integer output system service code
    syscall                  # Prints the number of digits

end:
    li      $v0, 10          # End execution system service code
    syscall                  # Ends execution

count:
    beqz    $s0, return      # If $s0 equals zero branches to return
    div     $s0, $s0, 10     # Divides $s0 content by ten
    addi    $s1, $s1, 1      # Increases digit counter by one
    j       count            # Returns to count

return:
    jr      $ra              # Returns to return adress
