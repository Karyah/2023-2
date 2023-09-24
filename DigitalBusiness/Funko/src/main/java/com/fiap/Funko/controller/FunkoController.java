package com.fiap.Funko.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fiap.Funko.dto.RequisicaoNovoFunko;
import com.fiap.Funko.model.Funko;
import com.fiap.Funko.repositories.FunkoRepository;

import jakarta.transaction.Transactional;
import jakarta.validation.Valid;

@RestController
@RequestMapping("/funko")
public class FunkoController {

	@Autowired
	private FunkoRepository repository;
	
	@GetMapping("/formulario")
	public ModelAndView formulario(RequisicaoNovoFunko requisicao) {
		ModelAndView mv = new ModelAndView("funko/formulario");
		mv.addObject("requisicao", requisicao);
		return mv;
	}
	
	@PostMapping("/novo")
	@Transactional
	public ModelAndView novo(@Valid RequisicaoNovoFunko requisicao, BindingResult result){
		
		ModelAndView mv;
		if(result.hasErrors()) {
			mv = new ModelAndView("funko/formulario");
			return mv;
		}
		Funko funko = new Funko(requisicao);
		repository.save(funko);
		mv = new ModelAndView("redirect:/home");
		return mv;
		
		
	}
	
	
	
}
