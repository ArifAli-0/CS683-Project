#!/bin/bash

# Check if the user provided a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 {tracename}"
    exit 1
fi
echo "Running on trace - traces/SPEC-CPU2017/$1.champsimtrace.xz"
./bin/no-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "./traces/SPEC-CPU2017/$1.champsimtrace.xz" > "$1-baseline.log"
echo "Baseline Done"
./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$1.champsimtrace.xz"> "$1-ipcp.log"
echo "IPCP Done"
./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$1.champsimtrace.xz"> "$1-isb.log"
echo "ISB Done"
./bin/ipcp_isb-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$1.champsimtrace.xz"> "$1-ipcp-isb.log"
echo "All Done"