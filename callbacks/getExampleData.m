function examples = getExampleData()
    examples(1).name = 'Custom';
    examples(1).num = '1';
    examples(1).den = '1 1 1';
    examples(1).tooltip = 'Custom transfer function. Input coefficients manually.';

    examples(2).name = 'Inverted Pendulum';
    examples(2).num = '1';
    examples(2).den = 's^2 - 9.8';
    examples(2).tooltip = 'Inverted Pendulum: Found in Lecture Notes Section 5.1';

    examples(3).name = 'Mass-Spring-Damper System';
    examples(3).num = '1';
    examples(3).den = 's^2 + 2*s + 5';
    examples(3).tooltip = 'Mass-Spring-Damper System: Lecture Notes Section 4.1';

    examples(4).name = 'Proportional Controller';
    examples(4).num = '1';
    examples(4).den = '1';
    examples(4).tooltip = 'Proportional Controller: Discussed in Lecture Notes Section 4.4';

    examples(5).name = 'Proportional-Integral (PI) Controller';
    examples(5).num = '1';
    examples(5).den = '1*s';
    examples(5).tooltip = 'PI Controller: Found in Lecture Notes Section 4.5';

    examples(6).name = 'Proportional-Derivative (PD) Controller';
    examples(6).num = '1 + 0.1*s';
    examples(6).den = '1';
    examples(6).tooltip = 'PD Controller: Derived from Lecture Notes Section 4.6';

    examples(7).name = 'Three-Term PID Controller';
    examples(7).num = '1';
    examples(7).den = '1 + s + s^2';
    examples(7).tooltip = 'PID Controller: Detailed in Lecture Notes Section 4.7';

    examples(8).name = 'Nyquist Stability Example';
    examples(8).num = '1';
    examples(8).den = 's*(4*s + 1)*(6*s + 1)'; % Added '*' operators
    examples(8).tooltip = 'Nyquist Stability: Referenced in Tutorial Questions, Problem 3';

    examples(9).name = 'Closed-Loop Gain Variation';
    examples(9).num = '1';
    examples(9).den = '1 + k*(s + 3)^2'; % Added '*' operator
    examples(9).tooltip = 'Closed-Loop Gain Variation: Found in Lecture Notes Section 6.2';

    examples(10).name = 'First-Order System';
    examples(10).num = '1';
    examples(10).den = 's + 1';
    examples(10).tooltip = 'First-Order System: Found in Lecture Notes Section 3.1';

    examples(11).name = 'Second-Order Underdamped System';
    examples(11).num = '1';
    examples(11).den = 's^2 + 0.5*s + 4';
    examples(11).tooltip = 'Second-Order Underdamped: Lecture Notes Section 3.4';

    examples(12).name = 'Root Locus Gain Variation';
    examples(12).num = '1';
    examples(12).den = 's*(s + 3)^2'; % Added '*' operator
    examples(12).tooltip = 'Root Locus Example: Discussed in Lecture Notes Section 7.3';
end
