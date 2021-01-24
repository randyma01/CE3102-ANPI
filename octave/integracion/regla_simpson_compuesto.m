function [I ,cota]= simpson_compuesta(f,a,b,n)
    h = (b - a) / (n - 1);
    valores = [a];
    atemp = a + h;
    
    while (atemp < b)
        valores = [valores atemp];
        atemp = atemp + h;
    end
    
    valores = [valores b];
    syms x;
    var= sym('x');

    f1 = matlabFunction(sym(f));
    dfp = matlabFunction(diff(sym(f1)));
    dfs = matlabFunction(diff(sym(dfp)));
    dft = matlabFunction(diff(sym(dfs)));
    dfc = matlabFunction(diff(sym(dft)));

    s = solve(dfc, x);
    i = length(s);
    j = 1;
    ev = [];
    sa = abs(dfc(a));
    sb = abs(dfc(b));
    ev = [ev sa sb];
    
    while (j < i)
        si=abs(dfc(s(j)));
        ev=[ev si];
        ++j;
    end
    
    res = 0;
    respar = 0;
    resimpar = 0;

    for (i = 1 : numel(valores))
        if (i==1 || i == (numel(valores)))
            res += f1(valores(i));
        elseif(mod(i, 2) == 0)
            resimpar += f1(valores(i));
        else
            respar += f1(valores(i));
        end
    end

    res = res + (2 * respar) + (4 * resimpar);
    cota = (((b - a) * (h**4)) / 180) * max(ev);
    I = (h / 3) * res;
end


% f = @(x) log(x)
% a = 2
% b = 5
% n = 4

% [I, cota] = regla_simpson_compuesto(f, a, b, n)