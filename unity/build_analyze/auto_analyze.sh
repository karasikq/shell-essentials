#!/bin/sh
source ./settings.sh
./extract_build_log.sh $(get_unity_editor_log)
./analyze_build_logs.sh $LOGS_DIR
