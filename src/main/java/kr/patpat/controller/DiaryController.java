package kr.patpat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.patpat.entity.Memo;
import kr.patpat.mapper.MemoMapper;

@Controller
public class DiaryController {
	
	@Autowired
	private MemoMapper memoMapper;
	
	@RequestMapping("/diary")
	public String diary() {
		return "menu/diary";
	}
	
	@RequestMapping("/memo")
	public String memo() {
		return "menu/memo";
	}
	
	@GetMapping("/memo/update")
	public String memoUpdateForm(@RequestParam("idx") String idx, Model model) {
		Memo memo = memoMapper.showMemo(idx);
		model.addAttribute("mvo", memo);
		
		return "redirect/memo";
	}
	
	@PostMapping("/memo/update")
	public String memoUpdate(Memo memo) {
		memoMapper.updateMemo(memo);
		
		return "redirect:/diary";
	}

}
