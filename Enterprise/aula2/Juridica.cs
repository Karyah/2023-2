
using System.Transactions;

public class Juridica : Conta {
    public int cnpj;
    public void Creditar(double valor) {
        Creditar(valor + 500);
    }

}