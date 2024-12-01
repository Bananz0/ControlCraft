function tfLatex = formatTransferFunctionLaTeX(num, den, kValue)
    if nargin < 3
        kValue = 1;
    end

    num_str = formatPolynomialLaTeX(num);
    den_str = formatPolynomialLaTeX(den);

    if kValue ~= 1
        tfLatex = ['k \times \frac{' num_str '}{' den_str '}'];
    else
        tfLatex = ['\frac{' num_str '}{' den_str '}'];
    end
end


function poly_str = formatPolynomialLaTeX(coefs)
    n = length(coefs);
    terms = {};
    for i = 1:n
        coef = coefs(i);
        power = n - i;
        if coef == 0
            continue;
        end
        % Format coefficient
        if coef == 1 && power ~= 0
            coef_str = '';
        elseif coef == -1 && power ~= 0
            coef_str = '-';
        else
            coef_str = num2str(coef);
        end
        % Format variable part
        if power == 0
            var_str = '';
        elseif power == 1
            var_str = 's';
        else
            var_str = ['s^{' num2str(power) '}'];
        end
        % Combine coefficient and variable
        term = [coef_str var_str];
        terms{end+1} = term;
    end
    % Combine terms with plus or minus signs
    if isempty(terms)
        poly_str = '0';
    else
        poly_str = terms{1};
        for k = 2:length(terms)
            if startsWith(terms{k}, '-')
                poly_str = [poly_str ' - ' strrep(terms{k}, '-', '')];
            else
                poly_str = [poly_str ' + ' terms{k}];
            end
        end
    end
end
