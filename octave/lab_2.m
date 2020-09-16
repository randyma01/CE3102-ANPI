function [respuesta]=lab_2(a,b)
  f=@(x,y)(2*x)+y; 
  respuesta = f(a,b);
  if (f(a,b) < 5)
    respuesta = "hola";
  else
    respuesta = "adios";
  end
end


[respuesta]=lab_2(6,8)
