function previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg)
    % Dynamically update the display of a transfer function in the GUI
    try
        % Retrieve and parse user inputs
        numStr = strtrim(get(hNumEdit, 'String')); % Get numerator input as string
        denStr = strtrim(get(hDenEdit, 'String')); % Get denominator input as string
        
        % Convert input strings to numeric arrays
        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>

        % Validate the input coefficients
        validateCoefficients(num, den);

        % Create the transfer function object
        sys = tf(num, den);

            % Store current numerator and denominator strings for optimization
        setappdata(0, 'CurrentNumerator', numStr);
        setappdata(0, 'CurrentDenominator', denStr);

        % Format the transfer function for LaTeX display
        tfLatex = formatTransferFunctionLaTeX(num, den);

        % Clear previous content on the axes and display the formatted LaTeX string
        cla(hTFAxes); % Clear any previous rendering
        text(0.5, 0.7, '\bf Transfer Function:', 'Parent', hTFAxes, ...
            'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', ...
            'FontSize', 12, 'FontWeight', 'bold'); % Add label
        text(0.5, 0.3, ['$$' tfLatex '$$'], 'Parent', hTFAxes, ...
            'Interpreter', 'latex', 'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'middle', 'FontSize', 14);

        % Make the axes visible and set boundaries for proper rendering
        set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);

        % Clear any error message in the error message field
        if ~isempty(hErrorMsg)
            set(hErrorMsg, 'String', '');
        end
    catch ME
        % Handle errors gracefully by displaying the error message in the GUI
        if ~isempty(hErrorMsg)
            set(hErrorMsg, 'String', ['Error: ' ME.message]);
        end

        % Clear the axes and indicate an error occurred
        cla(hTFAxes);
        text(0.5, 0.5, 'Invalid Transfer Function', 'Parent', hTFAxes, ...
            'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', ...
            'FontSize', 12, 'Color', 'red');
        set(hTFAxes, 'Visible', 'on', 'XLim', [0 1], 'YLim', [0 1]);
    end
end
