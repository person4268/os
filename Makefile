#Temporary comment for test commit
ASMC=nasm
ASMCFLAGS=-f elf32 -g -F dwarf

LD=ld
LDFLAGS=-T linker.ld -melf_i386 -g

CC=gcc
CCFLAGS=-m32 -nostdlib -nostdinc -fno-builtin -fno-stack-protector -nostartfiles -nodefaultlibs -Wall -Wextra -Werror -c -gdwarf

BUILDDIR=build/
SRCDIR=src/

QEMU=qemu-system-i386
QEMUARGS=-cdrom os.iso

GDB=gdb
GDBARGS=--command=gdbinit.txt

KSOURCES=entry.o main.o framebuffer.o io.o string.o


#END CONFIGURATION

KERNELSOURCES=$(addprefix $(BUILDDIR), $(KSOURCES))

all: build/kernel.elf iso
.PHONY: iso qemu gdb qemuwait

qemu:
	$(QEMU) $(QEMUARGS)

qemuwait:
	$(QEMU) $(QEMUARGS) -S -gdb tcp::1234 

gdb:
	$(GDB) $(GDBARGS)

clean:
	rm build/*

build/kernel.elf: $(KERNELSOURCES)
	$(LD) $(LDFLAGS) $(KERNELSOURCES) -o $(BUILDDIR)kernel.elf

iso:
	cp build/kernel.elf iso/boot/kernel.elf
	grub-mkrescue iso -o os.iso

$(BUILDDIR)%.o: $(SRCDIR)%.s
	$(ASMC) $(ASMCFLAGS) $^ -o $@

$(BUILDDIR)%.o: $(SRCDIR)%.c
	$(CC) $(CCFLAGS) $^ -o $@
