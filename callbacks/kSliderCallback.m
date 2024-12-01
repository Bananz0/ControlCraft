function kSliderCallback(src, hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKValueText)
    % Callback function for when the k slider is moved
    
    % Get the current value of the slider
    kValue = get(src, 'Value');
    
    % Update the text display for the k value
    set(hKValueText, 'String', num2str(kValue, '%.2f'));
    
    % Update the transfer function display with the new k value
    previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, src, hKValueText);
end
