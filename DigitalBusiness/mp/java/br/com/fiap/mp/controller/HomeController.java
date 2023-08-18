package br.com.fiap.mp.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import br.com.fiap.mp.model.Pedido;


@Controller
@RequestMapping("/home")
public class HomeController {
	
	@GetMapping
	public String home(Model model) {
		Pedido pedido = new Pedido();
		pedido.setNomeProduto("Big Mac");
		pedido.setUrlImagem("https://cache-backend-mcd.mcdonaldscupones.com/media/image/product$kzXCTbnv/200/200/original?country=br");
		pedido.setUrlProduto("https://www.mcdonalds.com.br/cardapio/sanduiches-de-carne-bovina/big-mac");
		pedido.setDescricaoProduto("Dois hambúrgueres (100% carne bovina), alface americana, queijo sabor cheddar, molho especial, cebola, picles e pão com gergelim.");
		List<Pedido> pedidos = Arrays.asList(pedido);
		model.addAttribute("pedidos", pedidos);
		return "home";
	}
}
