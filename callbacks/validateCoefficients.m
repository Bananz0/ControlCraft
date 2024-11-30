function validateCoefficients(num, den)
    if isempty(num) || isempty(den)
        error('Numerator or Denominator cannot be empty.');
    end
    if any(den == 0)
        error('Denominator cannot have zero coefficients.');
    end
end
