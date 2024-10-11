#!/bin/sh

LOGS_DIR="./build_logs"
LOG_PREFIX="log_"

get_log_directory_name() {
  echo $(date +%Y-%m-%d-%H-%M-%S)
}

get_unity_editor_log() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
      echo "$HOME/.config/unity3d/Editor.log"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
      echo "$HOME/Library/Logs/Unity/Editor.log"
  else
      echo "Unsupported"
  fi
}

