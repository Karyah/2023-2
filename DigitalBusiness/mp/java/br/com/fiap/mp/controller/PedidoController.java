package br.com.fiap.mp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.fiap.mp.dto.RequisicaoNovoPedido;
import br.com.fiap.mp.model.Pedido;
import br.com.fiap.mp.repositories.PedidoRepository;
import jakarta.transaction.Transactional;

@RestController
@RequestMapping("/pedido")
public class PedidoController {
	
	@Autowired
	private PedidoRepository repository;
	
	@GetMapping("/formulario")
	public ModelAndView formulario() {
		ModelAndView mv = new ModelAndView("pedido/formulario");
		return mv;
	}
	
	@PostMapping("/novo")
	@Transactional
	public ModelAndView novo(RequisicaoNovoPedido requisicao){
		Pedido pedido = new Pedido(requisicao);
		repository.save(pedido);
		ModelAndView mv = new ModelAndView("redirect:/home");
		return mv;
	}
}
