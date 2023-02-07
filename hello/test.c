#include <stdio.h>

int main() {
    char str[100];

    scanf("%s", str);
    for(int i = 0; i < 20; i++) {
        printf("%d\n", str[i]);
    }

    return 0;
}