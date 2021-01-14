.data     # here we declare variables  

word: .word 'w', 'o', 'w'
size: .word 3

pal: .asciiz "Palindrome !"
notPal: .asciiz "Not Palindrome !"

.text     # here we write the instructions

.globl  main
main:

li $a0, 1		# flag true for palindrom

lw $s0, size
div $s0, $s0, 2		# $s0 = Length of word / 2

la $s1, word		# $s1 Point to first char
la $s2, word
la $s2, 8($s2)		# $s2 Point to last char

li $s3, 0		# $s3 = i

loop:

beq $s3, $s0, Exit

addi $s3, $s3, 1

lw $t1, ($s1)		# $t1 = value of index from forward
lw $t2, ($s2)		# $t2 = value of index from backward

beq $t1, $t2, continue
li $a0, 0		# flag false for palindrom
addi $s3, $s0, 0	# make $s3 = $s0 to break

continue:

j loop

Exit:

bgtz $a0, printPal	# if $a0 > 0 then goto printPal

printNotPal:

la $a0, notPal		# Print Not Palindrome
li $v0, 4
syscall
li $v0, 10
syscall

printPal:
la $a0, pal		# Print Palindrome
li $v0, 4
syscall
li $v0, 10
syscall

.end main
