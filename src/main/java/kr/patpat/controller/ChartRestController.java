package kr.patpat.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;

import kr.patpat.mapper.ChartMapper;

@RequestMapping("/chart")
@RestController
public class ChartRestController {
	
	@Autowired
	private ChartMapper chartMapper;
	
	@PostMapping(value = "/weekly", produces = "text/plain;charset=UTF-8")
	public String showWeeklyChart(@RequestParam HashMap<String, String> param) {
		System.out.println(param.toString());
		
		List<HashMap<String, String>> res =  chartMapper.selectWeekly(param);
		
		// json 형태로 변환
		Gson gson = new Gson();
		String data = gson.toJson(res);
		System.out.println(data);
		
		return data;
	}


}
