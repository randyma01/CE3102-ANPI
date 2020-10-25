function x = thomas2(a, b, c, d)
    n = length(d);
    w(1) = b(1);
    g(1) = d(1)/w(1);

    for i = 2:n
        w(i) = b(i) - a(i)*c(i-1)/w(i-1); g(i) = (d(i) - a(i)*g(i-1))/w(i);
    end

    x(n) = g(n); 
    for i = n-1:-1:1
        x(i) = g(i) - c(i)*x(i+1)/w(i);
    end
end