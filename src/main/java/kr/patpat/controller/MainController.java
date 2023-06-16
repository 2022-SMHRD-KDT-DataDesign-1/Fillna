package kr.patpat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	

	
	@RequestMapping("/alarm")
	public String alarm() {
		return "menu/alarm";
	}
	
	@RequestMapping("/chart")
	public String chart() {
		return "menu/chart";
	}
	
	@RequestMapping("/monitoring")
	public String monitoring() {
		return "menu/monitoring";
	}
	
	@RequestMapping("/cctv")
	public String cctv() {
		return "menu/cctv";
	}
	
}
