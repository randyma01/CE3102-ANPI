function = gradiente_conjugado(f, t, x0, tol, iterMax)

    pkg load symbolic
    syms x y z

    error = tol + 1;
    e = [];
    x_t = [];
    
    fs = sym(f);
    fh = matlabFunction(fs);

    gr = gradient(fs, [x y]);

    xk = x0(1,1);
    yk = x0(1,2);

    gk = double(subs(gr, [x y], [sym(xk,'r') sym(yk, 'r')]));

    dk = -gk;

    for (i = 1 : iterMax)
        ak = 1;

        x_t = [xk yk]';

        z_t = x_t + ak * dk;

        delta = rand(1);
        
        izq = double(subs(fs, [x y], [sym(z_t(1), 'r') sym(z_t(2), 'r')])) - double(subs(fs, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]));
        der = delta * ak * gk' * dk;

        k = 0
        while(izq > der)
            k
            ak = ak/10;
            z_t = x_t + ak * dk;
            izq = double(subs(fs, [x y], [sym(z_t(1), 'r') sym(z_t(2), 'r')])) - double(subs(fs, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]));
            der = delta * ak * gk' * dk;
            ++k;
        end

        x_t = x_t + (ak * dk);

        gk_new = double(subs(gr, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]));

        beta = norm(gk_new)^2/norm(gk)^2;

        dk = -gk_new + beta * dk;

        gk = gk_new;

        %p1 = subs(gr, [x y], [sym(x_t(1), 'r') sym(x_t(2), 'r')]);
        %p2 = double(p1); 

        %error = norm(p2); 

        %e = [e error]; 
        display(x_t');
    end
    %x_t'
    %plot(1:k, e)
    %xlabel('iter (k)')
    %ylabel('Error (|f(x_k)|)')
    %title('Error del Metodo de la Gradiente Conjugado')
    %plot(1 : iter, error)
  
end

% [] = gradiente_conjugado((x - 2)^4 + (x - 2 * y)^2, ["x y"], [0 3], 10^-8, 5)