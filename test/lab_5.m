clc;
clear;
close all;

% pkg load symbolic;

% syms x;

% x = lab_4(-x-2)

% ---- manejo de funciones ---- %

% funcion anonimas o handle o normales
funcion_normal = @(x) (2 * x) + 3

% convertir de funcion normal a funcion simbolica
funcion_simbolica = sym (funcion_normal)

% convertir de funcion simbolica a funcion normal
funcion_normal_2 = matlabFunction(funcion_simbolica)

display('% ---- ------------------- ---- %')

% funcion en string
funcion_normal_string = '@(x) - x + 2'

% convertir de funcion en string a funcion normal
funcion_normal_nueva = str2func(funcion_normal_string)

% convertir de funcion normal a funcion en string
funcion_normal_string_2 = func2str(funcion_normal_nueva)

display('% ---- ------------------- ---- %')

% funcion en string 
funcion_normal_string_nueva = '- x + 2'

% convertir de funcion en string a funcion simbolica
funcion_simbolica_nueva = sym(funcion_normal_string_nueva)

% convertir de funcion simbolica a funcion en string
funcion_normal_string_nueva_2 = char(funcion_simbolica_nueva)

display('% ---- ------------------- ---- %')

