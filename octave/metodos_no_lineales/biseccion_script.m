%Ejemplo para encontrar una solucion de la ecuacion 
% e^x-x-2=0 en [0,2]
clc; clear; close all
f=@(x)exp(x)-x-2;
a=0; b=2;
if f(a)*f(b)<=0  %Verificar que se cumpla el Teorema de Bolzano
  tol=10^-8;
  error=tol+1;
  k=0; e=[];
  while error>tol  %Falta poner otra codicion de parada: Iteracione M�ximas
    k=k+1;
    x=(a+b)/2;
    if f(a)*f(x)<=0 %[a,x] cumple el teorema de Bolzano
      b=x;
    else %[x,b] cumple el teorema de Bolzano
      a=x;
    end  
    error=abs(f(x));
    e=[e error];
  end
  x
  error
  k
  plot(1:k,e)
  xlabel('Iteraciones (k)')
  ylabel('Error (|f(x_k)|)')
  title('Error del Metodo de la Biseccion')
else
  display('No cumple la condicion del Teorema de Bolzano')  
end
