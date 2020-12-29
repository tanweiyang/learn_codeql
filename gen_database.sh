#!/bin/sh

mkdir -p database
codeql database create ./database/fish-shell --language=cpp --source-root fish-shell --command make
