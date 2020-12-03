public class Neuronio {
    public static void main(String[] args) {
        int tam = 50;
        int vet[] = new int[tam * 3];

        double w1 =  0.0;
        double w2 = 0.8;

        double taxaApre = 0.0001;
        int cont = 0;
        for (int i = 0; i < tam * 3; i+=3) {

            vet[i] = cont + 1;
            vet[i + 1] = cont + 1;
            vet[i + 2] = vet[i] + vet[i + 1];
            cont++;
        }

        double erro;
        for (int i = 0; i < tam * 3; i+=3) {

            erro = vet[i + 2] - (vet[i] * w1 + vet[i + 1] * w2);
            w1 = w1 + erro * taxaApre * vet[i];
            w2 = w2 + erro * taxaApre * vet[i + 1];
        }

        for (int i = 0; i < tam * 3 + 500; i++) {
            System.out.println((i + 1) + " + " + (i + 1) + " = " + ((i + 1) * w1 + (i + 1) * w2));
        }
    }
}
