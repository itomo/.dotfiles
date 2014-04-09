#!/bin/sh
WORD=$1
TYPE=$2
# 引数チェック
if [ $# -ne 2 ]; then
    echo "Usage: sh find_grep.sh <serch_word> <file_type>";
    exit 1;
fi
echo "Run the following command:"
echo "find . -name \"*.${TYPE}\" | xargs grep -n \`echo \"${WORD}\" | nkf -e \` | nkf -w | grep \"${WORD}\""
echo ""
find . -name "*.${TYPE}" | xargs grep -n `echo "${WORD}" | nkf -e ` | nkf -w | grep "${WORD}"
