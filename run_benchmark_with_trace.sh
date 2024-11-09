#!/bin/bash

# Check if the user provided a command-line argument
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <prefetcher> <tracename>"
    exit 1
fi
echo "Running $1 prefetcher on trace - traces/SPEC-CPU2017/$2.champsimtrace.xz"

case $1 in
    baseline)
        ./bin/no-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "./traces/SPEC-CPU2017/$2.champsimtrace.xz" > "$2-baseline.log"
        echo "Done"
        ;;
    isb)
        ./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-isb.log"
        echo "Done"
        ;;
    ipcp)
        ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp.log"
        echo "Done"
        ;;
    ipcp-isb)
        ./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp-isbv2.log"
        echo "Done"
        ;;
    all)
        ./bin/no-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "./traces/SPEC-CPU2017/$2.champsimtrace.xz" > "$2-baseline.log"
        echo "Baseline Done"
        ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp.log"
        echo "IPCP Done"
        ./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-isb.log"
        echo "ISB Done"
        ./bin/ipcp_isbv2-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp-isbv2.log"
        echo "All Done"
        ;;
    *)
        echo "Invalid option: $1."
        exit 1
        ;;
esac
# ./bin/no-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "./traces/SPEC-CPU2017/$1.champsimtrace.xz" > "$1-baseline.log"
# echo "Baseline Done"
# ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$1.champsimtrace.xz"> "$1-ipcp.log"
# echo "IPCP Done"
# ./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$1.champsimtrace.xz"> "$1-isb.log"
# echo "ISB Done"
# ./bin/ipcp_isb-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$1.champsimtrace.xz"> "$1-ipcp-isbv2.log"
# echo "All Done"