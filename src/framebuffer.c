#include "framebuffer.h"
#include "io.h"
char* fb_pointer = (char*)0xB8000;

#define FB_COMMAND_PORT  0x3D4
#define FB_DATA_PORT     0x3D5

#define FB_HIGH_BYTE_CMD 14
#define FB_LOW_BYTE_CMD  15

unsigned char fb_currentFg = FB_LIGHTGREY;
unsigned char fb_currentBg = FB_BLACK;

void fb_write_cell(unsigned int pos, char c, unsigned char fg, unsigned char bg) {
    fb_pointer[pos*2] = c;
    fb_pointer[pos*2+1] = ((bg & 0x0F) << 4) | (fg & 0x0F);
}

void fb_move_cursor(unsigned short pos) {
    outb(FB_COMMAND_PORT, FB_HIGH_BYTE_CMD);
    outb(FB_DATA_PORT, ((pos >> 8) & 0x00FF));
    outb(FB_COMMAND_PORT, FB_LOW_BYTE_CMD);
    outb(FB_DATA_PORT, pos & 0x00FF);
}

void fb_write(char* buf, unsigned int len) {
    for(unsigned int i = 0; i<len; i++) {
        fb_write_cell(i, buf[i], fb_currentFg, fb_currentBg);
        fb_move_cursor(i);
    }
}

void fb_setFg(unsigned char fg) {
    fb_currentFg = fg;
} 

void fb_setBg(unsigned char bg) {
    fb_currentBg = bg;
}