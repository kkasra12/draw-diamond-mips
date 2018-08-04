#t0 space counter
#t1 star counter
#t2 space step
#t3 star step
#a1 n
.data
space: .asciiz " "
star: .asciiz "*"
newLine: .asciiz "\n"
.text   
main:
li $a1,3
or $t0,$a1,$zero
li $t1,1
li $t2,-1
li $t3,2

mainloop:
#disp "\n"
la $a0,newLine
li $v0,4
syscall

or $t4,$t0,$zero
spaceloop:
#disp " "
la $a0,space
li $v0,4
syscall
sub $t4,$t4,1
bne $t4,$zero,spaceloop
or $t4,$t1,$zero
starloop:
#disp "*"
la $a0,star
li $v0,4
syscall
sub $t4,$t4,1
bne $t4,$zero,starloop
add $t0,$t0,$t2
add $t1,$t1,$t3
beq $t1,-1,exit
bne $t0,1,mainloop
li $t2,1
li $t3,-2
beq $t1,1,exit
j mainloop
exit:
