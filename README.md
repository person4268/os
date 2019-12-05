# os
Nothing more than a little toy os to learn about low level stuff. Partially based off of https://ordoflammae.github.io/littleosbook

# Compiling
Run `make iso`. `gcc`, `nasm`, and `make` are required to compile

# Running
Run `make qemu` to start qemu. If you want to use gdb, use `make qemuwait`. Qemu will wait for gdb to connect to start executing. To start gdb, type `make gdb` in another terminal. It will automatically attach and set a breakpoint for the start of the kernel. 
