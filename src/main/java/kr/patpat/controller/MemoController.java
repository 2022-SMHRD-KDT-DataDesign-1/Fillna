package kr.patpat.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String memoWrite(@RequestParam("mbIdx") String mbIdx, @RequestParam("category") String category,
			@RequestParam("memocontent") String memocontent, @RequestParam("file") MultipartFile file, HttpServletRequest request,
			RedirectAttributes rttr) throws IllegalStateException, IOException {
		
		String saveImgPath = "C:\\Users\\SMHRD\\git\\Fillna\\src\\main\\webapp\\resources\\upload"; 
		
		if(!file.isEmpty()) {
			try {
				String fileName = file.getOriginalFilename();
				File uploadFile = new File(saveImgPath, fileName);
				file.transferTo(uploadFile);
				
				Memo memo = new Memo();
				memo.setMbIdx(mbIdx);
				memo.setMemoContent(memocontent);
				memo.setMemoPhotoName(fileName);
				memo.setMemoPhotoPath(uploadFile.getAbsolutePath());
				
				Category cate = categoryMapper.selectCategory(category);
				memo.setCategoryIdx(cate.getCategoryIdx());
				
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
