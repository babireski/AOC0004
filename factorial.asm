# Write a code that recieves an integer n and outputs n!

    .text
    .globl main

main:
    li $a0, 1  # Accumulator
    li $v0, 5  # Integer input system service code
    syscall    # Execution of the system call specified above (reads n)

factorial:
    mult $a0, $v0
    mflo $a0
    addi $v0, $v0, -1
    bnez $v0, factorial

print:
    li $v0, 1  # Integer output system service code
    syscall    # Execution of the system call specified above (writes n!)

end:
    li $v0, 10  # End execution system service code
    syscall     # Execution of the system call specified above