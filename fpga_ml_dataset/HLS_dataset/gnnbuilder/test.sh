#!/usr/bin/env bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
designs=$(find "$SCRIPT_DIR"/designs -maxdepth 1 -type d -print)
args=""
for design in $designs; do
    args+="$SCRIPT_DIR/designs/$design "
done
python "$SCRIPT_DIR"/simple_dataset_flow.py --n_jobs 4 "$args" 
