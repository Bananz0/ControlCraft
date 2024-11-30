function previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg)
    try
        num = str2num(get(hNumEdit, 'String')); %#ok<ST2NM>
        den = str2num(get(hDenEdit, 'String')); %#ok<ST2NM>
        validateCoefficients(num, den);
        tfLatex = formatTransferFunctionLaTeX(num, den);
        cla(hTFAxes);
        text(0.5, 0.5, ['\bf Transfer Function: $$' tfLatex '$$'], ...
            'Parent', hTFAxes, 'Interpreter', 'latex', ...
            'HorizontalAlignment', 'center', 'FontSize', 14);
        set(hTFAxes, 'Visible', 'off', 'XLim', [0 1], 'YLim', [0 1]);
        set(hErrorMsg, 'String', '');
    catch ME
        set(hErrorMsg, 'String', ['Error: ' ME.message]);
    end
end
