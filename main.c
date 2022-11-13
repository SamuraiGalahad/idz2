#include <stdio.h>
#include <termios.h>
#include <unistd.h>

int mygetch( ) {
    struct termios oldt,
    newt;
    int ch;
    tcgetattr( STDIN_FILENO, &oldt );
    newt = oldt;
    newt.c_lflag &= ~( ICANON | ECHO );
    tcsetattr( STDIN_FILENO, TCSANOW, &newt );
    ch = getchar();
    tcsetattr( STDIN_FILENO, TCSANOW, &oldt );
    return ch;
}

char* get_string(char* str) {
    int i = 0;
    int ch;
        do {
            ch = mygetch();
            // printf("%c: %d\n", (char)ch, ch); // test out
            putc(ch, stdout);    // echo out
            str[i++] = ch;
        } while(ch != 4);   // break then Ctrl+D
    str[i] = '\0';
    return &str[i+1]; // Первый свободный байт
}

void get_chars(char* str) {
    int i = 0;
    char min;
    int min_int = 130;
    char max;
    int max_int = -1;
    int code;
    while (str[i] != '\0') {
        code = (int)str[i];
        if (code < min_int && code != 4) {
            min = str[i];
            min_int = code;
        }
        if (code > max_int && code != 4) {
            max = str[i];
            max_int = code;
        }
        i++;
    }
    printf("\nmax: %c\n", max);
    printf("\nmin: %c\n", min);
}

int main() {
    char str[10000];
    char* str1 = str;
    puts("\nstr1? ");
    get_string(str1);
    get_chars(str1);
    return 0;
}