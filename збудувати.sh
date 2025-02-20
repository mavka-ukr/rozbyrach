#!/usr/bin/env sh
set -e
set -x

ціль розбирач.ll скомпілювати розбирач.ц
clang++ -o розбирач розбирач.ll розбирач.cpp
#clang++ -fsanitize=address,undefined,leak -o розбирач розбирач.ll розбирач.cpp