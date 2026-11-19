#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Invalid/missing arguments"
    echo "Usage: $0 [directory-to-search] [string to search]"
    exit 1
fi

FILESDIR=$1
SEARCHSTR=$2

if [ ! -d ${FILESDIR} ]; then
    echo "${FILESDIR} does not exist"
    exit 1
fi

MATCH_COUNT=0
FILE_COUNT=0
for FILE in "${FILESDIR}"/*; do
    MATCH_COUNT=$((MATCH_COUNT + $(grep -c "${SEARCHSTR}" "${FILE}")))
    FILE_COUNT=$((FILE_COUNT + 1))
done

echo "The number of files are $FILE_COUNT and the number of matching lines are $MATCH_COUNT"
