function [I, cota]= regla_trapecio(f, a, b)
    syms x;
    var = sym('x');

    f1 = matlabFunction(sym(f));
    dfp = matlabFunction(diff(sym(f1)));
    dfs = matlabFunction(diff(sym(dfp)));
    
    s = solve(dfs, x);
    i = length(s);
    j = 1;
    ev = [];
    sa = abs(dfs(a));
    sb = abs(dfs(b));
    ev = [ev sa sb];
    
    while ( j <= i)
        si = abs(dfs(s(i)));
        ev = [ev si];
        ++j;
    end

    cota = ((b - a)^3 / 12) * max(ev);
    I = ((f1(b) + f1(a)) * (b - a)) / 2; 
end

% a = 2
% b = 5
% f = @(x) log(x)

% [I, cota] = regla_trapecio(f, a, b)