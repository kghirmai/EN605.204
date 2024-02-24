#
#Program name: ftInToIN.s
#Author: Kbrom Ghirmai
#Date: 2/19/2024
#Purpose: Convert two inputs that are in ft and inches to just inches
#

.text
.global main
main:
    #Push to stack record
    SUB sp, sp, #4
    STR lr, [sp, #0]

    # Prompt for and read the height in feet
    LDR r0, =promptFt
    BL printf

    #Read and store feet input
    LDR r0, =formatFt
    LDR r1, =heightFt
    BL scanf

    #Convert input feet to inches and store it
    LDR r0,=heightFt
    LDR r0,[r0] 
    MOV r1, #12
    MUL r0,r0,r1
    MOV r4, r0   

    #Prompt for the remaining height in inches
    LDR r0, =promptIn
    BL printf
    
    #Read portion of input that is inches
    LDR r0, =formatIn
    LDR r1, =heightIn
    BL scanf

    # Add the converted feet to inches
    LDR r0,=heightIn
    LDR r0,[r0]
    ADD r1, r0, r4

    #Print the total height in inches
    MOV r0,r1
    LDR r0, =output1
    BL printf

    #Pop from stack record
    LDR lr, [sp, #0]
    ADD sp,sp,#8
    MOV pc,lr

.data
   promptFt:  .asciz "Enter the height in feet: "
   promptIn:  .asciz "Enter the remaining height in inches: "
   formatFt:  .asciz "%d"
   formatIn:  .asciz "%d"
   heightFt:  .word 0
   heightIn:  .word 0
   output1:   .asciz "Your total height is %d inches\n"
