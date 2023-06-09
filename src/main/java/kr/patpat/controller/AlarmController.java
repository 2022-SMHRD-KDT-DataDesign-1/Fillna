package kr.patpat.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.patpat.mapper.AlarmMapper;

@RequestMapping("/alarm")
@RestController
public class AlarmController {
	
	@Autowired
	private AlarmMapper mapper;
	
    // 알림 내용 List 가져오기
	@GetMapping("/all")
	public List<Map<String, String>> alarm_content_list(){
		
		List<Map<String, String>> list = mapper.alarmContentList(); 
		
		return list;
	}
	
	
}
