function loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hTFAxes, ...
    hErrorMsg, hKSlider, hKValueText, examples)

    % Get the selected example index
    exampleIdx = get(hExampleDropdown, 'Value');

    % Ensure the index is within bounds
    if exampleIdx > length(examples)
        exampleIdx = 1; % Default to 'Custom'
    end

    % Get the selected example data
    selectedExample = examples(exampleIdx);

    % Set the numerator and denominator coefficients
    set(hNumEdit, 'String', selectedExample.num);
    set(hDenEdit, 'String', selectedExample.den);

    % Add tooltip to the dropdown for context
    set(hExampleDropdown, 'TooltipString', selectedExample.tooltip);

    % Update the transfer function display
    previewTransferFunction(hNumEdit, hDenEdit, hTFAxes, hErrorMsg, hKSlider, hKValueText);
end
