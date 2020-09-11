#!/bin/bash

echo_filename() {
    for filename in "$1"/*; do
        if [ -d "$filename" ]; then
            echo_filename "$filename"
        elif [ -f "$filename" ]; then
            name=$(basename $filename)
            echo "[""$name""](""$filename"")" >> "$index_file"
        fi
    done
}

path=""
if [ -d "$1" ]; then
    path=$1;
else
    path="post/discrete-mathematics-and-its-applications"
fi

if ! [ -d "$path" ]; then
    echo "$path" "is not dir."
    exit 1
fi

index_file="$path""/index.md"

if ! [ -f "$index_file" ]; then
    echo "$index_file"
    touch "$index_file"
else
    echo "" > "$index_file"
fi

echo_filename $path

echo "generate index.md finish."