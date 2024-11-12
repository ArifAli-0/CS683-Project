#!/bin/bash

# Check if the user provided a command-line argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <configname>"
    exit 1
fi
echo "Running ipcp-isb prefetcher with config $1"

# ./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/429.mcf-184B.champsimtrace.xz"        > "clean/v2/429.mcf-184B-ipcp_isbv2-$1.log" &
# ./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/462.libquantum-714B.champsimtrace.xz" > "clean/v2/462.libquantum-714B-ipcp_isbv2-$1.log" &
# ./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/482.sphinx3-234B.champsimtrace.xz"    > "clean/v2/482.sphinx3-234B-ipcp_isbv2-$1.log" &
./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/623.xalancbmk_s-10B.champsimtrace.xz" > "clean/isb/623.xalancbmk_s-10B-ipcp_isbv2-$1.log" &
./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/471.omnetpp-188B.champsimtrace.xz"    > "clean/isb/471.omnetpp-188B-ipcp_isbv2-$1.log"    &
./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/602.gcc_s-2226B.champsimtrace.xz"     > "clean/isb/602.gcc_s-2226B-ipcp_isbv2-$1.log"     &
./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/450.soplex-247B.champsimtrace.xz"     > "clean/isb/450.soplex-247B-ipcp_isbv2-$1.log"     &

wait
echo "All Done"