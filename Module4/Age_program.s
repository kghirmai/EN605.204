#
#Program name: Age_Program
#Author: Kbrom Ghirmai
#Date: 2/12/2023
#Purpose: Ask user for agee and output their age
#


.text
.global main
main:
   #Push the stack record
   SUB sp, sp, #4
   STR lr, [sp, #0]
   
   #Prompt the user to input their age
   LDR r0, =prompt1
   BL printf
   
   #Read user input age
   LDR r0, =format1
   LDR r1, =age1
   BL scanf

   #Print the user input age 
   LDR r0, =output1
   LDR r1, =age1
   LDR r1, [r1, #0]
   BL printf

   #Pop the stack record
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr
.data
   prompt1: .asciz "Hi user, how old are you: "
   format1: .asciz "%d"
   age1:    .word 0
   output1: .asciz "Ok,so you are %d years old\n"
   
