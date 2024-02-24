#
#Program name: multByTeN.s
#Author: Kbrom Ghirmai
#Date: 2/19/2024
#Purpose: Take an input number and using logical shifts and add instructions multiply the input by 10 and output the value
#

.text
.global main
main:
    #Push to stack record
    SUB sp, sp, #4
    STR lr, [sp]

    #Prompt for user to input an number
    LDR r0, =prompt1
    BL printf

    #Read input integer
    LDR r0, =format1
    LDR r1, =num1
    BL scanf
    
    #Store the value of the input value 
    LDR r0, =num1
    LDR r1, [r0, #0]
 
    #Shift the value in r1 by 2^3 using LSL Operation
    MOV r2, r1, LSL #3
  
    #Shift the value in r1 by 2^1 with LSL operation 
    MOV r3, r1, LSL #1
 
    #Add the values together to multiply by 10
    ADD r1, r2, r3
 
    #Print the resulting input value multiplied by 10
    LDR r0, =output1
    BL printf

    #Pop from Stack record
    LDR lr, [sp]
    ADD sp, sp, #4
    MOV pc, lr
 
.data
    prompt1: .asciz "Please input a postive number: "
    format1: .asciz "%d"
    num1:    .word 0
    output1: .asciz "Your input value multiplied by ten is %d\n" 
