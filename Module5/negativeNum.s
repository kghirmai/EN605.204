#
#Program Name: negativeNum.s
#Author: Kbrom Ghirmai
#Date: 2/18/2024
#Purpose: Take an input integer and output the number as a negative using 2s complement
#

.text
.global main
main:
   #Push to stack record
     SUB sp, sp, #4
     STR lr, [sp, #0]

   #Prompt user to input a positive integer
     LDR r0, =prompt1
     BL printf

   #Read user input
     LDR r0, =format1
     LDR r1, =num1
     BL scanf
 
   #Load user input value for conversion
     LDR r0, =num1
     LDR r0, [r0, #0]
   #Do twos complement conversion to input value  
    #Ones complement using MVN
     MVN r0, r0
    #Add 1 to calculate twos complement
     ADD r0, r0, #1
 
   #Print twos complement value
     MOV r1, r0                
     LDR r0,=output1
     BL printf
 
   #Restore return address and return
     LDR lr, [sp, #0]
     ADD sp, sp, #4
     MOV pc, lr
 
.data
 prompt1: .asciz "Enter value to calculate twos complement/inverse of: "
 format1: .asciz "%d"
 num1:    .word 0
 output1: .asciz "The inverse of your the number you input is %d \n"
