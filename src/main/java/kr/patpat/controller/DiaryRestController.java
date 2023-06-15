package kr.patpat.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.patpat.entity.Recording;
import kr.patpat.mapper.DiaryMapper;
import kr.patpat.mapper.MemoMapper;

@RequestMapping("/diary")
@RestController
public class DiaryRestController {
	
	@Autowired
	private DiaryMapper diaryMapper;
	
	@Autowired
	private MemoMapper memoMapper;
	
	// 오늘의 일지
	@GetMapping("/diary-all")
	public List<HashMap<String, Object>> diaryList(@RequestParam("mbIdx") String mbIdx, @RequestParam("petIdx") String petIdx, @RequestParam("date") String date){
		List<HashMap<String, Object>> data = diaryMapper.selectAction(mbIdx, petIdx, date);
		//System.out.println(data.toString());
		return data;
	};
	
	// 메모 목록
	@GetMapping("/memo-all")
	public List<HashMap<String, Object>> memoList(@RequestParam("mbIdx") String mbIdx, @RequestParam("date") String date){
		//System.out.println(mbIdx+" "+date);
		List<HashMap<String, Object>> data = diaryMapper.selectMemoList(mbIdx, date);
		return data;
	};
	
	@GetMapping("/record-all")
	public List<Recording> recordingList(){
		return null;
	};
	
	// 메모삭제
	@DeleteMapping("/{idx}")
	public void boardDelete(@PathVariable("idx") String idx) {
		memoMapper.deleteMemo(idx);
	}
	
	
	
}
