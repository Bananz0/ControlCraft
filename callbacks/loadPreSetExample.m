function loadPreSetExample(hExampleDropdown, hNumEdit, hDenEdit)
    % Populate numerator and denominator based on the selected example
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
        case 4 % DC Motor
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '0.5 1');
        case 5 % First-Order System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 1');
        case 6 % Second-Order Underdamped System
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0.5 4');
        case 7 % PID-Tuned System
            set(hNumEdit, 'String', '5');
            set(hDenEdit, 'String', '1 5 6');
        otherwise
            set(hNumEdit, 'String', '');
            set(hDenEdit, 'String', '');
    end
end
