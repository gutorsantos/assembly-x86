name=$1

nasm -f elf64 -o $name.o $name.asm
ld -o $name $name.o
./$name