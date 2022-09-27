# Prints the nth term of the Fibonacci sequence considering F(0) = F(1) = 0

    .text
    .globl main

main:
    li $a0, 1  # F(0)
    li $t0, 1  # F(1)
    li $t1, 0  # Auxiliary
    li $v0, 5  # Integer input
    syscall

fibonacci:
    beqz $v0, print
    move $t1, $a0
    move $a0, $t0
    add $t0, $a0, $t1
    addi $v0, $v0, -1
    j fibonacci

print:
    li $v0, 1  # Integer output code
    syscall    

end:
    li $v0, 10
    syscall     
