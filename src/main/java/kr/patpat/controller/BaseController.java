package kr.patpat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BaseController {

	@Autowired
	AuthService authService;

	@Autowired
	CustomMessageService customMessageService;

	@GetMapping("/Message")
	public String serviceStart(String code) {
		if (authService.getKakaoAuthToken(code)) {
			customMessageService.sendMyMessage();
			return "alarm/alarmSuccess";
		} else {
			return "alarm/alarmFail";
		}
	}
}