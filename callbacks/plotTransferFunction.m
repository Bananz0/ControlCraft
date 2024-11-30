function plotTransferFunction(hNumEdit, hDenEdit)
    % Callback for plotting responses
    try
        numStr = get(hNumEdit, 'String');
        denStr = get(hDenEdit, 'String');

        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>

        validateCoefficients(num, den);

        sys = tf(num, den);
        figure; impulse(sys); title('Impulse Response'); grid on;
        figure; step(sys); title('Step Response'); grid on;
        figure; bode(sys); title('Bode Plot'); grid on;
    catch ME
        disp(['Error in plotting: ', ME.message]);
    end
end
