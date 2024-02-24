#
#Program Name:  Assignment4_prog2.s
#Author:  Kbrom Ghirmai
# Date: 2/12/2024
#Purpose: Output tabs between a user input integer and two parts of a string
#

.text
.global main
main:
   #push the stack record
   SUB sp, sp, #4
   STR lr, [sp, #0]
   
   #Prompt the user to put an integer for the formatted string
   LDR r0, =prompt1
   BL printf

   #read the user input integer
   LDR r0, =format1
   LDR r1, =num1
   BL scanf

   #print the user input with the rest of the formatted output string
   LDR r0, =output1
   LDR r1, =num1
   LDR r1, [r1,#0]
   BL printf
   
   #Pop the stack 
   LDR lr, [sp, #0]
   ADD sp, sp, #4
   MOV pc, lr
.data
  prompt1: .asciz  "Please input a number below a hundred: "
  format1: .asciz "%d"
  num1:    .word   0
  output1: .asciz "You chose to have \t%d\t as your number!\n"
   

   
   
