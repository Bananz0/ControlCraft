# ControlCraft: Comprehensive Control System Toolbox

ControlCraft is a MATLAB-based GUI tool designed to help students, educators, and engineers learn and experiment with control system concepts. Whether you're tuning a PID controller, plotting a root locus, or analyzing a Nyquist diagram, ControlCraft makes control system analysis intuitive and interactive.

## Features

- **GUI-Based Interaction**: Easy-to-use interface for visualizing transfer functions and controllers
- **System Analysis**:
  - Pole-Zero Analysis
  - Impulse, Step, and Frequency Response
  - Bode, Nyquist, and Root Locus Plots
- **Controller Design**:
  - PID Controller Tuning (Manual and Optimized)
  - Closed-Loop Transfer Function Visualization
- **Real-World Examples**: Pre-set cases to explore classic control problems like inverted pendulums
- **Flexible Input Parsing**: Accepts both polynomial coefficients and symbolic expressions for transfer functions
- **Explicit Multiplication Support**: Handles symbolic expressions with explicit multiplication for accurate parsing

## Folder Structure

```
src/        # Core MATLAB code and GUI
docs/       # Course notes and supplementary materials
examples/   # Example scripts for users
tests/      # Verification and testing scripts
```

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/<your-username>/ControlCraft.git
   ```

2. Install Required MATLAB Toolboxes:
   - Control System Toolbox
   - Symbolic Math Toolbox

3. Navigate to the src folder in MATLAB:

   ```matlab
   >> cd('ControlCraft/src')
   ```

4. Run the main.m file to start the GUI:

   ```matlab
   >> main
   ```

## Usage

### Input Transfer Function

You can input transfer functions using either:

- **Polynomial Coefficients**: Enter numbers separated by spaces, e.g., `1 0 3` represents 1/s² + 0s + 3
- **Symbolic Expressions**: Use valid MATLAB syntax with explicit multiplication, e.g., `s*(s+1)`, `s^2 + 3*s + 2`

### Steps to Use ControlCraft

1. Launch the GUI by running `main.m`
2. Select a Pre-Set Example or enter your own transfer function
3. Adjust Parameters:
   - Modify the numerator and denominator
   - Use the gain slider to adjust the gain k
4. Visualize the Transfer Function:
   - View the transfer function in LaTeX format
5. Analyze the System:
   - Use the Plot button to generate various plots (step response, Bode plot, Nyquist diagram, root locus)
6. Design Controllers:
   - Switch to the Controller Design tab to manually enter or automatically optimize PID gains

## Troubleshooting

### Common Issues

- **Symbolic Math Errors**:
  - Use the `*` operator for multiplication (e.g., `s*(s+1)` instead of `s(s+1)`)
- **Invalid Transfer Function Inputs**:
  - Verify numerator and denominator inputs are correctly formatted
  - Ensure coefficients are numeric and symbolic expressions use valid MATLAB syntax
- **Symbolic Math Toolbox**:
  - Install via MATLAB's Add-On Explorer if not already present
- **GUI Not Launching**:
  - Run `main.m` from the src directory
  - Check for missing files or functions in the src folder

## Tips

- Always use `*` for multiplication in symbolic expressions
- Use correct MATLAB syntax for powers (`^`), multiplication (`*`), addition (`+`), and subtraction (`-`)
- Test symbolic expressions in MATLAB's Command Window to ensure correct evaluation

## Requirements

- MATLAB R2020a or newer
- Toolboxes:
  - Control System Toolbox
  - Symbolic Math Toolbox

## Contributing

Contributions are welcome! See the contributing guide for details.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Acknowledgments

- University of Southampton's ELEC2220 Course Materials
- MATLAB Control System Toolbox and Symbolic Math Toolbox

## Contact

For any inquiries or feedback, please raise an issue on the GitHub repository.
