package com.fiap.Funko.model;

import java.math.BigDecimal;
import java.time.LocalDate;

import com.fiap.Funko.dto.RequisicaoNovoFunko;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity(name="Funko")
@Table(name="funko")
public class Funko {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private Long id;
	private String nomeFunko;
	private BigDecimal valorFunko;
	private LocalDate dataDaEntrega;
	private String urlFunko;
	private String descricao;
	private String urlImagem1;
	private String urlImagem2;
	@Enumerated(EnumType.STRING)
	public StatusFunko status;
	
	public Funko() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Funko(Long id, String nomeFunko, BigDecimal valorFunko, LocalDate dataDaEntrega, String urlFunko,
			String descricao, String urlImagem1, String urlImagem2) {
		super();
		this.id = id;
		this.nomeFunko = nomeFunko;
		this.valorFunko = valorFunko;
		this.dataDaEntrega = dataDaEntrega;
		this.urlFunko = urlFunko;
		this.descricao = descricao;
		this.urlImagem1 = urlImagem1;
		this.urlImagem2 = urlImagem2;
		this.status = StatusFunko.AGUARDANDO;
	}

	public Funko(RequisicaoNovoFunko requisicao) {
		this.nomeFunko = requisicao.nomeFunko();
		this.descricao = requisicao.descricao();
		this.urlFunko = requisicao.urlFunko();
		this.urlImagem1 = requisicao.urlImagem1();
		this.urlImagem2 = requisicao.urlImagem2();
		this.status = StatusFunko.AGUARDANDO;
		
	}
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNomeFunko() {
		return nomeFunko;
	}

	public void setNomeFunko(String nomeFunko) {
		this.nomeFunko = nomeFunko;
	}

	public BigDecimal getValorFunko() {
		return valorFunko;
	}

	public void setValorFunko(BigDecimal valorFunko) {
		this.valorFunko = valorFunko;
	}

	public LocalDate getDataDaEntrega() {
		return dataDaEntrega;
	}

	public void setDataDaEntrega(LocalDate dataDaEntrega) {
		this.dataDaEntrega = dataDaEntrega;
	}

	public String getUrlFunko() {
		return urlFunko;
	}

	public void setUrlFunko(String urlFunko) {
		this.urlFunko = urlFunko;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public String getUrlImagem1() {
		return urlImagem1;
	}

	public void setUrlImagem1(String urlImagem1) {
		this.urlImagem1 = urlImagem1;
	}

	public String getUrlImagem2() {
		return urlImagem2;
	}

	public void setUrlImagem2(String ulrImagem2) {
		this.urlImagem2 = ulrImagem2;
	}
	
	
	
}
