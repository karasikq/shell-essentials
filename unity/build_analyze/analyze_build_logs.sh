#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Usage: $0 <logs_directory_path>"
    exit 1
fi

find "$1" -type f -name "*.txt" | while read -r file; do
    filename=$(basename "$file" .txt)
    dir=$(dirname "$file")
    sorted_dir="$dir/${filename}-sorted"
    if [ ! -d "$sorted_dir" ]; then
        mkdir "$sorted_dir"
    fi
    grep -E '\.(png|psd|jpg)$' "$file" | uniq > "$sorted_dir/images.txt"
    grep -E '\.(fbx|obj)$' "$file" | uniq > "$sorted_dir/models.txt"
    grep -E '\.(prefab)$' "$file" | uniq > "$sorted_dir/prefabs.txt"
done
