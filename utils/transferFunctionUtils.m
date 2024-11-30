function validateCoefficients(num, den)
    if isempty(num) || isempty(den)
        error('Coefficients cannot be empty.');
    end
    if any(den == 0)
        error('Denominator cannot have zero coefficients.');
    end
end

function tfLatex = formatTransferFunctionLatex(num, den)
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
        coefStr = num2str(coef);
        if power == 0
            varStr = '';
        elseif power == 1
            varStr = 's';
        else
            varStr = ['s^{' num2str(power) '}'];
        end
        terms{end+1} = [coefStr varStr]; %#ok<AGROW>
    end
    polyStr = strjoin(terms, ' + ');
end
