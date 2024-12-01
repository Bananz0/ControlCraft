function plotTransferFunction(hNumEdit, hDenEdit, hKSlider)
    try
        % Retrieve and parse user inputs
        numStr = strtrim(get(hNumEdit, 'String'));
        denStr = strtrim(get(hDenEdit, 'String'));
        kValue = get(hKSlider, 'Value');

        % Convert input strings to numeric arrays or symbolic expressions
        num = parsePolynomialInput(numStr);
        den = parsePolynomialInput(denStr);

        % Multiply the numerator by k
        num = kValue * num;

        % Validate the input coefficients
        validateCoefficients(num, den);

        % Create the transfer function
        sys = tf(num, den);

        % Plot step response
        figure('Name', 'Step Response');
        step(sys);
        title('Step Response');
        grid on;

        % Plot Bode plot
        figure('Name', 'Bode Plot');
        bode(sys);
        title('Bode Plot');
        grid on;

        % Plot Root Locus
        figure('Name', 'Root Locus');
        rlocus(sys);
        title('Root Locus');
        grid on;

        % Plot Nyquist Plot
        figure('Name', 'Nyquist Plot');
        nyquist(sys);
        title('Nyquist Plot');
        grid on;

        % Plot Pole-Zero Map
        figure('Name', 'Pole-Zero Map');
        pzmap(sys);
        title('Pole-Zero Map');
        grid on;

        % Store the system for use elsewhere
        setappdata(0, 'CurrentSystem', sys);
        setappdata(0, 'CurrentNumerator', numStr);
        setappdata(0, 'CurrentDenominator', denStr);

    catch ME
        errordlg(['Error: ' ME.message], 'Plot Error');
    end
end
