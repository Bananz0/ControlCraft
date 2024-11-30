function setupModelInputTab(parentTab)
    % Initialize UI elements for Model Input Tab

    % Dropdown for pre-set examples
    uicontrol('Parent', parentTab, 'Style', 'text', 'String', 'Select Pre-Set Example:', ...
        'Units', 'normalized', 'Position', [0.05, 0.92, 0.2, 0.04], 'HorizontalAlignment', 'right');

    % Create the dropdown menu without the Callback
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

    % Plot and Close Plots Buttons
    uicontrol('Parent', parentTab, 'Style', 'pushbutton', 'String', 'Plot', ...
        'Units', 'normalized', 'Position', [0.55, 0.65, 0.15, 0.05], ...
        'Callback', @(src, event) plotTransferFunction(hNumEdit, hDenEdit));

    uicontrol('Parent', parentTab, 'Style', 'pushbutton', 'String', 'Close Plots', ...
        'Units', 'normalized', 'Position', [0.75, 0.65, 0.15, 0.05], ...
        'Callback', @(src, event) closeAllPlots());

    % Set the Callbacks after the handles are defined
    set(hExampleDropdown, 'Callback', @(~, ~) loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes, hErrorMsg));
    set(hNumEdit, 'Callback', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg));
    set(hDenEdit, 'Callback', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg));
    set(hNumEdit, 'KeyReleaseFcn', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg));
    set(hDenEdit, 'KeyReleaseFcn', @(~, ~) previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg));

    % Initial call to display the transfer function if default values are set
    previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg);
end
