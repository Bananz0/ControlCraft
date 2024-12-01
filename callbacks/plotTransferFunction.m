function plotTransferFunction(hNumEdit, hDenEdit, hKSlider)
    % Callback for plotting responses
    try
        numStr = get(hNumEdit, 'String');
        denStr = get(hDenEdit, 'String');
        kValue = get(hKSlider, 'Value'); % Get the current value of k

        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>

        validateCoefficients(num, den);

        % Multiply the numerator by k
        num = kValue * num;

        sys = tf(num, den);

        % Store the system for use in optimization
        setappdata(0, 'CurrentSystem', sys);

        % Plot Impulse Response
        figure('Name', 'Impulse Response');
        impulse(sys);
        title('Impulse Response');
        grid on;

        % Plot Step Response
        figure('Name', 'Step Response');
        step(sys);
        title('Step Response');
        grid on;

        % Plot Bode Plot
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

    catch ME
        disp(['Error in plotting: ', ME.message]);
    end
end
