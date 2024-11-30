function loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes)
    % Populate numerator and denominator based on the selected example
    exampleIdx = get(hExampleDropdown, 'Value');
    switch exampleIdx
        case 1 % Custom
            set(hNumEdit, 'String', '');
            set(hDenEdit, 'String', '');
        case 2 % Inverted Pendulum
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0 -9.8');
        case 3 % Mass-Spring-Damper
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 2 5');
        case 4 % DC Motor
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '0.5 1');
        case 5 % First-Order System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 1');
        case 6 % Second-Order Underdamped System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0.5 4');
        case 7 % PID-Tuned System
            set(hNumEdit, 'String', '5');
            set(hDenEdit, 'String', '1 5 6');
    end

    % Update the transfer function display
    try
        num = str2num(get(hNumEdit, 'String')); %#ok<ST2NM>
        den = str2num(get(hDenEdit, 'String')); %#ok<ST2NM>
        validateCoefficients(num, den);
        tfLatex = formatTransferFunctionLaTeX(num, den);

        cla(hTFAxes);
        text(0.5, 0.5, ['$$' tfLatex '$$'], 'Parent', hTFAxes, ...
            'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', 'FontSize', 14);
        set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
    catch
        cla(hTFAxes);
        text(0.5, 0.5, 'Invalid Transfer Function', 'Parent', hTFAxes, ...
            'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 12, ...
            'Color', 'red');
        set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
    end
end
