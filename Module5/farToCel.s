#
#Program Name: farToCel.s
#Author: Kbrom Ghirmai
#Date: 2/18/2024
#Purpose: To convert user input value in Farenheit to Celsius
#

.text
.global main
main:
    #Push to stack record
     SUB sp, sp, #4
     STR lr, [sp, #0]

    #Prompt user to input a temperature in celsius
     LDR r0, =prompt1
     BL printf

    #Read user input Farenheit value
     LDR r0, =format1
     LDR r1, =numF
     BL scanf

    #Convert Farenheit value to Celsius C=(F-32)*5/9
     LDR r0, =numF 
     LDR r0, [r0, #0]
     #Start conversion by subtracting 32 from input value in farenheit
     MOV r1, #32
     SUB r0,r0,r1
     #Multiply result by 5
     MOV r1, #5
     MUL r0, r0,r1
     #Divide by 9 to complete the conversion
     MOV r1, #9
     BL __aeabi_idiv

    #Print out the converted value
     MOV r1,r0
     LDR r0, =output1
     BL printf  
    
    #Pop from stack record
     LDR lr, [sp, #0]
     ADD sp, sp, #4
     MOV pc, lr

.data
  prompt1: .asciz "Please input a value in Farenheit that you want converted to Celsius: "
  format1: .asciz "%d"
  numF:    .word 0
  output1: .asciz "Your temperature converted to Farenheit is %d\n"
 
