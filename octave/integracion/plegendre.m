function [pol, zero] = plegendre(n)
    syms x;
    var= sym('x');

    frac = 1 / ((factorial(n)) * (2^n));
    exp = ((x^2)-1)^n;
    df = diff(exp, x, n);
    pol = (simplify(frac * df));
    zero = double(solve(pol, x));
end