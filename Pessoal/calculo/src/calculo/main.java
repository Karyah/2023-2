package calculo;

import java.util.Scanner;

public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
			
		
		double cargaTotal = 800;
		
		Calculo calculo = new Calculo();
		
		for(int i = 0; i<=6; i++) {
			
			Scanner ent = new Scanner(System.in);
			System.out.println("digite a média");
			double media = ent.nextDouble();
			System.out.println("digite a carga");
			double carga = ent.nextDouble();
			
			calculo.calcular(media, carga);
			
		}
		
		System.out.println(calculo.soma);
		
		System.out.println("Média final:"+ (calculo.soma / cargaTotal));
	
	}
	
}
