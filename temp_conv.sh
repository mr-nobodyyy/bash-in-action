#!/bin/bash

# Usage:
# ./temp_comv_getop.sh <opton> <value>

while getopts "c:f:" opt; do
    case "$opt" in
        c)
            # Celsius to Fahrenheit
            result=$(echo "scale=2; ($OPTARG * 9/5) + 32" | bc);;
            echo "$OPTARG °C = $result °F"
            
        f)
            # Fahrenheit to Celsius
            result=$(echo "scale=2; ($OPTARG - 32) * 5/9" | bc);;
            echo "$OPTARG °F = $result °C"
            
        \?)
            echo "Usage: $0 -c <celsius> | -f <fahrenheit>"
            exit 1
            ;;
    esac
done
