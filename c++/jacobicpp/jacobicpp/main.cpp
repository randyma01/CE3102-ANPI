#include <stdio.h>
#include <stdlib.h>

#define n 10

using namespace std;

void Jacobi(float A[n][n], float b[n], int dim);
float Norma(float vector1[],float vector2[], int dim);
float SumaJacobi(float Matriz[], float vector[], int componente, int dim);

int main(){
    
    int dim = 3;

    float A[n][n] = {
         {5, 1, 1},
         {1, 5, 1},
         {1, 1, 5}
    };

    float b[n] = {7, 7, 7};

    
    Jacobi(A, b, dim);
    

    return 1;
}

/**
 * Esta funcion encuentra la solucion a un sistema 
 * de ecuaciones representado mediante la expresion:
 * A * x = b, utilizando el metodo de Jacobi.
 *
 *
 * @param A matriz de coeficientes
 * @param b vector de terminos independientes
 * @param dim dimension de la matriz
 *
 */
void Jacobi(float A[n][n], float b[n], int dim){

    // declaracion: contadores para los recorridos //
    int i, j;
    
    // declaracion: numero de iteraciones realizadas //
    int iteraciones = 0;

    // declaracion: tol (10^-8) //
    float tol = 0.0000000010;

    // declaracion: vector de error //
    float err = tol + 1;
  
    // declaracion: vector resultante //
    float x[dim];
    
    // declarcion: vector del calculo anterior //
    // este vector contiene los valores iniciales //
    float x_prev[dim];
    
    // declaracion: vector de los elementos de las diagonales //
    float aux[dim];

    // iteracion: mientras el error sea mayor que la //
    // tolerancia se ejecuta la serie que realiza el //
    // el calculo del vector resultante utilizando   //
    // la formula no matricial de Jacobi.            //
    while (tol < err){
        
        // iteracion: declaracion: del vector de la digonal de la matriz A //
        for(i = 0; i < dim; i++){
            for(j = 0; j < dim; j++){
                aux[j] = A[i][j];
            }
            
            // calculo: vector resultante mediante la formula de jacobi //
            x[i] = (1/A[i][i]) * (b[i] - SumaJacobi(aux, x_prev, i, dim));
        }
        
        // calculo: calcula de la norma del vector^ anterior y el vector^ actual //
        // ^ = vector resultante iniciando con los valores iniciales de 0's
        err = Norma(x, x_prev, dim);
    
        // iteracion: para mostrar en pantalla los resultados calculados //
        printf("\n\n Iteracion %d: \n", iteraciones);
        for(i = 0; i < dim;i ++){
            x_prev[i] = x[i];
            printf("X(%d)=%f \n", i, x[i]);
        }

        // aumento del contador de iteraciones realizadas //
        iteraciones++;
    }

    // iteracion: para mostrar en pantalla los resultados calculados //
    printf("Solucion del sistema\n");
    printf("Numero de iteraciones: %d \n", iteraciones);
    for(i = 0; i < dim; i++){
        printf("x(%d)=%f\n", i, x[i]);
    }
}

/**
 * Funcion que realiza el calculo de la norma de dos 
 * vectores dados utilizando la norma 2. %
 *
 *
 * @param vector_uno vector uno o A
 * @param vector_dos vector dos o B
 * @param dim entero de la dimension de la matriz
 *
 * @return norma de los vectores uno (A) y dos (B)
 */
float Norma(float vector_uno[], float vector_dos[], int dim){

    // declaracion: valor resultante //
    float norma = 0;

    // declaracion: variable del contador //
    int i;

    // itereacion: realiza el calcula de la norma por medio de una serie //
    for(i = 0; i < dim ; i++){
        // calculo: de la norma de los vectores resultante (anterior y actual)//
        norma = norma + (vector_uno[i] - vector_dos[i]) * (vector_uno[i] - vector_dos[i]);
    }

    // retorno: valor resultante //
    return norma;
}

/**
 * Funcion que realiza el calculo del vector resultante 
 * mediante la formula de la serie de jacobi.
 *
 *
 * @param vector_d vector de las diagonales
 * @param vector_prev vector resultante anterior
 * @param fila entero de la fila que se esta reccoriendo 
 * @param dim entero de la dimension de la matriz
 *
 * @return suma resultante de la serie
 */
float SumaJacobi(float vector_d[], float vector_prev[], int fila, int dim){
    
    // declaracion: valor resultante //
    float suma = 0;
    
    // declaracion: variable del contador //
    int i;

    // itereacion: realiza la suma de la serie de la formula de jacobi //
    for(i = 0; i < dim; i++){
        if (fila!= i){
            suma = suma + vector_d[i] * vector_prev[i];
        }
    }

    // retorno: valor resultante //
    return suma;
}