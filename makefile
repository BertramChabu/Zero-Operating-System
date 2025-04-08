all: kernel.bin

boot.bin: boot.asm
    nasm -f bin boot.asm -o boot.bin

kernel.bin: kernel.c linker.ld
    i686-elf-gcc -ffreestanding -c kernel.c -o kernel.o
    i686-elf-ld -T linker.ld -o kernel.bin kernel.o

run: kernel.bin
    qemu-system-i386 -kernel kernel.bin

clean:
    rm -f *.o *.bin
