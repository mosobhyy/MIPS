.data     # here we declare variables  
	
c: .word 1, 2, 3, 4, 5
a: .word 5
.text     # here we write the instructions
.globl  main
main:

la $s3, c
lw $s0, a
li $s1, 0			# $s1 = i

li $v0, 1

outerLoop:

li $s2, 0
addi $s2, $s1, 0		# $s2 = j && j = i

innerLoop:

lw $t0, ($s3)
mul $t0, $t0, $s2		# C[i] *= j;
sw $t0, ($s3)

subi $s2, $s2, 1		# j--

bge $s2, $zero, innerLoop

la $t0, 4($s3)			# pointer to the next index
la $s3, ($t0)

addi $s1, $s1, 1		# i++

blt $s1, $s0, outerLoop

#----------------------------------------

la $s0, c

li $s1, 0

lw $s2, a

Print:

lw $a0, ($s0)
syscall

la $t0, 4($s0)
la $s0, ($t0)

addi $s1, $s1, 1

bne $s1, $s2, Print

li $v0, 10
syscall

.end main
