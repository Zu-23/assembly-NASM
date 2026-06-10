#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <errno.h>
#include <assert.h>
#include <fcntl.h>

extern size_t ft_strlen(const char *s);
extern char *ft_strcpy(char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fd, const void *buf, size_t count);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern char *ft_strdup(const char *s);

int sign(int n)
{
    return (n > 0) - (n < 0);
}

int main()
{
    // 1. ft_strlen
    assert(ft_strlen("Hello") == strlen("Hello"));
    assert(ft_strlen("") == strlen(""));

    // // 2. ft_strcpy
    char dest1[50] = {0}, dest2[50] = {0};
    assert(ft_strcpy(dest1, "42 Network") == dest1);
    strcpy(dest2, "42 Network");
    assert(strcmp(dest1, dest2) == 0);

    // 3. ft_strcmp
    assert(sign(ft_strcmp("abc", "abc")) == sign(strcmp("abc", "abc")));
    assert(sign(ft_strcmp("abc", "ab")) == sign(strcmp("abc", "ab")));
    assert(sign(ft_strcmp("ab", "abc")) == sign(strcmp("ab", "abc")));
    // 4. ft_strdup
    char *dup = ft_strdup("Dynamic Memory");
    assert(strcmp(dup, "Dynamic Memory") == 0);
    free(dup);
    // 5. ft_write
    char *test = "hello world\n";
    int size = ft_strlen(test);
    ft_write(1, test, size);

    //6. ft_read
    int fd = open("test.txt", O_RDONLY);
    int ret;
    char buf[50] = {0};
    assert(fd >= 0);
    ret = ft_read(fd, buf, 8);
    assert(ret == 8); 
    assert(strncmp(buf, "Hello 42", 8) == 0); 
    close(fd);

    printf("OK\n");

    return 0;
}