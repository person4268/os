#include "framebuffer.h"
#include "string.h"
void kmain() {
    char* str = "Hello World!";
    fb_setFg(FB_WHITE);
    fb_setBg(FB_MAGENTA);
    fb_write(str, strlen(str));
}