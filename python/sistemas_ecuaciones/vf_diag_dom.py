import numpy as np

"""
Esta funcion verifica que una matriz sea del
tipo: diagonalmente dominante.
Es decir, el valor absoluto del elemento de
la diogonal, es mayor a la suma de los
valores en valor absoluto del resto de la
fila.

Firma:
    bool = vf_diag_dom(A,b)

Entradas:
    A = matriz de coeficientes
    m = cantidad de filas

Salida:
    bool = valor booleano (1 o 0)
"""


def vf_diag_dom(a, m):
    # declaracion: valor resultante #
    bool = False

    # iteracion: recorrido de la matriz, mientras #
    # se verifica por filas que la matriz sea     #
    # diagonalmente dominante                     #
    for i in range(0, m):

        # declaracion: elemento de la diagonal #
        ed = np.abs(a[i, i])

        # declaracion: suma de los elementos de una #
        # fila excluyendo el elemento diagonal      #
        suma = np.abs(np.sum(a[1])) - ed

        # verificacion: siempre que el elemento diagonal #
        # sea mayor sigue, en caso contrario se sale del #
        # del ciclo                                      #
        if suma < ed:
            bool = True
            continue
        else:
            bool = False
            break

    # retorno: valor resultante #
    return bool


A = [[5, 1, 1], [1, 5, 1], [1, 1, 5]]
a = np.matrix(A)

print(vf_diag_dom(a, 3))
