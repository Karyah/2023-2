// See https://aka.ms/new-console-template for more information
Console.WriteLine("Hello, World!");


static void Main(string[] args) {
    Conta conta = new Conta("karen antiquera",1234569872, 50000);

    conta.Creditar(2525);
    Console.WriteLine("Crédito Conta:" + conta.saldo)
    conta.Depositar(10);
    conta.Sacar(500);
    conta.Sacar(900000);

    Juridica juridica = new Juridica();

    juridica.Creditar(900);
    Console.WriteLine("Crédito Jurídica:" + juridica.saldo);
    juridica.Sacar(200);

}
