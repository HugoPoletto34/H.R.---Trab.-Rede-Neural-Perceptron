public class Neuronio {
    public static void main(String[] args) {
        int tam = 50;
        int vet[] = new int[tam * 3]; // vetor será usada p/ treinar o neurônio

        double w1 =  0.0; // peso1 para a entrada
        double w2 = 0.8; // peso2 para a entrada

        double taxaApre = 0.0001; // taxa de aprendizado do neurônio

        // criando o vetor
        int cont = 0;
        for (int i = 0; i < tam * 3; i+=3) {

            vet[i] = cont + 1;
            vet[i + 1] = cont + 1;
            vet[i + 2] = vet[i] + vet[i + 1];
            cont++;
        }

        // processo de treinamento do neurônio
        double erro;
        for (int i = 0; i < tam * 3; i+=3) {

            erro = vet[i + 2] - (vet[i] * w1 + vet[i + 1] * w2); // calcula o quão distante o resultado do neurônio ficou do resultado real
            w1 = w1 + erro * taxaApre * vet[i]; // atualiza o peso1
            w2 = w2 + erro * taxaApre * vet[i + 1]; // atualiza o peso2
        }

        // imprime os resultados que o neurônio fez
        for (int i = 0; i < tam * 3 + 6; i++) {
            System.out.println((i + 1) + " + " + (i + 1) + " = " + ((i + 1) * w1 + (i + 1) * w2));
        }
    }
}
