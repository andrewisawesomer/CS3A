//test cases| remove this and lines 181 - 215
@R0
D=M
@GetDigits_binNum
M=D
@R1
@R2
@R3
@R4
@R5
@R6
//End test cases 1


//func GetDigits
//isolates the digits from decimal number
//input:
//GetDigits_binNum (int) decimal number
//output:
//num1, num2, num3, num4, num5 (int) left to right digits
//GetDigits_sign (bool) 0 is positive, 1 is negative
//return:
//GetDigits_return, the return address
(GetDigits_GetDigits)

//check special case of -32768
@GetDigits_binNum
D=M
@32767
D=D+A
D=D+1
@GetDigits_SpecialCase
D;JEQ
//else continue with code

//check the sign
@GetDigits_binNum
D=M
@GetDigits_PosSign
D;JGE
@GetDigits_sign
M=1
//if neg must negate the num
@GetDigits_binNum
M=!M
M=M+1
@GetDigits_EndSign
0;JMP
(GetDigits_PosSign)
@GetDigits_sign
M=0
(GetDigits_EndSign)

//determine the digits
@GetDigits_binNum
D=M
//fill out div inputs for num1
@Div_dividend 
M=D
@10000
D=A
@Div_divisor
M=D
//save return address
@GetDigits_DivReturn10000
D=A
@Div_return
M=D
@Div_Div
0;JMP
(GetDigits_DivReturn10000)
//save num1
@Div_quotient
D=M
@GetDigits_num1
M=D
@Div_remainder
D=M

//fill out div inputs for num2
@Div_dividend 
M=D
@1000
D=A
@Div_divisor
M=D
//save return address
@GetDigits_DivReturn1000
D=A
@Div_return
M=D
@Div_Div
0;JMP
(GetDigits_DivReturn1000)
//save num2
@Div_quotient
D=M
@GetDigits_num2
M=D
@Div_remainder
D=M	

//fill out div inputs for num3
@Div_dividend 
M=D
@100
D=A
@Div_divisor
M=D
//save return address
@GetDigits_DivReturn100
D=A
@Div_return
M=D
@Div_Div
0;JMP
(GetDigits_DivReturn100)
//save num3
@Div_quotient
D=M
@GetDigits_num3
M=D
@Div_remainder
D=M

//fill out div inputs for num4
@Div_dividend 
M=D
@10
D=A
@Div_divisor
M=D
//save return address
@GetDigits_DivReturn10
D=A
@Div_return
M=D
@Div_Div
0;JMP
(GetDigits_DivReturn10)
//save num4
@Div_quotient
D=M
@GetDigits_num4
M=D
@Div_remainder
D=M
@GetDigits_num5
M=D



@GetDigits_EndSpecialCase
0;JMP
//deal with special case of -32768
(GetDigits_SpecialCase) 
	@GetDigits_sign
	M=1
	@3
	D=A
	@GetDigits_num1
	M=D
	@2
	D=A
	@GetDigits_num2
	M=D
	@7
	D=A
	@GetDigits_num3
	M=D
	@6
	D=A
	@GetDigits_num4
	M=D
	@8
	D=A
	@GetDigits_num5
	M=D
(GetDigits_EndSpecialCase)

//test cases | remove this
@GetDigits_num1
D=M
@R1
M=D

@GetDigits_num2
D=M
@R2
M=D

@GetDigits_num3
D=M
@R3
M=D

@GetDigits_num4
D=M
@R4
M=D

@GetDigits_num5
D=M
@R5
M=D

@GetDigits_sign
D=M
@R6
M=D

(GetDigits_testDone)
@GetDigits_testDone
0;JMP
//Done test case

@GetDigits_return
0;JMP




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