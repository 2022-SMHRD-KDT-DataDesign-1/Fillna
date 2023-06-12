package kr.patpat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemoController {
	
	@RequestMapping("/memo")
	public String memo() {
		return "menu/memo";
	}
	
	@GetMapping("/memo/update")
	public String memoUpdate() {
		return null;
	}

}
