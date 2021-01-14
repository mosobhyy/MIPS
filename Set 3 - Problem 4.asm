.data     # here we declare variables  

inputMsg: .asciiz "Enter Number: "
factMsg: .asciiz "Factorial of "
equalMsg: .asciiz " = "

.text     # here we write the instructions

.globl  main
main:

la $a0, inputMsg
li $v0, 4
syscall

li $v0, 5		# Take input from user
syscall

move $t0, $v0

la $a0, factMsg
li $v0, 4
syscall

addi $a0, $t0, 0
li $v0, 1
syscall

la $a0, equalMsg
li $v0, 4
syscall

move $a0, $t0		# prepare the function parameters

jal fact		# call the function

move $a0, $v0
li $v0, 1
syscall

li $v0, 10
syscall

# Factorial Function

fact:

li $t0, 1		# $t0 = result
move $t1,$a0 		# $t1 = i && set i to n

loop:

blez $t1,exit		# exit if $t1 <= 0
mul $t0,$t0,$t1		# result = result * i
subi $t1, $t1, 1 	# i--

j loop

exit:
move $v0,$t0		# return result

jr $ra			# return to caller

.end main
