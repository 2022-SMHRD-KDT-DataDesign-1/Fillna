package kr.patpat.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.patpat.mapper.ChartMapper;

@RequestMapping("/chart")
@RestController
public class ChartRestController {
	
	@Autowired
	private ChartMapper chartMapper;
	
	@PostMapping("/weekly")
	public List<HashMap<String, String>> showWeeklyChart(@RequestParam("mbIdx") String mbIdx, @RequestParam("petIdx") String petIdx) {
		List<HashMap<String, String>> data =  chartMapper.selectWeekly(mbIdx, petIdx);
		
		return data;
	}


}
