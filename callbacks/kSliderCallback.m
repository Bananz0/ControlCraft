function kSliderCallback(src, hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKValueText)
    % Callback function for when the k slider is moved
    previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, src, hKValueText);
end
