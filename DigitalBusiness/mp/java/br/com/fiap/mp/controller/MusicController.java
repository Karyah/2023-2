package br.com.fiap.mp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/music")
public class MusicController {
	
	@GetMapping
	public String letra(Model model){
		model.addAttribute("letra", "How do I live without the ones I love?\r\n"
				+ "\n"
				+ "Time still turns the pages of the book it's burned\r\n"
				+ "\r\n"
				+ "Place and time always on my mind\r\n"
				+ "\r\n"
				+ "I have so much to say, but you're so far away"
				+ "I love you, you were ready\r\n"
				+ "\r\n"
				+ "The pain is strong and urges rise\r\n"
				+ "\r\n"
				+ "But I'll see you when He lets me\r\n"
				+ "\r\n"
				+ "Your pain is gone, your hands untied\r\n"
				+ "\r\n"
				+ "So far away\r\n"
				+ "\r\n"
				+ "And I need you to know\r\n"
				+ "\r\n"
				+ "So far away\r\n"
				+ "\r\n"
				+ "And I need you to, need you to know");
		return "musica";
	}
}
