NAME		= libasm
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
NASM		= nasm -f elf64
ASM_SRCS	= $(wildcard *.s)
C_SRCS		= main.c

OBJ      = $(ASM_SRCS:.s=.o) $(C_SRCS:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(NAME)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.s
	$(NASM) $< -o $@

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re