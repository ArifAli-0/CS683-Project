# CS683 Final Course Project: Improving IPCP with Irregular Access Support using ISB

## Project Proposal

The project aims to extend the Instruction Pointer Classifier-based Prefetcher (**IPCP**) from the paper *"Bouquet of Instruction Pointers: Instruction Pointer Classifier-based Hardware Prefetching"* by integrating a new prefetcher to the bouquet for irregular memory access patterns. Specifically, we propose to incorporate the Irregular Stream Buffer (**ISB**), which was introduced in *"Linearizing Irregular Memory Accesses for Improved Correlated Prefetching"*.  

IPCP currently classifies instruction pointers into three categories: CS (Constant Stride), CPLX (Complex Patterns), and GS (Global Stride), each designed to handle regular access patterns efficiently. However, IPCP does not address the challenge of irregular memory access patterns effectively. Our objective is to introduce a new class called Irregular Access (IA) within the IPCP framework, targeting irregular accesses where existing classifications fall short.  

By integrating the ISB into IPCP and defining a new IA class, we aim to improve prefetching for workloads with irregular memory access patterns. This approach is particularly relevant for applications such as graph processing, where irregular accesses dominate and are not captured well by traditional prefetching techniques.  

The project evaluates the modified IPCP on the memory-intensive **SPECCPU2017** benchmarks. Evaluation metrics include **speedup**, **MPKI**, **coverage**, and **accuracy** compared to both the original IPCP and original ISB. Additionally, the project assesses per-class contributions (CS, CPLX, GS, IA), class priority, and utility (individual and combined).  

---

## Related Works (Top Conference Papers)

1. *Bouquet of Instruction Pointers: Instruction Pointer Classifier-based Hardware Prefetching*, ISCA '20
2. *Linearizing Irregular Memory Accesses for Improved Correlated Prefetching*, MICRO '13  

---

## Tools, Simulators, Benchmarks

### Tools and Simulators

- **ChampSim**: A cycle-accurate simulator for evaluating hardware prefetchers.
  
### Benchmarks

- **GAP Benchmark Suite**: Evaluates irregular memory access workloads.
- **SPECCPU2017**: Tests general memory-bound scenarios with diverse workloads.

---

## Deliverables for Checkpoints

### Checkpoint-1 (October 26)

1. Complete design and planning for the Irregular Access (IA) class extension in IPCP.
2. Implement initial integration of ISB into IPCP in ChampSim.

### Checkpoint-2 (November 10)

1. Integrate ISB fully into IPCP, ensuring classification of irregular accesses.
2. Conduct initial performance evaluation using the GAP Benchmark Suite.
3. Analyze metrics such as MPKI, coverage, and accuracy, comparing against baseline IPCP.

### Checkpoint-3 (November 26)

1. Finalize testing using GAP Benchmark Suite and SPECCPU2017.
2. Complete performance analysis (speedup, MPKI, coverage, accuracy, class utility).
3. Prepare the final report and presentation summarizing findings.

---

## Work Updates

### Checkpoint-1 Updates

- Integrated IPCP and ISB separately in ChampSim.
- Configured and executed GAP and SPECCPU2017 benchmarks.
- Early integration of ISB within IPCP yielded no significant performance gain but showed potential for refinement.

### Checkpoint-2 Updates

- Refined classification logic for the IA class.
- Added accuracy-based prefetch degree adaptation and shared metadata via IPCP IP-Table (not beneficial).
- Observed performance improvements in combined IPCP-ISB configurations with exceptions for specific benchmarks like *omnetpp*.

### Checkpoint-3 Updates

- Evaluated multiple configurations to refine classification logic.
- Achieved optimal IPCP class design with ISB, balancing performance across *gcc* and *omnetpp* benchmarks.
- Final version demonstrated:
  - Improved accuracy and coverage compared to standalone IPCP and ISB.
  - Significant MPKI reduction, leveraging dynamic utilization of prefetcher classes.

---

## Insights and Future Work

### Key Insights

- IPCP effectively handles regular access patterns.
- ISB excels in managing irregular memory access streams.
- The combined IPCP_ISB prefetcher synergizes both, achieving reduced MPKI and better overall performance.

### Future Work

1. Minimize the storage footprint of ISB’s address reference stream.
2. Test across a wider variety of benchmarks to evaluate scalability and robustness.

---

## Code and Execution

### Codebase Structure

- **Modified code Components**: `prefetcher/ipcp_isbv1.l1d_pref`, `prefetcher/ipcp_isbv2.l1d`,_`prefetcher/pref,ipcp_isbv3.l1d_pref`
- **Other Components**:
  - `graphs`: Graphs and visualizations.
  - `logs`: Logs for V1, V2, and V3 configurations.
  - `plotter`: Python notebooks for visualizing IPC, MPKI, accuracy, and coverage metrics.
  - `run_scripts`: Bash scripts for running prefetchers on various traces.

### Building and Running

1. **Build**: `./build_champsim.sh <l1d-prefetcher-name> <l2-prefetcher-name> <core>`
   - Generates a binary in `bin/`.
2. **Run**:

   ```bash
   ./bin/<binary-name> -warmup_instructions 50000000 -simulation_instructions 50000000 \
   -traces "./traces/SPEC-CPU2017/<trace_name>.champsimtrace.xz" > "<trace_name>.log"
   ```

---

## Resources

### Repository

- [GitHub Link](https://github.com/ArifAli-0/CS683-Project.git)
- [Fork](https://github.com/sammagnet7/CS683_AdvCompArch_Project.git)

### Video Demonstrations

1. [Checkpoint 1](https://youtu.be/JrZYAXMjjzY)
2. [Checkpoint 2](https://youtu.be/AmGMXzYUihc)
3. [Checkpoint 3](https://youtu.be/CuVzCN3LcRc)
