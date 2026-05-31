#include <stdio.h>

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <errno.h>
extern size_t ft_strlen(const char *str);
extern char *ft_strcpy(char *dest, const char *src);
extern size_t ft_write(int fd, const void *buf, size_t size);
extern size_t ft_read(int fd, const void *buf, size_t count);

int main() {

    // char *msg = "hello world\n";
    char buf[100];
    // int size = ft_strlen(msg);
    // ft_write(1, msg, size);
    int fd = open("test.txt", O_RDONLY);
    ft_read(fd, buf,8);
    buf[8] = '\0';
    printf("buf %s\n", buf);
    return 0;
}




