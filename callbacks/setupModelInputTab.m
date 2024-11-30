function setupModelInputTab(parentTab)
    % Initialize UI elements for Model Input Tab

    % Dropdown for pre-set examples
    hExampleDropdown = uicontrol('Parent', parentTab, 'Style', 'popupmenu', ...
        'String', {'Custom', 'Inverted Pendulum', 'Mass-Spring-Damper', 'DC Motor', ...
                   'First-Order System', 'Second-Order Underdamped', 'PID-Tuned System'}, ...
        'Units', 'normalized', 'Position', [0.27, 0.92, 0.6, 0.05]);

    % Transfer function input fields
    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Numerator Coefficients:', ...
        'Units', 'normalized', 'Position', [0.05, 0.85, 0.2, 0.05], 'HorizontalAlignment', 'right');
    hNumEdit = uicontrol('Parent', parentTab, 'Style', 'edit', 'String', '', ...
        'Units', 'normalized', 'Position', [0.27, 0.85, 0.6, 0.05]);

    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Denominator Coefficients:', ...
        'Units', 'normalized', 'Position', [0.05, 0.75, 0.2, 0.05], 'HorizontalAlignment', 'right');
    hDenEdit = uicontrol('Parent', parentTab, 'Style', 'edit', 'String', '', ...
        'Units', 'normalized', 'Position', [0.27, 0.75, 0.6, 0.05]);

    % Axes for LaTeX-rendered transfer function display
    hTFAxes = axes('Parent', parentTab, 'Units', 'normalized', ...
        'Position', [0.05, 0.55, 0.9, 0.2], 'Color', [0.94 0.94 0.94], 'XColor', 'none', 'YColor', 'none');

    % Plot and Close Plots Buttons
    uicontrol('Parent', parentTab, 'Style', 'pushbutton', 'String', 'Plot', ...
        'Units', 'normalized', 'Position', [0.55, 0.4, 0.15, 0.05], ...
        'Callback', @(src, event) plotTransferFunction(hNumEdit, hDenEdit));

    uicontrol('Parent', parentTab, 'Style', 'pushbutton', 'String', 'Close Plots', ...
        'Units', 'normalized', 'Position', [0.75, 0.4, 0.15, 0.05], ...
        'Callback', @(src, event) closeAllPlots());

    % Pre-set example dropdown callback
    set(hExampleDropdown, 'Callback', @(src, event) ...
        loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes));


    % Update the transfer function display dynamically
    function updateTransferFunctionDisplay()
        try
            % Get current input values
            numStr = get(hNumEdit, 'String');
            denStr = get(hDenEdit, 'String');

            % Convert strings to numeric arrays
            num = str2num(numStr); %#ok<ST2NM>
            den = str2num(denStr); %#ok<ST2NM>

            % Validate coefficients
            validateCoefficients(num, den);

            % Format the transfer function for LaTeX rendering
            tfLatex = formatTransferFunctionLaTeX(num, den);

            % Clear previous text and render LaTeX
            cla(hTFAxes);
            text(0.5, 0.7, '\bf Transfer Function:', 'Parent', hTFAxes, ...
                'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 12, 'FontWeight', 'bold');
            text(0.5, 0.3, ['$$' tfLatex '$$'], 'Parent', hTFAxes, ...
                'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'middle', 'FontSize', 14);
            set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
        catch
            % Clear axes and display an error message if invalid
            cla(hTFAxes);
            text(0.5, 0.5, 'Invalid Transfer Function', 'Parent', hTFAxes, ...
                'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 12, ...
                'Color', 'red');
            set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
        end
    end
end
