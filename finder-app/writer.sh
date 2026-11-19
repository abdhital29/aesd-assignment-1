#!/bin/sh

if [ $# -lt 2 ]; then
    echo "Invalid/missing arguments"
    echo "Usage: $0 [file path] [text to write]"
    exit 1
fi

WRITEFILE=$1
WRITESTR=$2

mkdir -p "$(dirname $WRITEFILE)"

echo $WRITESTR > $WRITEFILE
CREATED=$?

if [ ! $CREATED -eq 0 ]; then
    echo "Could not write $WRITESTR to file at $WRITEFILE"
    exit 1
fi
