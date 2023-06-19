package kr.patpat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.patpat.entity.Recording;
import kr.patpat.mapper.RecordingMapper;

@RequestMapping("/recording")
@RestController
public class RecordingController {

	@Autowired
	private RecordingMapper mapper;
	
	@GetMapping("/direct/all")
	public List<Recording> recording_list(){
		
		List<Recording> list = mapper.recordingList();
		
		return list;
		
	}
	
	@GetMapping("/ai/all")
	public List<Recording> recording_ai_list(@RequestParam("date") String date){
		System.out.println(date);
		List<Recording> list = mapper.recording_ai_List(date);
		System.out.println(list.get(0));
		return list;
	}
	
}
