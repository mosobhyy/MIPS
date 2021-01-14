.data     # here we declare variables  
	
arrSize: .word 6
arrData: .word 'a', 'b', 'c', 'd', 'e', 'f'


.text     # here we write the instructions
.globl  main
main:

la $s0, arrData		# Load address of first element of arrData into $S0
la $s1, arrData
addi $s1, $s1, 20	# Load address of last element of arrData into $S1


lw $s2 arrSize
div $s2, $s2, 2

Loop:

lw $t0, ($s0)
lw $t1, ($s1)
sw $t0, ($s1)
sw $t1, ($s0)

la $t0, 4($s0)
la $s0, ($t0)
la $t0, -4($s1)
la $s1, ($t0)

sub $s2, $s2, 1

bne $s2, $zero, Loop

la $s0, arrData		# Load address of first element of arrData into $S0

lw $s2 arrSize

li $s1 0

li $v0, 4

Print:

la $a0, ($s0)
syscall

la $t0, 4($s0)
la $s0, ($t0)

addi $s1, $s1, 1

bne $s1, $s2, Print

li $v0, 10
syscall

.end main
