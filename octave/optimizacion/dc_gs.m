function [x_t, error, k] = dc_gs(f, t, x0, tol, iterMax)

  pkg load symbolic
  syms x y z

  %f1 = str2func(f);
  fs = sym(f);
  fh = matlabFunction(fs);

  gr = gradient(fs, [x, y, z]);

  xk = x0(1,1);
  yk = x0(1,2);
  zk = x0(1,3);

  k = 0;

  error = tol + 1;
  e = [];
  x_t = [];

  while (tol < error && k < iterMax) 

    fx = @(x) fh(x, yk, zk);
    xk = fminsearch(fx, xk);

    fy = @(y) fh(xk, y, zk);
    yk = fminsearch(fy, yk);

    fz = @(z) fh(xk, yk, z);
    zk = fminsearch(fz, zk);

    p1 = subs(gr, [x y z], [sym(xk, 'r') sym(yk, 'r') sym(zk, 'r')]); 
    p2 = double(p1); 
    error = norm(p2); 
    e = [e error]; 

    ++k;
  end
  x_t = [xk, yk, xk]
  plot(1:k, e)
  xlabel('iter (k)')
  ylabel('Error (|f(x_k)|)')
  title('Error del Metodo de la Descenso Coordinado')
  
end

% 1
% [x_t, error, k] = dc_gs('@(x, y, z)x^3 + y^3 + z^3 - 2 * (x * y + x * z + y * z)', ['x y z'], [1 1 1], 10^-8, 9)

% 2
% [x_t, error, k] = dc_gs( x^3 + y^3 + z^3 - 2 * (x * y + x * z + y * z), ['x y z'], [1 1 1], 10^-8, 9)