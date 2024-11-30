function optimizeCallback(KpEdit, KiEdit, KdEdit, sys)
    Kp = str2double(get(KpEdit, 'String'));
    Ki = str2double(get(KiEdit, 'String'));
    Kd = str2double(get(KdEdit, 'String'));
    x_opt = optimizePID(sys, Kp, Ki, Kd);
    set(KpEdit, 'String', num2str(x_opt(1)));
    set(KiEdit, 'String', num2str(x_opt(2)));
    set(KdEdit, 'String', num2str(x_opt(3)));
end
