GCC=/usr/opt/cross/bin/i686-elf-gcc#cross compiler built as detailed in https://www.youtube.com/watch?v=zBorEnGhPv8 by OliveStem
CFLAGS=-m32 -fno-builtin#compilation flags
ASM=nasm#assembler

SRC_DIR = src
BUILD_DIR = build

#link together
$(BUILD_DIR)/main-1: $(BUILD_DIR)/boot.o $(BUILD_DIR)/kernel.o
	ld -m elf_i386 -T $(SRC_DIR)/link.ld -o $(BUILD_DIR)/main-1 $(BUILD_DIR)/boot.o $(BUILD_DIR)/kernel.o

#assemble bootloader
$(BUILD_DIR)/boot.o: $(SRC_DIR)/boot.asm
	$(ASM) -felf32 $(SRC_DIR)/boot.asm -o $(BUILD_DIR)/boot.o

#compile kernel
$(BUILD_DIR)/kernel.o: $(SRC_DIR)/kernel.c
	$(GCC) -c $(SRC_DIR)/kernel.c -o $(BUILD_DIR)/kernel.o $(CFLAGS)


