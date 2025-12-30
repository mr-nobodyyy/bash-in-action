#!/usr/bin/env bash

# kernel based OS detection
#sage: bash os_detect.sh  or ./os_detect.sh



if grep -qi microsoft /proc/version 2>/dev/null; then
    echo "Windows (WSL) detected"

elif [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS detected"

elif [[ "$(uname)" == "Linux" ]]; then
    echo "Linux detected"

else
    echo "Unknown OS"
fi
