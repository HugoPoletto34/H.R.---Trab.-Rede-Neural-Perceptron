#include <stdio.h>
#include <stdlib.h>


int main()
{

    int tam = 50;
    int vet[tam*3];
    float w1 = 1.3;
    float w2 = 2.2;

    float taxaApre = 0.0005;
    int etapa = 3;
    int contador = 1;
    while(contador < etapa)
    {
    printf("\n %i Etapa \n", contador);
           int cont = 0;
                for (int i = 0; i < tam * 3; i+=3)
               {

                    vet[i] = cont + 3;
                    vet[i + 1] = cont + 3;
                    vet[i + 2] = vet[i] + vet[i + 1];
                    cont++;
                }


            for (int i = 0; i < tam * 3 + 6; i++)
            {
                int tempInt = i + 3;
                float tempFloat = tempInt * w1 + tempInt * w2;
                printf (" %i + %i = %.2f\n", tempInt, tempInt, tempFloat);

            }

            float erro;
            for (int i = 0; i < tam * 3; i+=3)
            {
                erro = vet[i + 2] - (vet[i] * w1 + vet[i + 1] * w2);
                w1 = w1 + erro * taxaApre * vet[i];
                w2 = w2 + erro * taxaApre * vet[i + 1];
            }
    contador++;
    }
    system("pause");
    return 0;
}
