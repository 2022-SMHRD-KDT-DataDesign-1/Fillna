package kr.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.board.mapper.TestMapper;

@Controller
public class MainController {
	@Autowired
	private TestMapper testMapper;
	
	@RequestMapping("/")
	public String index() {
		// method 이름 = view 이름 --> 리턴 타입 void로 써도 index.jsp로 넘어감
		// 근데 리턴 써주는게 국룰티비
		String msg = testMapper.selectTest();
		System.out.println(msg);
		
		return "index";
	}
	
}
