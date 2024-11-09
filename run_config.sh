#!/bin/bash

# Check if the user provided a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <configname>"
    exit 1
fi
echo "Running ipcp-isb prefetcher with config $1"

./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/623.xalancbmk_s-10B.champsimtrace.xz" > "623.xalancbmk_s-10B-ipcp-isbv2-$1.log" &
./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/471.omnetpp-188B.champsimtrace.xz"    > "471.omnetpp-188B-ipcp_isbv2-$1.log"    &
./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/602.gcc_s-2226B.champsimtrace.xz"     > "602.gcc_s-2226B-ipcp_isbv2-$1.log"     &
./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/450.soplex-247B.champsimtrace.xz"     > "450.soplex-247B-ipcp_isbv2-$1.log"     &

wait
echo "All Done"