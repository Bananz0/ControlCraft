function previewCallback(numEdit, denEdit, axesHandle)
    numStr = get(numEdit, 'String');
    denStr = get(denEdit, 'String');

    try
        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>
        validateCoefficients(num, den);
        sys = tf(num, den);
        tfLatex = formatTransferFunctionLatex(num, den);

        cla(axesHandle);
        text(0.5, 0.5, ['\bf Transfer Function: $$' tfLatex '$$'], 'Parent', axesHandle, ...
            'Interpreter', 'latex', 'HorizontalAlignment', 'center', 'FontSize', 14);
        set(axesHandle, 'Visible', 'off', 'XLim', [0 1], 'YLim', [0 1]);
    catch ME
        disp(['Error: ', ME.message]);
    end
end
