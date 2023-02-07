name=$1

nasm -f elf32 -o $name.o $name.asm
ld -m elf_i386 -o $name $name.o
./$name