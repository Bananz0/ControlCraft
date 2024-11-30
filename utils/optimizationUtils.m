function x_opt = optimizePID(sys, Kp, Ki, Kd)
    x0 = [Kp, Ki, Kd];
    options = optimset('Display', 'off', 'TolFun', 1e-6);
    x_opt = fminsearch(@(x) pidObjective(x, sys), x0, options);
end

function J = pidObjective(x, sys)
    controller = pid(x(1), x(2), x(3));
    sys_cl = feedback(controller * sys, 1);
    [y, t] = step(sys_cl);
    e = 1 - y;
    J = trapz(t, abs(e));
end
