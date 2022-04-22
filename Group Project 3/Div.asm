//func Div(Div_dividend, Div_divisor)
//Input:
//Div_dividend (int)
//Div_divisor (int)
//Output:
//Div_quotient (int)
//Div_remainder (int)
//Return:
//Div_return
(Div_Div)

//negate quotient?
@Div_negQuotient
M=0
@Div_quotient
M=0
@Div_remainder
M=0
//@R0
//D=M
//@Div_dividend
//M=D
//@R1
//D=M
//@Div_divisor
//M=D

//check divide by 0
@Div_divisor
D=M
@Div_DivByZero
D;JEQ


	
//check 0/x
//if (Div_divisor == 0)
@Div_dividend
D=M
@Div_DivStart
D;JNE
@Div_quotient
M=0;
@Div_End
0;JMP

(Div_DivStart)
	
	//check positivity of Div_dividend/Div_divisor
	@Div_dividend
	D=M
	@Div_NegCheck
	D;JLT
	@Div_divisor
	D=M
	@Div_Case_PN
	D;JLT
	@Div_Case_PP
	0;JMP
	
	//if Div_dividend is negative
	(Div_NegCheck)
		@Div_divisor
		D=M
		@Div_Case_NP
		D;JGE
		@Div_Case_NN
		0;JMP
	
	(Div_Case_PP)
		@Div_Algorithm1
		0;JMP
	(Div_Case_PN)
		@Div_divisor
		M=!M
		M=M+1
		@Div_negQuotient
		M=1
		@Div_Algorithm1
		0;JMP
	(Div_Case_NP)
		@Div_negQuotient
		M=1
		@Div_Algorithm2
		0;JMP
	(Div_Case_NN) 
		@Div_divisor
		M=!M
		M=M+1
		@Div_Algorithm2
		0;JMP
(Div_Algorithm1)
	@Div_quotient
	M=0
	@Div_dividend
	D=M
	@Div_remainder
	M=D
	//do while Div_remainder > 0
	(Div_Algorithm1_Loop)
		@Div_divisor
		D=M
		@Div_remainder
		M=M-D
		@Div_quotient
		M=M+1
		@Div_remainder
		D=M
		@Div_Algorithm1_Loop
		D;JGT
	//if Div_remainder<0 
	@Div_remainder
	D=M
	@Div_End
	D;JGE
	@Div_divisor
	D=M
	@Div_remainder
	M=D+M
	@Div_quotient
	M=M-1
	@Div_End	
	0;JMP	
		
(Div_Algorithm2)
	@Div_quotient
	M=0
	@Div_dividend
	D=M
	@Div_remainder
	M=D
	//do while Div_remainder>0
	(Div_Algorithm2_Loop)
		@Div_divisor
		D=M
		@Div_remainder
		M=M+D
		@Div_quotient
		M=M+1
		@Div_remainder
		D=M
		@Div_Algorithm2_Loop
		D;JLT
	@Div_End
	0;JMP
	
(Div_DivByZero)
	@Div_quotient
	M=0
	@Div_remainder
	M=-1
	@Div_dividend
	D=M
	@Div_End
	D;JNE
	@Div_remainder
	M=M-1
	@Div_End
	0;JMP	
	
(Div_End)
	//negate quotient?
	@Div_negQuotient
	D=M
	@Div_Fill	
	D;JEQ
	@Div_quotient
	M=!M
	M=M+1
	@Div_Fill	
	0;JMP
	
	(Div_Fill)
	//fill out return values
	//@Div_quotient
	//D=M
	//@R2
	//M=D
	//@Div_remainder	
	//D=M
	//@R3
	//M=D
	
//(Div_return)
@Div_return
A=M
0;JMP