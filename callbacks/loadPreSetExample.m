function loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit, hKpEdit, hKiEdit, hKdEdit)
    exampleIdx = get(hExampleDropdown, 'Value');
    switch exampleIdx
        case 1 % Custom
            set(hNumEdit, 'String', '');
            set(hDenEdit, 'String', '');
        case 2 % Inverted Pendulum
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0 -9.8');
        case 3 % Mass-Spring-Damper
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 2 5');
        % Add more cases here...
    end
end
