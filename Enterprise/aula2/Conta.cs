
public class Conta
{
    public String nome;
    public int cpf;
    private double saldo;

    public Conta() { }

    public Conta(String nome, int cpf, double saldo)
    {
        this.nome = nome;
        this.cpf = cpf;
        this.saldo = saldo;
    }

    public double ExibirSaldo()
    {
        return saldo;
    }

    public void Depositar(double valor){
        this.saldo = this.saldo + valor;
    }

    public void Sacar(double valor)
    {
        if (valor >= this.saldo) {
            Console.WriteLine("Saldo insuficiente");
        }else

        
        this.saldo = this.saldo - valor;
    }

    public void Creditar(double valor)
    {
        this.saldo = this.saldo + valor;
    }

}


