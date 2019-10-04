# os
Nothing more than a little toy os to learn about low level stuff. Partially based off of https://ordoflammae.github.io/littleosbook

# Compiling
Run `make iso`. It will require gcc and nasm, and grub to compile.

# Running
Run `make qemu` to start qemu. If you want to wait for gdb to connect, use `make qemuwait`. To start gdb, type `make gdb`. It will automatically attach and set a breakpoint for the start of the kernel. 
