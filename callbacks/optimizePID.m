function optimizePID(hKpEdit, hKiEdit, hKdEdit)
    Kp = str2double(get(hKpEdit, 'String'));
    Ki = str2double(get(hKiEdit, 'String'));
    Kd = str2double(get(hKdEdit, 'String'));

    if isnan(Kp); Kp = 0; end
    if isnan(Ki); Ki = 0; end
    if isnan(Kd); Kd = 0; end

    % Define initial PID gains
    x0 = [Kp, Ki, Kd];

    % Define objective function for optimization
    function J = pidObjective(x)
        % Create PID controller with current gains
        controller = pid(x(1), x(2), x(3));

        % Create the system using current numerator and denominator
        numStr = getappdata(0, 'CurrentNumerator');
        denStr = getappdata(0, 'CurrentDenominator');

        num = str2num(numStr); %#ok<ST2NM>
        den = str2num(denStr); %#ok<ST2NM>

        sys = tf(num, den);

        % Closed-loop system
        sys_cl = feedback(controller * sys, 1);

        % Calculate step response
        [y, t] = step(sys_cl);
        e = 1 - y; % Error signal

        % Performance index (Integral of Absolute Error)
        J = trapz(t, abs(e));
    end

    % Optimize PID gains using fminsearch
    options = optimset('Display', 'off', 'TolFun', 1e-6);
    [x_opt, ~] = fminsearch(@pidObjective, x0, options);

    % Update PID gains in the GUI
    set(hKpEdit, 'String', num2str(x_opt(1)));
    set(hKiEdit, 'String', num2str(x_opt(2)));
    set(hKdEdit, 'String', num2str(x_opt(3)));
end
