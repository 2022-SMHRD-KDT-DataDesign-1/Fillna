package kr.patpat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DiaryController {
	
	@RequestMapping("/diary")
	public String diary() {
		return "menu/diary";
	}

	  
}
