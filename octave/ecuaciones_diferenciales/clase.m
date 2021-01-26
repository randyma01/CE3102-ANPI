clc; clear; close;

f=@(x,y) y-x^2+1;

a=0; b=2; N=5;

h=(b-a)/(N-1);
% Preimagenes (x)
x=a:h:b;

% Metodo de Euler
y_e=[0.5];
for n=1:N-1;
  % Formula del Metodo de Euler
  y_e(n+1)=y_e(n)+h*f(x(n),y_e(n)); % Imagenes (y)
end

% Metodo de Predictor-Colector
% Da una mejor aproximacion que Euler
y_pc=[0.5];
for n=1:N-1;
  y_aux=y_pc(n)+h*f(x(n),y_pc(n)); % Predictor
  y_pc(n+1)=y_pc(n)+h*(f(x(n),y_pc(n))+f(x(n+1),y_aux))/2; % Corrector
end

% Metodo de Runge-Kutta de orden 2
% Da una mejor aproximacion que Predictor-Colector
y_rk2=[0.5];
for n=1:N-1;
  k1=f(x(n),y_rk2(n));
  k2=f(x(n)+h/2,y_rk2(n)+h*k1/2);
  y_rk2(n+1)=y_rk2(n)+h*k2;
end

% Graficar puntos del Metodo de Euler, Predictor-Corrector y Runge-Kutta de orden 2
hold on
scatter(x,y_e,'b')
scatter(x,y_pc,'g')
scatter(x,y_rk2,'k')

plot(x,y_e,'b')
% Grafica los puntos
%scatter(x,y)


% Graficar la solucion exacta

% La aproximacion es buena en los primeros puntos
x_t=0:0.001:2;
y_t=(x_t+1).^2-0.5*exp(x_t);
hold on
plot(x_t,y_t,'r')