function [x, error, k] = dc_gs(f, t, x_t, tol, iterMax)
  fs = sym(f);
  gr = gradient(fs, [x, y, z]);
  k = 0;
  e = []
  
  while (tol < error && k < iterMax) 

    fx = @(x) f(x, yk, zk);
    xk = fminsearch(fx, xk);
    fy = @(y) f(xk, y, zk);
    yk = fminsearch(fy, yk);
    fz = @(z) f(xk, yk, z);
    zk = fminsearch(fz, zk);
    p1 = subs(gr, [x y z], [sym(xk, 'r') sym(yk, 'r') sym(zk, 'r')]); 
    p2 = double(p1); 

    error = norm(p2) 

    e = [e error]; 
    ++k;
  end
  plot(1:k, e)
  xlabel('iter (k)')
  ylabel('Error (|f(x_k)|)')
  title('Error del Metodo de la Descenso Coordinado')
end

% [x, err, iter] = dc_gs( x^3 + y^3 + z^3 - 2 * (x * y + x * z + y * z), [x y z], [1 1 1], 10^-8, 9)