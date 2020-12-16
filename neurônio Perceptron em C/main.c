#include <stdio.h>
#include <stdlib.h>
#include <locale.h>
int main()
{
    setlocale(LC_ALL, "portuguese");

    float dadoA = 0, dadoB = dadoA;
    float valorA, valorB;
    float pesoA = 1.3, pesoB = 2.2;
    float multA, multB;
    float taxaDeAprendizado = 0.0005;
    float saidaDesejada;
    float saidaNeuronio;
    float erro;
    int etapa = 5;

    for (int i = 0; i < etapa; i++)
    {
        printf("\n %i ° Etapa:\n", etapa);
        for(int j = 0; j < 5; j++)
        {

        dadoA = dadoA + 3;
        dadoB = dadoB + 3;
        saidaDesejada = dadoA + dadoB;
        valorA = dadoA * pesoA;
        valorB = dadoB * pesoB;
        saidaNeuronio = valorA + valorB;
        erro = saidaDesejada - saidaNeuronio;
        printf("Sendo a soma de %f e %f o resultado foi: %f sendo a saida desejada: %f \n", dadoA, dadoB, saidaNeuronio, saidaDesejada);
        multA = erro * taxaDeAprendizado * dadoA;
        pesoA = pesoA + multA;
        multB = erro * taxaDeAprendizado * dadoB;
        pesoB = pesoB + multB;
        }
    }
    system("pause");
    return 0;
}
