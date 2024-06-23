; Chapter 6 Main Program
; Date: 4/9/2024

; A program that randomly chooses three different colors for displaying 20 lines of text on the screen. 
; The probabilities for each color are: white +30%, blue+10%, and green=60%.


INCLUDE Irvine32.inc

.data
messagePrompt BYTE "Hello World. This is a test. Have a good day.",0

.code
main PROC

	mov edx, OFFSET messagePrompt
	call Randomize		;seeds the random number generator with a unique value
	mov ecx, 20			;counter (set to 20)

;loop through displaying text with randomized colors
L1:
	call colorGen		;calls colorGen procedure
	call SetTextColor	;set text color
	call WriteString	;display message in console
	call Crlf			;newline in console
	loop L1				;loop l1

	call WaitMsg
	exit

main ENDP

; Random color generator procedure
colorGen PROC

	mov eax, 10			;random number range
	call RandomRange	;generates random number within set range (10)

	.IF eax >= 4
		mov eax, green	;if number >= 4, set text to green
	.ELSEIF eax == 3
		mov eax, blue	;if number == 3, set text to blue
	.ELSEIF eax <= 2
		mov eax, white	;if numbers <= 2, set text to white
	.ENDIF

	ret

colorGen ENDP
END main
