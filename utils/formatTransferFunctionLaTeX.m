function tf_latex = formatTransferFunctionLaTeX(num, den)
    % Format transfer function as LaTeX string
    % num and den are arrays of numerator and denominator coefficients

    % Format numerator and denominator as LaTeX strings
    num_str = formatPolynomialLaTeX(num);
    den_str = formatPolynomialLaTeX(den);

    % Combine into LaTeX fraction format
    tf_latex = ['\frac{' num_str '}{' den_str '}'];
end

function poly_str = formatPolynomialLaTeX(coefs)
    % Format polynomial coefficients as LaTeX string
    n = length(coefs);
    terms = {};

    for i = 1:n
        coef = coefs(i);
        power = n - i;

        if coef == 0
            continue; % Skip zero coefficients
        end

        % Format coefficient
        if coef == 1 && power ~= 0
            coef_str = ''; % No need to show "1" for terms with variables
        elseif coef == -1 && power ~= 0
            coef_str = '-'; % Show "-" for negative one
        else
            coef_str = num2str(coef);
        end

        % Format variable part
        if power == 0
            var_str = ''; % No variable for constant terms
        elseif power == 1
            var_str = 's'; % First power: just 's'
        else
            var_str = ['s^{' num2str(power) '}']; % Higher powers
        end

        % Combine coefficient and variable
        term = [coef_str var_str];
        terms{end+1} = term; %#ok<AGROW>
    end

    % Combine terms with plus/minus signs
    if isempty(terms)
        poly_str = '0'; % Zero polynomial
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
