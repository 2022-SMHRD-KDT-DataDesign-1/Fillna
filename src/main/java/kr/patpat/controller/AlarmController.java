package kr.patpat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 고운 수정
	@PostMapping("/all-test")
	public List<Map<String, String>> showAlarmList(@RequestParam HashMap<String, String> param){
		List<Map<String, String>> data = mapper.showAlarmList(param);
		
		return data;
	}
	
	// 알림 타입 가져오기
	@GetMapping("/cnt/all")
	public List<Map<String, String>> alarm_cnt(){
		
		List<Map<String,String>> list = mapper.alarmCnt();
		
		return list;
	}
	
	
}
