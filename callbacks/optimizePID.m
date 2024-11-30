function optimizePID(hKpEdit, hKiEdit, hKdEdit, sys)
    Kp = str2double(get(hKpEdit, 'String'));
    Ki = str2double(get(hKiEdit, 'String'));
    Kd = str2double(get(hKdEdit, 'String'));
    x_opt = optimizePID(sys, Kp, Ki, Kd);
    set(hKpEdit, 'String', num2str(x_opt(1)));
    set(hKiEdit, 'String', num2str(x_opt(2)));
    set(hKdEdit, 'String', num2str(x_opt(3)));
end
