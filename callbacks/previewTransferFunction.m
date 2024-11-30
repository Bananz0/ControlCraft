function previewTransferFunction(hNumEdit, hDenEdit, hErrorMsg)
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

        % Create and display the transfer function
        sys = tf(num, den);
        disp(sys);

        % Display success message
        set(hErrorMsg, 'String', 'Transfer Function is valid!');
    catch ME
        % Display error message
        set(hErrorMsg, 'String', ['Error: ' ME.message]);
    end
end
