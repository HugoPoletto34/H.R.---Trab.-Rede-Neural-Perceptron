public class Neuronio {
    public static void main(String[] args) {
        int tam = 5;
        int mat[][] = new int[tam][3];

        double w1 =  0.0;
        double w2 = 0.8;

        double taxaApre = 0.05;

        for (int i = 0; i < tam; i++) {
            int j = 0;
            mat[i][j] = i + 1;
            mat[i][j + 1] = i + 1;
            mat[i][j + 2] = mat[i][j] + mat[i][j + 1];
        }

        double erro;
        for (int i = 0; i < tam; i++) {
            int j = 0;
            erro = mat[i][j + 2] - (mat[i][j] * w1 + mat[i][j + 1] * w2);
            w1 = w1 + erro * taxaApre * mat[i][j];
            w2 = w2 + erro * taxaApre * mat[i][j + 1];
        }

        for (int i = 0; i < tam + 10; i++) {
            System.out.println((i + 1) + " + " + (i + 1) + " = " + ((i + 1) * w1 + (i + 1) * w2));
        }
    }
}
