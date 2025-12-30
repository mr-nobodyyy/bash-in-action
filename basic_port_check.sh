#!/bin/bash
# use_case : basic_port_check.sh   or    bash basic_port_check.sh 
# simple port scanner

function host_scan() {
    local host=$1

    echo "Scanning host: $host"
    echo "Open ports:"

    for port in {1..1024}; do
        timeout 0.3 bash -c ">/dev/tcp/$host/$port" 2>/dev/null
        if [ $? -eq 0 ]; then
            echo "  Port $port is OPEN"
        fi
    done

    echo "Scan completed for $host"
    echo "......................................................"
}

#Main Code starts here
# Output file 
OUTPUT="scan_$(date +%Y-%m).txt"
echo "Results will be saved to: $OUTPUT"
echo

while true; do
    read -p "Enter host (or type 'exit' to quit): " hostname

    
    if [[ "$hostname" == "exit" ]]; then
        echo "Exiting scanner."
        break
    fi

    # Skip empty input
    if [[ -z "$hostname" ]]; then
        echo "Please enter a valid hostname."
        continue
    fi

    host_scan "$hostname" | tee -a "$OUTPUT"
done

echo "Host scans completed. Results saved to $OUTPUT"
