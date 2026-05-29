#include <stdio.h>

extern size_t ft_strlen(const char *str);
extern char *ft_strcpy(char *dest, const char *src);

int main() {
    char test_string[] = "Hello from assembly!";
    char copy[50];
    ft_strcpy(copy, test_string);
    printf("copied string %s\n", copy);
    size_t length = ft_strlen(test_string);
    printf("String: \"%s\"\n", test_string);
    printf("Length calculated by Assembly: %zu\n", length);
    
    return 0;
}

