.data     # here we declare variables  
	
g: .word 9

h: .word 5

.text     # here we write the instructions
.globl  main
main:

lw $s0, g		# Load Value of g into $S0
lw $s1, h		# Load Value of h into $S1

la $s2, g		# Load address of g into $S2
la $s3, h		# Load address of h into $S3

li $v0, 10

bge $s0, $s1, add
addi $s0, $s0, -1
sw $s0, ($s2)
syscall

add:
addi $s0, $s0, 1
sw $s0, ($s2)
syscall

li $v0, 10
syscall

.end main
