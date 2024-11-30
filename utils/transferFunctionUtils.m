function validateCoefficients(num, den)
    if isempty(num) || isempty(den)
        error('Coefficients cannot be empty.');
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

function tfLatex = formatTransferFunctionLaTeX(num, den)
    numStr = formatPolynomialLatex(num);
    denStr = formatPolynomialLatex(den);
    tfLatex = ['\frac{' numStr '}{' denStr '}'];
end

function polyStr = formatPolynomialLatex(coefs)
    n = length(coefs);
    terms = {};
    for i = 1:n
        coef = coefs(i);
        power = n - i;
        if coef == 0, continue; end
        if coef == 1 && power ~= 0, coefStr = ''; elseif coef == -1 && power ~= 0, coefStr = '-'; else, coefStr = num2str(coef); end
        varStr = ''; if power > 0, varStr = ['s^{' num2str(power) '}']; end
        terms{end+1} = [coefStr varStr]; %#ok<AGROW>
    end
    polyStr = strjoin(terms, ' + ');
end
