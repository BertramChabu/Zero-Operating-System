#include<stddef.h>
#include<stdint.h>


volatile uint16_t* video_memory = (uint16_t*)0xb8000;


void main(void){
    const char* msg = "Hello, World";
    for (size_t i = 0; msg[i]!= '\0'; i++){
        video_memory[i] = (uint16_t)msg[i]| (0x07 << 8);
    }
    while (1) {}
}
