function setupModelInputTab(parentTab)
    % Initialize UI elements for Model Input Tab

    % Dropdown for pre-set examples
    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Select Pre-Set Example:', ...
        'Units', 'normalized', 'Position', [0.05, 0.92, 0.2, 0.04], 'HorizontalAlignment', 'right');

    % Create the dropdown menu with default value set to 'Custom'
    hExampleDropdown = uicontrol('Parent', parentTab, 'Style', 'popupmenu', ...
        'String', {'Custom', 'Inverted Pendulum', 'Mass-Spring-Damper', 'DC Motor', ...
                   'First-Order System', 'Second-Order Underdamped', 'PID-Tuned System'}, ...
        'Value', 1, ... % Set default value to 'Custom'
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

    % Gain 'k' Slider Label
    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Gain (k):', ...
        'Units', 'normalized', 'Position', [0.05, 0.65, 0.1, 0.05], 'HorizontalAlignment', 'right');

    % Gain 'k' Slider without the 'Callback' property
    hKSlider = uicontrol('Parent', parentTab, 'Style', 'slider', ...
        'Units', 'normalized', 'Position', [0.17, 0.66, 0.3, 0.04], ...
        'Min', 0.1, 'Max', 10, 'Value', 1, 'SliderStep', [0.01 0.1]);

    % Gain 'k' Display (to show the current value)
    hKValueText = uicontrol('Parent', parentTab, 'Style', 'text', 'String', '1', ...
        'Units', 'normalized', 'Position', [0.48, 0.65, 0.05, 0.05], 'HorizontalAlignment', 'left');

    % Now set the 'Callback' property of hKSlider after it's defined
    set(hKSlider, 'Callback', @(src, event) kSliderCallback(src, hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKValueText));


    % Plot Button
    uicontrol('Parent', parentTab, 'Style', 'pushbutton', 'String', 'Plot', ...
    'Units', 'normalized', 'Position', [0.55, 0.65, 0.15, 0.05], ...
    'Callback', @(src, event) plotTransferFunction(hNumEdit, hDenEdit, hKSlider));

    % Close Plots Button
    uicontrol('Parent', parentTab, 'Style', 'pushbutton', 'String', 'Close Plots', ...
        'Units', 'normalized', 'Position', [0.75, 0.65, 0.15, 0.05], ...
        'Callback', @(src, event) closeAllPlots());

    % Update the handles in the callbacks
    set(hExampleDropdown, 'Callback', @(~, ~) loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText));
    set(hNumEdit, 'Callback', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText));
    set(hDenEdit, 'Callback', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText));
    set(hNumEdit, 'KeyReleaseFcn', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText));
    set(hDenEdit, 'KeyReleaseFcn', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText));

    % Initial call to display the transfer function
    loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText);
    previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText);
end