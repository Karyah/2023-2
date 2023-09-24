package com.fiap.Funko.dto;

import java.math.BigDecimal;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

public record RequisicaoNovoFunko(
		@NotBlank 
		@Size(min = 5, max = 250, message = "quantidade mínima de 5 e máxima de 250 caracteres")
		String nomeFunko, 
		
		@NotBlank
		BigDecimal valorFunko,
		
		@NotBlank
		String urlFunko,
		@NotBlank
		String urlImagem1,
		
		@NotBlank
		String urlImagem2,
		
		String descricao
		) 
{

}
