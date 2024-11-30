
# ControlCraft: Comprehensive Control System Toolbox

ControlCraft is a MATLAB-based GUI tool designed to help students, educators, and engineers learn and experiment with control system concepts. Whether you're tuning a PID controller, plotting a root locus, or analyzing a Nyquist diagram, ControlCraft makes control system analysis intuitive and interactive.

---

## Features

- **GUI-Based Interaction**: Easy-to-use interface for visualizing transfer functions and controllers.
- **System Analysis**:
  - Pole-Zero Analysis
  - Impulse, Step, and Frequency Response
  - Bode, Nyquist, and Root Locus Plots
- **Controller Design**:
  - PID Controller Tuning (Manual and Optimized)
  - Closed-Loop Transfer Function Visualization
- **Real-World Examples**: Pre-set cases to explore classic control problems like inverted pendulums.

---

## Folder Structure

```plaintext
src/        # Core MATLAB code and GUI
docs/       # Course notes and supplementary materials
examples/   # Example scripts for users
tests/      # Verification and testing scripts
```

---

## Installation

1. Clone this repository:

    ```bash
    git clone https://github.com/<your-username>/ControlCraft.git
    ```

2. Open MATLAB and navigate to the `ControlCraft/src` folder.

3. Run the `main.m` file to start the GUI:

    ```matlab
    >> main
    ```

---

## Usage

1. Input the transfer function of your system.
2. Explore analysis tools like step response, Bode plots, or Nyquist diagrams.
3. Design controllers by manually entering PID gains or optimizing them automatically.

---

## Examples

Run the pre-set examples to get started:

```matlab
>> run examples/simplePID_example.m
>> run examples/rootLocus_example.m
```

---

## Contributing

Contributions are welcome! See the [contributing guide](CONTRIBUTING.md) for details.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

- University of Southampton's ELEC2220 Course Materials by Prof. Paul Lewin  
- MATLAB Control Toolbox for foundational plotting tools
