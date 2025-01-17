void kmain(void)
{
    const char *str = "Hello. We have been trying to reach you concerning your cars extended warranty";
    char *vidptr = (char *)0xB8000; //video mem start address
    unsigned int i = 0;
    unsigned int j = 0;

    //clear screen, 25 lines, 80 columns, every element is two bytes
    while(j < 25 * 80 * 2) {
        vidptr[j] = ' '; //blank char
        vidptr[j + 1] = 0x07;
        j = j+2;
    }

    j = 0;

    //write string to vmem
    while(str[j] != '\0') {
        vidptr[i] = str[j];
        //color the char
        vidptr[i + 1] = 0x07; //first 4 bits bg col, last 4 bits fg col
        ++j;
        i = i+2;
    }
}
