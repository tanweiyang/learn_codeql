#!/bin/sh

#QUERY_FILE='/mnt/dropbox/asafall/tools/codeql-home/codeql-repo/cpp/ql/src/Likely\ Bugs/Memory\ Management/StackAddressEscapes.ql'
QUERY_FILE='./codeql-repo/cpp/ql/src/Likely Bugs/Memory Management/StackAddressEscapes.ql'
CODEQL_REPO_CPP_SRC=./codeql-repo/cpp/ql/src/

mkdir -p output/fish-shell
codeql database analyze database/fish-shell "${QUERY_FILE}" --format=csv --output=output/fish-shell/result.csv --threads=2 --search-path=${CODEQL_REPO_CPP_SRC}

