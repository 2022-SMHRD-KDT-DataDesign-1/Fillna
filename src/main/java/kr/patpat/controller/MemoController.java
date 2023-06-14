package kr.patpat.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.patpat.entity.Category;
import kr.patpat.entity.Memo;
import kr.patpat.mapper.CategoryMapper;
import kr.patpat.mapper.MemoMapper;

@Controller
public class MemoController {

	@Autowired
	private MemoMapper memoMapper;

	@Autowired
	private CategoryMapper categoryMapper;
	
	@GetMapping("/memo")
	public String memo() {
		return "menu/memo";
	}

	@GetMapping("/memo/show")
	public String memo(@RequestParam("date") String date, HttpSession session) {
		session.setAttribute("date", date);

		return "redirect:/memo";
	}

	// 메모 작성
	@PostMapping("/memo/write")
	public String memoWrite(Memo memo, HttpServletRequest request, MultipartFile file)
			throws IllegalStateException, IOException {
		String saveImgPath = request.getSession().getServletContext().getRealPath("/").concat("resources") + "/upload/";
		String fileName = file.getOriginalFilename();

		File saveFile = new File(saveImgPath, fileName);

		file.transferTo(saveFile);

		memo.setMemoPhotoName(fileName);
		memo.setMemoPhotoPath("/upload/" + fileName);

		Category cate = categoryMapper.selectCategory(memo.getMemoIdx());
		memo.setCategoryIdx(cate.getCategoryIdx());

		memoMapper.insertMemo(memo);

		return "redirect:/memo";
	}

	// 수정 페이지로 이동
	@GetMapping("/memo/update")
	public String memoUpdateForm(@RequestParam("memoIdx") String memoIdx, @RequestParam("date") String date, HttpSession session) {
		System.out.println(memoIdx+date);
		
		
		Memo memo = memoMapper.showMemo(memoIdx);
		 
		Category cate = categoryMapper.selectCategory(memo.getCategoryIdx()); String
		category = cate.getCategoryName();
		 
		session.setAttribute("mvo", memo); session.setAttribute("category",category);
		session.setAttribute("date", date);
		 
		return "redirect:/memo";
	}

	// 메모 수정
	@PostMapping("/memo/updatecom")
	public String memoUpdate(Memo memo, HttpServletRequest request, MultipartFile file) {
		System.out.println("수정티비");
		return null;
	}
}
