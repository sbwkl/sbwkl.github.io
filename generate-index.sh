#!/bin/bash

echo_filename() {
    for filename in `ls -t $1/`; do
    # for filename in "$1"/*; do
        filepath=$1"/"$filename
        if [ -d "$filepath" ]; then
            echo_filename $filepath
        elif [ -f "$filepath" ]; then
            if [[ "$filepath" == *.md ]]; then
                gen_index_entry $filepath
            fi
        fi
    done
}

gen_index_entry() {
    filename=$1
    name=$(basename $filename)
    line1=$(head -n 1 $filename)
    title=${line1:2}
    echo "[""$title""](""$filename"")" >> "$index_file"
    echo "" >> "$index_file"
}

path=""
if [ -d "$1" ]; then
    path=$1;
else
    path="post"
fi

if ! [ -d "$path" ]; then
    echo "$path" "is not dir."
    exit 1
fi

# index_file="$path""/index.md"
index_file="./index.md"

if ! [ -f "$index_file" ]; then
    echo "$index_file"
    touch "$index_file"
else
    > "$index_file"
fi

echo_filename $path

echo "generate index.md finish."