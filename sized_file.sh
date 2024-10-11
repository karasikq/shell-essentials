#!/bin/bash

show_help() {
    echo "Usage: $0 -s SIZE -o OUTPUT_FILE [-r]"
    echo "Options:"
    echo "  -s SIZE        Specify the size of the file (e.g., 5M for 5 Megabytes). Required."
    echo "  -o OUTPUT_FILE Specify the output file name. Required."
    echo "  -r             Create file with random data."
    echo "  -h             Display this help message."
}

if [[ $# -lt 4 ]]; then
    show_help
    exit 1
fi

while getopts ":s:o:rh" opt; do
    case ${opt} in
        s )
            SIZE=$OPTARG
            ;;
        o )
            OUTPUT_FILE=$OPTARG
            ;;
        r )
            RANDOM_DATA=true
            ;;
        h )
            show_help
            exit 0
            ;;
        \? )
            echo "Invalid option: $OPTARG" 1>&2
            show_help
            exit 1
            ;;
        : )
            echo "Invalid option: $OPTARG requires an argument" 1>&2
            show_help
            exit 1
            ;;
    esac
done

if [[ -z "$SIZE" || -z "$OUTPUT_FILE" ]]; then
    echo "Error: Both size (-s) and output file (-o) are required." >&2
    show_help
    exit 1
fi

if [[ "$RANDOM_DATA" = true ]]; then
    head -c "$SIZE" /dev/urandom > "$OUTPUT_FILE"
else
    truncate -s "$SIZE" "$OUTPUT_FILE"
fi

echo "File '$OUTPUT_FILE' of size '$SIZE' created successfully."

