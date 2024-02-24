#
#Program name: InToFtIn.s
#Author: Kbrom Ghirmai
#Date: 2/19/2024
#Purpose: Take input value in inches and convert to ft and inches
#

.text
.global main
main: 
    #Push to stack record
    SUB sp, sp, #4
    STR lr, [sp]

    #Prompt for inches input
    LDR r0, =prompt1
    BL printf

    #Read the inches value
    LDR r0, =format1
    LDR r1, =num
    BL scanf

    #Convert inches to feet
    LDR r0, =num
    LDR r0, [r0]
    MOV r1, #12
    BL __aeabi_idiv
    MOV r4,r0

    #Print out the converted length (feet)
    MOV r1, r0
    LDR r0, =outputFt
    BL printf

    #Calculate remaining inches
    LDR r0, =num
    LDR r0, [r0]
    MOV r1, #12
    MUL r1, r4, r1
    SUB r1, r0, r1

    #Print out the remaining inches
    MOV r0,r1
    LDR r0, =outputIn
    BL printf

    #Pop from stack 
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr

.data
    prompt1:  .asciz "Enter the length in inches to convert to feet: "
    format1:  .asciz "%d"
    num:      .word 0
    outputFt: .asciz "Your length is %d feet"
    outputIn: .asciz " and %d inches.\n"
