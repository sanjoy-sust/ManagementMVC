package com.horoppa.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class homeController {
	@RequestMapping("/home.html")
	public String handleRequest() {
		return "welcome";
	}
}
