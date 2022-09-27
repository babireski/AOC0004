    .data

biggest:
    .asciiz "Maior: "

smallest:
    .asciiz "Menor: "

    .text
    .globl main

main:

print:

end:
    li $v0, 10  # End execution system service code
    syscall     # Ends execution