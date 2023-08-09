package calculo;

public class Calculo {
	
	public double soma;
	
	
	
	public Calculo() {
		super();
		// TODO Auto-generated constructor stub
	}



	public void calcular(double media, double carga) {
		this.soma = this.soma + (media * carga);
	}
	
}
