// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

	//@4
	//D=A
	//@0
	//M=D //set R0 to 5
	//@2
	//D=A
	//@1
	//M=D  //set R1 to 10
	//@i
	//M=D+1  //set i = R1+1
	@2
	M=0 //init product to 0
	
	@1
	D=M
	@i
	M=D+1 //set i = R1+1
	
	
(LOOP)
    @i
	D=M
	
	D=D-1 
	@END
	D;JEQ //if i = 0 then we're done
	@0
	D=M //set D to memory location of R0
	@2
	M=D+M //R2 = R2 + R0
    @i //decrement i
	M=M-1
	@LOOP
	0;JMP //goto LOOP
(END)
    @END
	0;JMP //infinite loop
	