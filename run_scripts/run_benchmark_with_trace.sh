#!/bin/bash

# Check if the user provided a command-line argument
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <prefetcher> <tracename> <log-tag>"
    exit 1
fi
echo "Running $1 prefetcher on trace - traces/SPEC-CPU2017/$2.champsimtrace.xz tag $3" 

case $1 in
    baseline)
        ./bin/no-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "./traces/SPEC-CPU2017/$2.champsimtrace.xz" > "$2-baseline.log"
        echo "Done"
        ;;
    isb)
        ./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-isb-$3.log"
        echo "Done"
        ;;
    ipcp)
        ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp-$3.log"
        echo "Done"
        ;;
    ipcp-isb)
        ./bin/ipcp_isbv3-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp-isbv3-$3.log"
        echo "Done"
        ;;
    all)
        ./bin/no-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "./traces/SPEC-CPU2017/$2.champsimtrace.xz" > "$2-baseline.log" &
        ./bin/ipcp-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp.log" &
        ./bin/no-isb_ideal-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-isb.log" &
        ./bin/ipcp_isbv3-no-1core -warmup_instructions 50000000 -simulation_instructions 50000000 -traces "traces/SPEC-CPU2017/$2.champsimtrace.xz"> "$2-ipcp-isbv3-$3.log" &
        ;;
    *)
        echo "Invalid option: $1."
        exit 1
        ;;
esac
wait
echo "Done"