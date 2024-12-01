function coefs = parsePolynomialInput(polyStr)
    if isempty(polyStr)
        error('Input cannot be empty.');
    end

    % Check if the input contains 's' or '^'
    if contains(polyStr, 's') || contains(polyStr, '^')
        % Parse as symbolic expression
        syms s
        % Ensure multiplication is explicit in the string
        expr = str2sym(polyStr);
        % Expand the expression to get all terms
        expr = expand(expr);
        % Get coefficients
        coefs = sym2poly(expr);
    else
        % Parse as numeric coefficients
        coefs = str2num(polyStr); %#ok<ST2NM>
        if isempty(coefs)
            error('Invalid numeric coefficients.');
        end
    end
end