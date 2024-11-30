function optimizePID(hKpEdit, hKiEdit, hKdEdit)
    Kp = str2double(get(hKpEdit, 'String'));
    Ki = str2double(get(hKiEdit, 'String'));
    Kd = str2double(get(hKdEdit, 'String'));

    % Objective function to minimize
    function J = pidObjective(x)
        controller = pid(x(1), x(2), x(3));
        sys = tf(1, [1 1]); % Example system
        sys_cl = feedback(controller * sys, 1);
        J = stepinfo(sys_cl).SettlingTime; % Example criterion
    end

    % Optimize gains
    x0 = [Kp, Ki, Kd];
    x_opt = fminsearch(@pidObjective, x0);

    % Update gains in the GUI
    set(hKpEdit, 'String', num2str(x_opt(1)));
    set(hKiEdit, 'String', num2str(x_opt(2)));
    set(hKdEdit, 'String', num2str(x_opt(3)));
end
