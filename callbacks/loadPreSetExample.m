function loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText)
    % Populate numerator and denominator based on the selected example
    exampleIdx = get(hExampleDropdown, 'Value');
    switch exampleIdx
        case 1 % Custom
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 1 1');
            tooltip = 'Custom transfer function. Input coefficients manually.';
        case 2 % Inverted Pendulum (Lecture Notes)
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0 -9.8');
            tooltip = 'Inverted Pendulum: Found in Lecture Notes Section 5.1&#8203;:contentReference[oaicite:0]{index=0}.';
        case 3 % Mass-Spring-Damper System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 2 5');
            tooltip = 'Mass-Spring-Damper System: Lecture Notes Section 4.1&#8203;:contentReference[oaicite:1]{index=1}.';
        case 4 % Proportional Controller
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1');
            tooltip = 'Proportional Controller: Discussed in Lecture Notes Section 4.4&#8203;:contentReference[oaicite:2]{index=2}.';
        case 5 % Proportional-Integral (PI) Controller
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 s');
            tooltip = 'PI Controller: Found in Lecture Notes Section 4.5&#8203;:contentReference[oaicite:3]{index=3}.';
        case 6 % Proportional-Derivative (PD) Controller
            set(hNumEdit, 'String', '1 0.1');
            set(hDenEdit, 'String', '1');
            tooltip = 'PD Controller: Derived from Lecture Notes Section 4.6&#8203;:contentReference[oaicite:4]{index=4}.';
        case 7 % Three-Term PID Controller
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 1 s');
            tooltip = 'PID Controller: Detailed in Lecture Notes Section 4.7&#8203;:contentReference[oaicite:5]{index=5}.';
        case 8 % Nyquist Stability Example
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', 's (4s+1) (6s+1)');
            tooltip = 'Nyquist Stability: Referenced in Tutorial Questions, Problem 3&#8203;:contentReference[oaicite:6]{index=6}.';
        case 9 % Closed-Loop Gain Variation
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 + k(s+3)^2');
            tooltip = 'Closed-Loop Gain Variation: Found in Lecture Notes Section 6.2&#8203;:contentReference[oaicite:7]{index=7}.';
        case 10 % First-Order System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 1');
            tooltip = 'First-Order System: Found in Lecture Notes Section 3.1&#8203;:contentReference[oaicite:8]{index=8}.';
        case 11 % Second-Order Underdamped System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0.5 4');
            tooltip = 'Second-Order Underdamped: Lecture Notes Section 3.4&#8203;:contentReference[oaicite:9]{index=9}.';
        case 12 % Root Locus Gain Variation
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', 's(s+3)^2');
            tooltip = 'Root Locus Example: Discussed in Lecture Notes Section 7.3&#8203;:contentReference[oaicite:10]{index=10}.';
        otherwise
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 1 1');
            tooltip = 'Custom transfer function. Input coefficients manually.';
    end

    % Add tooltip to the dropdown for context
    set(hExampleDropdown, 'TooltipString', tooltip);

    % Update the transfer function display
    previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText);
end
