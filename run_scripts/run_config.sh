#!/bin/bash

# Check if the user provided a command-line argument
# if [ "$#" -ne 1 ]; then
#     echo "Usage: $0 <configname>"
#     exit 1
# fi

# ./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/429.mcf-184B.champsimtrace.xz"        > "clean/v2/429.mcf-184B-ipcp_isbv2-$1.log" &
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/462.libquantum-714B.champsimtrace.xz" > "462.libquantum-714B-ipcp.log" &
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/482.sphinx3-234B.champsimtrace.xz"    > "482.sphinx3-234B-ipcp.log"    &
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/623.xalancbmk_s-10B.champsimtrace.xz" > "623.xalancbmk_s-10B-ipcp.log" &
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/471.omnetpp-188B.champsimtrace.xz"    > "471.omnetpp-188B-ipcp.log"    &
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/602.gcc_s-2226B.champsimtrace.xz"     > "602.gcc_s-2226B-ipcp.log"     &
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/450.soplex-247B.champsimtrace.xz"     > "450.soplex-247B-ipcp.log"     &

./bin/isb_ideal-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/462.libquantum-714B.champsimtrace.xz" > "462.libquantum-714B-isb-l1.log" &
./bin/isb_ideal-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/482.sphinx3-234B.champsimtrace.xz"    > "482.sphinx3-234B-isb-l1.log"    &
./bin/isb_ideal-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/623.xalancbmk_s-10B.champsimtrace.xz" > "623.xalancbmk_s-10B-isb-l1.log" &
./bin/isb_ideal-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/471.omnetpp-188B.champsimtrace.xz"    > "471.omnetpp-188B-isb-l1.log"    &
./bin/isb_ideal-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/602.gcc_s-2226B.champsimtrace.xz"     > "602.gcc_s-2226B-isb-l1.log"     &
./bin/isb_ideal-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/450.soplex-247B.champsimtrace.xz"     > "450.soplex-247B-isb-l1.log"     &

wait
echo "All Done"