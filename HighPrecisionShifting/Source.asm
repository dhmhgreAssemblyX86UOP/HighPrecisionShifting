TITLE Double Precision Shifting
INCLUDE Irvine32.inc

SHIFTS = 4

.data
comma BYTE ',',0
array DWORD 648B2165h,8C943A29h,6DFA4B86h,91F76C04h,8BAF9857h
ARRAYLENGTH = ($-array)/TYPE array

.code
message PROC
	pushad
	mov ecx,ARRAYLENGTH
	mov esi,OFFSET array
LB:
	mov eax, [esi]
	call WriteHex
	mov edx,OFFSET comma
	call WriteString
	add esi,4
	LOOP LB
	call Crlf
	call Crlf
	popad
	ret
message ENDP

main PROC
	mov esi, OFFSET array
	mov ecx, ARRAYLENGTH-1
	call message
	LOOP1:
	mov eax, [esi+TYPE array]
	SHRD DWORD PTR [esi],eax,SHIFTS
	call message
	add ESI,TYPE DWORD
	LOOP LOOP1
	SHR DWORD PTR [ESI], SHIFTS
	call message

	exit
main ENDP
END main