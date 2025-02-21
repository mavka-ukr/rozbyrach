#!/usr/bin/env sh
set -e
set -x

ціль розбирач.ll скомпілювати розбирач.ц
ціль старт.ll скомпілювати старт.ц
clang++ -o старт старт.ll розбирач.ll розбирач.cpp
#clang++ -fsanitize=address,undefined,leak -o старт старт.ll розбирач.ll розбирач.cpp
