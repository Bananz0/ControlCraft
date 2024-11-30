function previewTransferFunction(hNumEdit, hDenEdit)
    numStr = get(hNumEdit, 'String');
    denStr = get(hDenEdit, 'String');

    try
        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>
        validateCoefficients(num, den);

        % Create transfer function
        sys = tf(num, den);
        disp(sys); % Print transfer function in command window
    catch ME
        disp(['Error: ', ME.message]);
    end
end
