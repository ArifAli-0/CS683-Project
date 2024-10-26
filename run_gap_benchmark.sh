#!/bin/bash

# Check if the user provided a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {baseline|isb|ipcp}"
    exit 1
fi

# Determine which executable to use based on the argument
case $1 in
    baseline)
        executable="no-no-1core"
        ;;
    isb-l1)
        executable="isb_ideal-no-1core"
        ;;
    isb-l2)
        executable="no-isb_ideal-1core"
        ;;
    ipcp-l1)
        executable="ipcp-no-1core"
        ;;
    ipcp-l2)
        executable="no-ipcp-1core"
        ;;
    ipcp-l1-l2)
        executable="ipcp-ipcp-1core"
        ;;
    ipcp-isb)
        executable="ipcp_isb-no-1core"
        ;;
    *)
        echo "Invalid option: $1. Use {baseline|isb-l1|isb-l2|ipcp-l1|ipcp-l2}."
        exit 1
        ;;
esac
# Directory containing the executables
exec_dir="./bin"
# Directory containing the GAP traces
trace_dir="./traces/GAP/SUBSET"

# Output directory for log files (optional: create it if it doesn't exist)
output_dir="./logs"
mkdir -p "$output_dir"

# Iterate over all traces in the trace directory
for trace in "$trace_dir"/*.gz; do
    # Extract the trace name (basename without extension)
    trace_name=$(basename "$trace" .trace.gz)
    
    # Run the executable on the trace and redirect output to the log file
    ./$exec_dir/$executable -warmup_instructions 50000000 -simulation_instructions 100000000 -traces "$trace" > "$output_dir/${trace_name}-$1.log"
    
    echo "Finished processing $trace_name with $1 prefetcher"
done
