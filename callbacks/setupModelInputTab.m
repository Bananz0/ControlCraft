function setupModelInputTab(parentTab)
    % Initialize UI elements for Model Input Tab

    % Dropdown for pre-set examples
    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Select Pre-Set Example:', ...
        'Units', 'normalized', 'Position', [0.05, 0.92, 0.2, 0.04], 'HorizontalAlignment', 'right');
    hExampleDropdown = uicontrol('Parent', parentTab, 'Style', 'popupmenu', ...
        'String', {'Custom', 'Inverted Pendulum', 'Mass-Spring-Damper', 'DC Motor', ...
                   'First-Order System', 'Second-Order Underdamped', 'PID-Tuned System'}, ...
        'Units', 'normalized', 'Position', [0.27, 0.92, 0.6, 0.05], ...
        'Callback', @(~, ~) disp('Dropdown Callback'));

    % Transfer function input fields
    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Numerator Coefficients:', ...
        'Units', 'normalized', 'Position', [0.05, 0.85, 0.2, 0.05], 'HorizontalAlignment', 'right');
    hNumEdit = uicontrol('Parent', parentTab, 'Style', 'edit', 'String', '', ...
        'Units', 'normalized', 'Position', [0.27, 0.85, 0.6, 0.05], ...
        'Callback', @(~, ~) previewTransferFunction());

    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Denominator Coefficients:', ...
        'Units', 'normalized', 'Position', [0.05, 0.75, 0.2, 0.05], 'HorizontalAlignment', 'right');
    hDenEdit = uicontrol('Parent', parentTab, 'Style', 'edit', 'String', '', ...
        'Units', 'normalized', 'Position', [0.27, 0.75, 0.6, 0.05], ...
        'Callback', @(~, ~) previewTransferFunction());

    % Error message display
    hErrorMsg = uicontrol('Parent', parentTab, 'Style', 'text', 'String', '', ...
        'Units', 'normalized', 'Position', [0.05, 0.4, 0.9, 0.05], ...
        'HorizontalAlignment', 'left', 'ForegroundColor', 'red');

    % Create an axes for LaTeX-rendered transfer function display
    hTFAxes = axes('Parent', parentTab, 'Units', 'normalized', ...
        'Position', [0.05, 0.50, 0.9, 0.2], 'Color', [0.94 0.94 0.94], ...
        'XColor', 'none', 'YColor', 'none');

    % Ensure axes stays below all other UI elements
    uistack(hTFAxes, 'bottom');

    % Nested function for dynamic transfer function preview
    function previewTransferFunction()
        try
            % Retrieve user inputs
            numStr = get(hNumEdit, 'String');
            denStr = get(hDenEdit, 'String');
            num = str2num(numStr); %#ok<ST2NM>
            den = str2num(denStr); %#ok<ST2NM>

            % Validate coefficients
            validateCoefficients(num, den);

            % Create transfer function
            sys = tf(num, den);
            tfLatex = formatTransferFunctionLaTeX(num, den);

            % Update the axes with LaTeX-rendered transfer function
            cla(hTFAxes);
            text(0.5, 0.5, ['$$' tfLatex '$$'], 'Parent', hTFAxes, ...
                'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'middle', 'FontSize', 14);
            set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
            set(hErrorMsg, 'String', '');
        catch ME
            % Display error message
            set(hErrorMsg, 'String', ['Error: ' ME.message]);
            cla(hTFAxes);
            text(0.5, 0.5, 'Invalid Transfer Function', 'Parent', hTFAxes, ...
                'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', ...
                'FontSize', 12, 'Color', 'red');
            set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
        end
    end
end
