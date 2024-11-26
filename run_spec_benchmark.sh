#!/bin/bash

# for all traces
# evaluate baseline
# evaluate isb at l2
# -------- default
# -------- ATAP
# -------- MTAP
# evaluate ipcp at l1 and l2
# evaluate combined-v1
# evaluate combined-v2
# -------- configs
# evaluate combined-v3

# Check if the user provided a command-line argument
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 {baseline|isb-l2|ipcp-l1|ipcp-l2|ipcp-l1-l2|ipcp-isbv1|ipcp-isbv2|ipcp-isbv3} {tag}"
    exit 1
fi

# Determine which executable to use based on the argument
case $1 in
    baseline)
        executable="no-no-1core"
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
    ipcp-isbv1)
        executable="ipcp_isbv1-no-1core"
        ;;
    ipcp-isbv2)
        executable="ipcp_isbv2-no-1core"
        ;;
    ipcp-isbv3)
        executable="ipcp_isbv3-no-1core"
        ;;
    *)
        echo "Invalid option: $1. {baseline|isb-l2|ipcp-l1|ipcp-l2|ipcp-l1-l2|ipcp-isbv1|ipcp-isbv2|ipcp-isbv3}"
        exit 1
        ;;
esac
# Directory containing the executables
exec_dir="./bin"
# Directory containing the GAP traces
trace_dir="./traces/SPEC-CPU2017"

# Output directory for log files (optional: create it if it doesn't exist)
output_dir="./logs"
mkdir -p "$output_dir"

# Iterate over all traces in the trace directory
for trace in "$trace_dir"/*.xz; do
    # Extract the trace name (basename without extension)
    trace_name=$(basename "$trace" .champsimtrace.xz)
    # Run the executable on the trace and redirect output to the log file
    ./$exec_dir/$executable -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "$trace" > "$output_dir/${trace_name}-$1-$2.log" &
    
    echo "Processing $trace_name with $1 prefetcher, tag $2"
done

wait 
echo "Done"