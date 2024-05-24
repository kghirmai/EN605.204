#
#Program Name: RecurMult.s
#Author:Kbrom Ghirmai
#Date: 03/23/2024
#Purpose: Implement RecurMult function to calculate amultiplation using succesive addition using recursion
#

.text
.global main
main:

#Push stack
 SUB sp, sp, #4
 STR lr, [sp, #0]
 
#Prompt input for first value (m)
 LDR r0, =Prompt1
 BL printf

#Read and store first input (m)
 LDR r0, =format1
 LDR r1, =Input1
 BL scanf

#Move first number into safe register (m)
 LDR r4,=Input1
 LDR r4,[r4]

#Prompt for the 2nd value (n)
 LDR r0, =Prompt2
 BL printf

#Read input value (n)
 LDR r0, =format2
 LDR r1, =Input2
 BL scanf

#Move second input (n) into safe register
 LDR r5,=Input2
 LDR r5,[r5]

#Implement RecurMult function and print results
 MOV r0,r4
 MOV r1,r5
 BL RecurMult
 MOV r1,r0
 LDR r0,=output1
 BL printf

#Pop stack
 LDR lr, [sp, #0]
 ADD sp, sp, #4
 MOV pc, lr

.data
Prompt1:.asciz "Enter the first number you want to multiply with the second number: "
Prompt2:.asciz "Enter the second number you want multiplied by the first number: "
format1:.asciz "%d"
format2:.asciz "%d"
Input1: .word 0
Input2: .word 0
output1:.asciz "The product of your two input values is: %d \n"
