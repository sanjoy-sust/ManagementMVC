package com.horoppa.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class loginController {

	@RequestMapping("/index.html")
	public String index(Model model) {
		return "index";
	}

	@RequestMapping("info/about.html")
	public String about(Model model) {
		return "info/about";
	}

}
