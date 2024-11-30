function validateCoefficients(num, den)
    if isempty(num) || isempty(den)
        error('Coefficients cannot be empty.');
    end
    if ~isnumeric(num) || ~isnumeric(den)
        error('Coefficients must be numeric.');
    end
    if any(~isfinite(num)) || any(~isfinite(den))
        error('Coefficients must be finite numbers.');
    end
    if length(den) < 1
        error('Denominator must have at least one coefficient.');
    end
    if den(1) == 0
        error('Leading coefficient of denominator cannot be zero.');
    end
end
