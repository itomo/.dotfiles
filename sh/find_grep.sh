#!/bin/sh
WORD=$1
TYPE=$2
echo "Run the following command:"
echo "find . -name \"*.${TYPE}\" | xargs grep -n \`echo \"${WORD}\" | nkf -e \` | nkf -w | grep \"${WORD}\""
echo ""
find . -name "*.${TYPE}" | xargs grep -n `echo "${WORD}" | nkf -e ` | nkf -w | grep "${WORD}"
