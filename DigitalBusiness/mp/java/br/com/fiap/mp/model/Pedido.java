package br.com.fiap.mp.model;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Pedido {
	
	private String nomeProduto;
	private BigDecimal valorProduto;
	private LocalDate dataDaEntrega;
	private String urlProduto;
	private String descricaoProduto;
	private String urlImagem;
	
	public Pedido() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Pedido(String nomeProduto, BigDecimal valorProduto, LocalDate dataDaEntrega, String urlProduto,
			String descricaoProduto, String urlImagem) {
		super();
		this.nomeProduto = nomeProduto;
		this.valorProduto = valorProduto;
		this.dataDaEntrega = dataDaEntrega;
		this.urlProduto = urlProduto;
		this.descricaoProduto = descricaoProduto;
		this.urlImagem = urlImagem;
	}

	public String getNomeProduto() {
		return nomeProduto;
	}

	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}

	public BigDecimal getValorProduto() {
		return valorProduto;
	}

	public void setValorProduto(BigDecimal valorProduto) {
		this.valorProduto = valorProduto;
	}

	public LocalDate getDataDaEntrega() {
		return dataDaEntrega;
	}

	public void setDataDaEntrega(LocalDate dataDaEntrega) {
		this.dataDaEntrega = dataDaEntrega;
	}

	public String getUrlProduto() {
		return urlProduto;
	}

	public void setUrlProduto(String urlProduto) {
		this.urlProduto = urlProduto;
	}

	public String getDescricaoProduto() {
		return descricaoProduto;
	}

	public void setDescricaoProduto(String descricaoProduto) {
		this.descricaoProduto = descricaoProduto;
	}

	public String getUrlImagem() {
		return urlImagem;
	}

	public void setUrlImagem(String urlImagem) {
		this.urlImagem = urlImagem;
	}
	
	
}
