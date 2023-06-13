package kr.patpat.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
	public String memoUpdateForm(@RequestParam("memoIdx") String memoIdx, HttpSession session) {
		Memo memo = memoMapper.showMemo(memoIdx);
		String category = memoMapper.selectCategory(memo.getCategoryIdx());
		session.setAttribute("mvo", memo);
		session.setAttribute("category", category);
		
		return "redirect:/memo";
	}
	
	@PostMapping("/memo/update")
	public String memoUpdate(Memo memo) {
		memoMapper.updateMemo(memo);
		
		return "redirect:/diary";
	}
	

	@PostMapping("/imageUpload")
	public String imageUpload(HttpServletRequest request, HttpSession session, RedirectAttributes rttr) {
		// 파일업로드 API (cos.jar)
		MultipartRequest multi = null;

		// MultipartRequest객체 생성하기위해서는 매개변수가 필요
		// 1.요청객체 (request)
		// 2.이미지를 저장할 폴더의 경로
		// 3.허용가능한 크기
		// 4.파일이름에 대한 인코딩
		// 5.중복이름 안되게 해주는 객체

		String savePath = request.getRealPath("resources/upload");
		int fileMaxSize = 10 * 1024 * 10 * 100; // 10MB
		String enc = "UTF-8";
		DefaultFileRenamePolicy dfrp = new DefaultFileRenamePolicy();

		// 기존 가지고 있는 해당 프로필 이미지 삭제
		String memoId = ((Memo) session.getAttribute("mvo")).getMemoIdx();
		String oldImg = memoMapper.showMemo(memoId).getPhoto();
		File oldFile = new File(savePath + "/" + oldImg);
		if (oldFile.exists()) {
			oldFile.delete();
		}

		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, enc, dfrp);
		// 기존 가지고 있는 해당 프로필 이미지 삭제
		} catch (IOException e) {
			rttr.addFlashAttribute("msgType", "실패 메세지티비");
			rttr.addFlashAttribute("msg", "파일의 크기는 10MB를 넘을 수 없습니다.");
			return "redirect:/imageForm.do";
		}

		// img 파일인지 아닌지 판별하기
		String newProfile = "";

		File file = multi.getFile("memProfile");

		if (file != null) {
			// 여기 안에 왔다는 것은 파일을 올렸다는 것을 의미한다
			
			// 확장자 가져오기
			String ext = file.getName().substring(file.getName().lastIndexOf(".")+1);
			// 대문자로 통일티비
			ext = ext.toUpperCase();
			
			boolean extResult = ext.equals("JPG") || ext.equals("PNG") || ext.equals("GIF");
			if(!extResult) {
			// 이미지 파일이 아닐때
				if (file.exists()) {
					file.delete();
					rttr.addFlashAttribute("msgType", "실패 메세지티비");
					rttr.addFlashAttribute("msg", "이미지 파일만 가능티비(PNG, JPG, GIF)");
					return "redirect:/imageForm.do";
				}
			}
		}
		
		// 새로운 이미지를 테이블에 저장티비
		newProfile = multi.getFilesystemName("memProfile");
		// Mapper에 넣기 위한 객체 생성
		Memo mvo = new Memo();
		mvo.setPhoto(newProfile);
		mvo.setPhoto(memoId);
		//memoMapper.profileUpdate(mvo); // 이미지 업로드티비

		// DB에서 회원 정보를 다시 불러와서 session에 저장티비
 		//Memo mvo = memoMapper.showMemo(memoId);
 		//session.setAttribute("mvo", mvo);
		
 		rttr.addFlashAttribute("msgType", "성공 메세지티비");
		rttr.addFlashAttribute("msg", "이미지 변경 성공티비");
		return "redirect:/";
	}
	

}
