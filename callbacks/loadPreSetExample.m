function loadPreSetExample(exampleIdx, hNumEdit, hDenEdit, hKpEdit, hKiEdit, hKdEdit)
    switch exampleIdx
        case 1 % Custom
            set(hNumEdit, 'String', '');
            set(hDenEdit, 'String', '');
        case 2 % Inverted Pendulum
            set(hNumEdit, 'String', '1');
            set(hDenEdit, 'String', '1 0 -9.8');
        % Add other cases as needed...
    end
end
