function validateCoefficients(num, den)
    % Validate transfer function coefficients
    if isempty(num) || isempty(den)
        error('Coefficients cannot be empty.');
    end
    if ~isnumeric(num) || ~isnumeric(den)
        error('Coefficients must be numeric.');
    end
    if any(~isfinite(num)) || any(~isfinite(den))
        error('Coefficients must be finite numbers.');
    end
    if length(den) < 1 || den(1) == 0
        error('The leading coefficient of the denominator cannot be zero.');
    end
end
