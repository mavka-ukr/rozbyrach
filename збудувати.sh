#!/usr/bin/env sh
set -e
set -x

ціль розбирач.ll скомпілювати розбирач.ц
ціль тестувальник.ll скомпілювати тестувальник.ц
clang++ -fsanitize=address,undefined,leak -o тестувальник тестувальник.ll розбирач.ll тестувальник.cpp
