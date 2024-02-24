#
#Program Name: celToF.s
#Author: Kbrom Ghirmai
#Date: 2/18/2024
#Purpose: To take a user input value in celsius and convert it to Farenheit and print that result
#

.text
.global main 

main:
    #Push to stack
       SUB sp, sp, #4
       STR lr, [sp, #0]
 
    #Prompt for Celcius temperature
       LDR r0, =prompt1
       BL  printf
 
    #Read the celsius value input by the user
       LDR r0, =format1 
       LDR r1, =numCel
       BL scanf
 
    #convert to Farenheit: F = (C*9)/5+32
       LDR r0, =numCel
       LDR r0, [r0, #0] 
     #Multiply input celsius by 9
       MOV r1, #9
       MUL r0, r0, r1
     #divide the result by 5 
       MOV r1, #5
       BL __aeabi_idiv  
     #Add 32 to complete conversion to F  
       MOV r1, #85
       ADD r0, r0, r1  

     #Print out the converted temperature
      MOV r1, r0
      LDR r0, =output1
      BL printf
 
    #Pop to Stack
     LDR lr, [sp, #0]
     ADD sp, sp, #4
     MOV pc, lr
 
.data
    prompt1: .asciz "Enter a temperature in celsius that you want converted to Farenheit:  "
    format1: .asciz "%d"
    numCel:  .word  0
    output1: .asciz "Your temperature converted to Farenheit is: %d\n"

