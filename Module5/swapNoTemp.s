#
#Program Name: swapNoTemp.s
#Author: Kbrom Ghirmai
#Date: 2/20/2024
#Purpose: Swap two registers using the eor instruction 
#

.text
.global main
main:
    #Push to stack record
    SUB sp, sp, #4
    STR lr, [sp, #0]
    
    #Prompt user to input the first value for the swap
    LDR r0, =prompt1
    BL printf
    
    #Read user input swap value
    LDR r0, =format1
    LDR r1, =num1
    BL scanf
 
    #Put first input value in r4
    LDR r0, =num1
    LDR r4, [r0, #0]
    
    #Prompt user for second value that will be swapped with the first value 
    LDR r0, =prompt2
    BL printf

    #Read second input value
    LDR r0, =format1
    LDR r1, =num1
    BL scanf
 
    #Put second value into r5
    LDR r0, =num1
    LDR r5, [r0, #0]
 
    #Swap values using EOR operation
    EOR r4, r4, r5  
 
    #val2 = val1 eor val2
    EOR r5, r4, r5
 
    #val1 = val1 eor val2
    EOR r4, r4, r5
 
    #print second value that has been swapped into the first value's register
    MOV r1, r4
    MOV r2, r0 
    LDR r0, =output1
    BL printf
   
    #Print first input value that has been swapped into the second input value's register
    MOV r1, r5
    MOV r2, r0 
    LDR r0, =output2
    BL printf
 
    #Pop to stack record
    LDR lr, [sp, #0]
    ADD sp, sp, #4
    MOV pc, lr
 
.data
    prompt1: .asciz "Please enter the first of two values that you want to swap: "
    prompt2: .asciz "\nPlease enter the second of the two values you want to swap: "
    format1: .asciz "%d"
    num1:    .word 0
    output1: .asciz "The first value is now: %d\n"
    output2: .asciz "The second value is now: %d\n"

