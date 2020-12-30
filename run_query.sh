#!/bin/sh

CODEQL_REPO_CPP_SRC=./codeql-repo/cpp/ql/src/

codeql query run -d=./database/fish-shell ./my_tutorial.ql --search-path=${CODEQL_REPO_CPP_SRC}
