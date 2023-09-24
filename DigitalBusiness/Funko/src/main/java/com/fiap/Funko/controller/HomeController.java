package com.fiap.Funko.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fiap.Funko.model.Funko;
import com.fiap.Funko.model.StatusFunko;
import com.fiap.Funko.repositories.FunkoRepository;

@RestController
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private FunkoRepository repository;
	
	@GetMapping
	public ModelAndView home() {
		List<Funko> funkos = repository.findAll();
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("funkos", funkos);
		return mv;
	}
	

	@GetMapping("/{status}")
	public ModelAndView porStatus(@PathVariable("status")String status) {
		List<Funko> funkos = repository.findByStatus(
				StatusFunko.valueOf(status.toUpperCase()));
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("funkos", funkos);
		mv.addObject("status", status);
		return mv;
	}
	
	@ExceptionHandler(IllegalArgumentException.class)
	public ModelAndView onError() {
		ModelAndView mv = new ModelAndView("redirect:/home");
		return mv;
	}
}
