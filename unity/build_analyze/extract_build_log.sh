#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 file1 file2 ..."
    exit 1
fi

source ./settings.sh

log_dir="$LOGS_DIR/$(get_log_directory_name)"
build_index=1

extract_content() {
    local start_marker="-------------------------------------------------------------------------------"
    local   end_marker="-------------------------------------------------------------------------------"
    local inside=false
    
    while IFS= read -r line; do
        local output="$log_dir/$LOG_PREFIX$build_index.txt"
        if [[ "$inside" == false && "$line" == *"$start_marker"* ]]; then
            inside=true
            echo "$line" >> $output
        elif [[ "$inside" == true && "$line" == *"$end_marker"* ]]; then
            inside=false
            let build_index+=1
            continue
        elif [[ $inside == true ]]; then
            echo "$line" >> $output
        fi
    done < "$1"
}

for file in "$@"; do
    if [ -d "$log_dir" ]; then
        echo "Directory $log_dir already exists."
    else
        mkdir -p "$log_dir"
        echo "Created directory: $log_dir"
    fi
    if [ -f "$file" ]; then
        extract_content "$file"
    elif [ -d "$file" ]; then
        echo "Processing directory: $file"
        for f in "$file/"*; do
            if [[ -f "$f" ]]; then
                extract_content "$f"
            fi
        done
    else
        echo "Skipping unsupported input: $file"
    fi
done
