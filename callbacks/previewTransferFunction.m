function previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg)
    % Callback for the Preview Transfer Function button
    try
        % Get user input
        numStr = get(hNumEdit, 'String');
        denStr = get(hDenEdit, 'String');

        % Convert to numeric arrays
        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>

        % Validate coefficients
        validateCoefficients(num, den);

        % Create transfer function
        sys = tf(num, den);

        % Format the transfer function for LaTeX display
        tfLatex = formatTransferFunctionLaTeX(num, den);

        % Display the transfer function in the GUI
        cla(hTFAxes); % Clear previous content
        text(0.5, 0.5, ['$$' tfLatex '$$'], 'Parent', hTFAxes, ...
            'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', 'FontSize', 14);
        set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);

        % Clear any error message
        set(hErrorMsg, 'String', '');
    catch ME
        % Display error message
        set(hErrorMsg, 'String', ['Error: ' ME.message]);
        cla(hTFAxes); % Clear preview if there's an error
    end
end
