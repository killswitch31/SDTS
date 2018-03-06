1. The shellcode used is an execv(/bin/sh) shellcode.
2. The shellcode is encrypted using XOR based one time pad encryption with key as unique cpuid information.
3. The shellcode is hard coded in the enryptor.asm
3. The output of the encryptor.asm is in the encrypted.txt file. 
4. Modify the decryptor.asm using the data in the ecrypted.asm.
5. Null bytes have been removed the decrypto.asm
6. Grab the opcode from the compiled decryptor.asm and put it in the shell_spawn.c
7. Compile shell_spawn.c with executable stack and rmove stack canaries.
