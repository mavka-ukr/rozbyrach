#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string>
#include <cstring>

extern "C" size_t read_file(char *path, size_t path_size, char **out) {
    char *cpath = strdup(std::string(path, path_size).c_str());
    FILE *file = fopen(cpath, "rb");
    free(cpath);
    fseek(file, 0, SEEK_END);
    long file_size = ftell(file);
    fseek(file, 0, SEEK_SET);
    char *value = (char *) malloc(file_size);
    fread(value, file_size, 1, file);
    fclose(file);
    *out = value;
    return file_size;
}

extern "C" void println_long(long value) {
    printf("%ld\n", value);
}