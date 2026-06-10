NAME        = libasm.a
TEST_NAME   = test_libasm

CC          = gcc
CFLAGS      = -Wall -Wextra -Werror -fPIE

NASM        = nasm -f elf64
AR          = ar rcs

ASM_SRCS    = ft_strlen.s \
              ft_strcpy.s \
              ft_strcmp.s \
              ft_write.s \
              ft_read.s \
              ft_strdup.s

OBJ         = $(ASM_SRCS:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(NAME) $(OBJ)

%.o: %.s
	$(NASM) $< -o $@

test: $(NAME)
	$(CC) $(CFLAGS) main.c -L. -lasm -o $(TEST_NAME)

clean:
	rm -f $(OBJ) main.o

fclean: clean
	rm -f $(NAME) $(TEST_NAME) test_output.txt

re: fclean all

.PHONY: all clean fclean re test