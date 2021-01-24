function [I, cota]= regla_trapecio_compuesto(f, a, b, n)
    h = (b - a) / (n - 1);
    valores = [a];
    atemp = a + h;
    
    while (atemp< b)
        valores = [valores atemp];
        atemp = atemp + h;
    end
    
    valores = [valores b];
    
    syms x;
    var= sym('x');
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

    while ( j < i)
        si = f1(s(i));
        ev = [ev si];
        ++j;
    end

    res = 0;
    
    for i=(1 : numel(valores))
        if( i == 1 || i == (numel(valores)))
            res += f1(valores(i));
        else
            res += f1(valores(i)) * 2;
        end
    end

    I = res * (h / 2);

    cota = ((b - a) * (h**2) / 12) * max(ev);
end