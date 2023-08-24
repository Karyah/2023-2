package br.com.fiap.mp.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import br.com.fiap.mp.model.Pedido;
import br.com.fiap.mp.repositories.PedidoRepository;


@RestController
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private PedidoRepository pedidoRepository;
	
	@GetMapping
	public ModelAndView home() {
		List<Pedido> pedidos = pedidoRepository.findAll();
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("pedidos", pedidos);
		
		return mv;
	}
}
