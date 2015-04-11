// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
//@SCREEN
//D=M
//@i
//M=D //set i = @SCREEN start
//@256
//D=A
//@row
//M=D //init row to 256

// Initialize pointer to @SCREEN
    @SCREEN
    D=A
    @pointer
    M=D
	@24576
	D=A
	@kbd
	M=D //writing address to kbd
	
(LOOP)
	
	
	//now we need to figure out if the kbd is pressed or not
	@kbd
	A=M
	D=M
	

	
	@PRESSED  //if kbd > 0 then goto PRESSED
	D;JGT
	@NOTPRESSED  //if kbd = 0 then goto NOTPRESSED
	D;JEQ
	
	(PRESSED)
	@pointer
	A=M
	M=-1
	@INCREMENT
	0;JMP
	
	(NOTPRESSED)
	@pointer
	A=M
	M=0
	@INCREMENT
	0;JMP
	
	(INCREMENT)
	//increment pointer
	@pointer
	D=M
	@pointer
	M=D+1
	
	@LOOP
	0;JMP //goto LOOP
(END)

	
//(LOOP)
//    @row
//	D=M
//	
//	D=D-1 
//	@END
//	D;JEQ //if row = 0 then we're done
//	@i
//	M=-1 //set screen to black
//	
 //   @i //decrement i
	M=M-1
//	@LOOP
//	0;JMP //goto LOOP
//(END)
//    @END
//	0;JMP //infinite loop