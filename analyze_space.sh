#!/bin/sh

show_help() {
  echo "Usage: $0 [-h] [-o <output_file>] <directory> <threshold>"
  echo "Options:"
  echo "  -h Show this help message"
  echo "  -o <output_file>  Save results to the specified output file"
  echo "Threshold formats:"
  echo "  256k, 50M, 1G, etc."
}

OUTPUT_FILE=""

while getopts "ho:" OPTION; do
  case $OPTION in
    h) 
      show_help
      exit 0
      ;;
    o) 
      OUTPUT_FILE="$OPTARG"
      ;;
    ?) 
      show_help
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))

if [[ $# -lt 2 ]] ; then
  show_help
  exit 1
fi

DIRECTORY="$1"
THRESHOLD="$2"

if [[ -n $OUTPUT_FILE ]]; then
  find "$DIRECTORY" -type f -size +"$THRESHOLD" -exec du -sh {} \; | sort -rh > "$OUTPUT_FILE"
  echo "Done! Results saved to $OUTPUT_FILE"
else
  find "$DIRECTORY" -type f -size +"$THRESHOLD" -exec du -sh {} \; | sort -rh
fi

