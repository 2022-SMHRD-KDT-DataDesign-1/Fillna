package kr.patpat.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

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
	public String memoWrite(@RequestParam("memoAt") String memoAt, @RequestParam("mbIdx") String mbIdx, @RequestParam("category") String category,
			@RequestParam("memocontent") String memocontent, @RequestParam("file") MultipartFile file, HttpServletRequest request,
			RedirectAttributes rttr) throws IllegalStateException, IOException {
		System.out.println("작성들어옴");
		String saveImgPath = "C:\\Users\\SMHRD\\git\\Fillna\\src\\main\\webapp\\resources\\upload"; 
		
		if(!file.isEmpty()) {
			try {
				String fileName = file.getOriginalFilename();
				File uploadFile = new File(saveImgPath, fileName);
				file.transferTo(uploadFile);
				
				Memo memo = new Memo();
				memo.setMbIdx(mbIdx);
				memo.setMemoContent(memocontent);
				memo.setMemoAt(memoAt);
				memo.setMemoPhotoName(fileName);
				memo.setMemoPhotoPath(uploadFile.getAbsolutePath());
				
				List<Category> cate = categoryMapper.selectCategory(category);
				memo.setCategoryIdx(cate.get(0).getCategoryIdx());
				
				System.out.println(memo.toString());
				memoMapper.insertMemo(memo);
				
				return "redirect:/diary";
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("메모 작성 실패");
		rttr.addFlashAttribute("msgType", "nofile");
		
		return "redirect:/memo";

	}

	// 수정 페이지로 이동
	@GetMapping("/memo/update")
	public String memoUpdateForm(@RequestParam("memoIdx") String memoIdx, @RequestParam("date") String date, HttpSession session) {
		
		Memo memo = memoMapper.showMemo(memoIdx);
		 
		List<Category> cate = categoryMapper.selectCategory(memo.getCategoryIdx()); String
		category = cate.get(0).getCategoryName();
		 
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
	
	@ResponseBody
	@PostMapping(value = "/memo/category", produces = "text/plain;charset=UTF-8")
	public String memoShowCategory(String category) {
		//System.out.println(category);
		List<HashMap<String, String>> memoDetail = memoMapper.showMemoCategoryDetail(category);

		Gson gson = new Gson();
		String data = gson.toJson(memoDetail);
		
		return data;
	}
}
