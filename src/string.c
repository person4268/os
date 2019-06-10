#include "string.h"

unsigned int strlen(char* buf) {
    unsigned int i = 0;
    while(buf[i++]);
    return i-1;
}