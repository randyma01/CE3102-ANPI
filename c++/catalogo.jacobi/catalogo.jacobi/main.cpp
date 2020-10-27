#include<iostream>
#include<stdlib.h>
#define n 10
using namespace std;



/**
 * Prototipo de la funcion de Jacbi
 */
void Jacobi(int l, float x[], float a[][10], float b[]);

/**
 * Funcion principal
 */
int main() {
    // declaracion: dimension de columnas //
    int i;
    
    // declaracion: dimension de columnas //
    int j;
    
    // declaracion: numero de ecuaciones o incognitas //
    int l = 3;
    
    // declaracion: contador general //
    int cont = 0;
    
    // declaracion: vector de las incognitas //
    float x[n];
    
    // declaracion: matriz de los coeficientes //
    float a[n][n] = {
        {5, 1, 1},
        {1, 5, 1},
        {1, 1, 5}
    };
    
    // declaracion: vector de los terminos independientes //
    float b[n] = {7, 7, 7};
    
    // declaracion: valor diagonal dominante //
    float dd = 0.0;
    
    // declaracion: resultado de las sumas de als filas //
    float suma;
   
    // verificacion: la matriz debe ser diagonalmente dominante //
    for(i = 0; i < l; i++){
        suma = 0;
        for(j = 0; j < l; j++){
            if(i == j){
                dd = a[i][j];
            }else{
                suma += a[i][j];
            }
        }
        if(suma < dd){
            cont++;
        }
    }
    if(cont == l){
        Jacobi(l, x, a, b);
    }else{
        cout<<"La matriz no es diagonalmente dominante."<<endl;
    }
     return 0;
}

/**
 *
 * Esta funcion encuentra la solucion a un sistema
 * de ecuaciones representado mediante la expresion:
 * % A * x = b, utilizando el metodo de Jacobi.
 *
 *
 *
 *
 */
void Jacobi(int l, float x[], float a[][10], float b[]){
    float c[n];
    int k, i, j;
   
    for(k = 0; k < 30; k++){
        for(i = 0;i < l; i++) {
            c[i] = b[i];
            for(j = 0; j < l;j++) {
                if(i != j) {
                    c[i] = c[i] - a[i][j] * x[j];
                }
            }
        }
        
        for(i = 0; i < n; i++) {
            x[i] = c[i] / a[i][i];
        }
    }
    
    cout<<"La solucion es: "<<endl;
    for(i = 0; i < l; i++) {
        cout<<"x("<< i <<") = "<< x[i]<< endl;
    }
    
    cout<<"Iteraciones= "<< k << endl;
}


