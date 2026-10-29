# Libasm — NASM

A small x86-64 assembly library implementing familiar C string and I/O functions, with a C demonstration and assertion-based test program. The function set follows the 42 Libasm exercise.

## Functions

| Function | Purpose |
| --- | --- |
| `ft_strlen` | Measure string length |
| `ft_strcpy` | Copy a null-terminated string |
| `ft_strcmp` | Compare strings |
| `ft_strdup` | Allocate and copy a string |
| `ft_read` | Wrap the Linux read system call |
| `ft_write` | Wrap the Linux write system call |

## Requirements

**Linux on x86-64**, NASM, GCC, Make, and `ar`. The [makefile](makefile) assembles ELF64 objects, and the syscall wrappers reference glibc's `__errno_location`. These sources are not directly portable to macOS or other CPU architectures.

## Build and usage

From the repository root:

```sh
make         # libasm.a
make test    # build test_libasm
./test_libasm
```

`make test` compiles the test executable; running it is a separate step. The [test program](main.c) compares string results with libc, writes a message, and reads the first eight bytes of [test.txt](test.txt). Run it from the root so that file can be opened. It prints `OK` after reaching the end of the assertions.

The current assembly objects do not declare a `.note.GNU-stack` section, so recent GNU linkers may emit an executable-stack warning during linking.

## Linking from C

Declare the needed functions with their C prototypes, then link your own program against `libasm.a`:

```sh
gcc your_program.c -L. -lasm -o your_program
```

`make clean`, `make fclean`, and `make re` manage build artifacts.

## Concepts practiced

Registers, the System V AMD64 calling convention, C/assembly interoperability, Linux syscalls, error reporting, memory allocation, and static libraries.
