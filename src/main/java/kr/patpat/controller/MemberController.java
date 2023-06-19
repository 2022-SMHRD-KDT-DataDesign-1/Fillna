package kr.patpat.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.patpat.entity.Category;
import kr.patpat.entity.Member;
import kr.patpat.entity.Memo;
import kr.patpat.entity.Pet;
import kr.patpat.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/welcome")
	public String welcome() {
		return "member/welcome";
	}
	
	// update
	@PostMapping("/update")
	public String update(@RequestParam HashMap<String, String> param, @RequestParam("file") MultipartFile file, HttpSession session, RedirectAttributes rttr) {
		
		String saveImgPath = "C:\\Users\\SMHRD\\git\\Fillna\\src\\main\\webapp\\resources\\photo"; 
		System.out.println(param.toString()+file);
		
		// 반려동물 사진이 없는 경우
		if(param.get("pet_photo") == null) {
			if(!file.isEmpty()) {
				try {
					String fileName = file.getOriginalFilename();
					File uploadFile = new File(saveImgPath, fileName);
					file.transferTo(uploadFile);
					
					Pet pet = memberMapper.selectPet(param.get("mb_idx"));
					pet.setPetName(param.get("pet_name"));
					pet.setPetAdoptionAt(param.get("pet_adoption_at"));
					pet.setPetGender(param.get("pet_gender"));
					pet.setPetPhoto(fileName);
					pet.setPetPhotoPath(uploadFile.getAbsolutePath());
					memberMapper.setAlarm(param);
					memberMapper.setPet(pet);
					
					session.setAttribute("pvo", pet);
					Member member = memberMapper.selectUpdateMember(param.get("mb_idx"));
					session.setAttribute("vo", member);
					
					rttr.addFlashAttribute("msg", "성공티비");
					try {

						Thread.sleep(3000); //3초 대기

					} catch (InterruptedException e) {

						e.printStackTrace();

					}
					return "redirect:/updateForm";
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		} else { // 반려동물 사진이 있는 경우
			Pet pet = memberMapper.selectPet(param.get("mb_idx"));
			pet.setPetName(param.get("pet_name"));
			pet.setPetAdoptionAt(param.get("pet_adoption_at"));
			pet.setPetGender(param.get("pet_gender"));
			if(!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				File uploadFile = new File(saveImgPath, fileName);
				String oldImg = pet.getPetPhoto();
				File oldFile = new File(saveImgPath+"/"+oldImg);
				
				if(oldFile.exists()) {
					oldFile.delete();
				}
				pet.setPetPhoto(fileName);
				pet.setPetPhotoPath(uploadFile.getAbsolutePath());
				try {
					file.transferTo(uploadFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			memberMapper.setAlarm(param);
			memberMapper.setPet(pet);
			
			session.setAttribute("pvo", pet);
			Member member = memberMapper.selectUpdateMember(param.get("mb_idx"));
			session.setAttribute("vo", member);
			
		   try {

				Thread.sleep(3000); //3초 대기

			} catch (InterruptedException e) {

				e.printStackTrace();

			}
			rttr.addFlashAttribute("msg", "성공티비");
			return "redirect:/updateForm";
		}

		rttr.addFlashAttribute("mgs", "실패티비");
		return "redirect:/updateForm";
	}
	
	// updateForm
	@RequestMapping("/updateForm")
	public String updateForm() {
		return "member/update";
	}
	
	// 로그인
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}

	@GetMapping("/kakaoLogin")
	public String kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {

		String accessToken = getAccessToken(code);

		HashMap<String, Object> userInfo = getUserInfo(accessToken);
		System.out.println(userInfo.toString());
		
		Member member = memberMapper.selectMember(userInfo);
		
		if (member != null) {
			// 이미 가입한 경우
			session.setAttribute("vo", member);
			String mbIdx = member.getMbIdx();
			Pet pet = memberMapper.selectPet(mbIdx);
			session.setAttribute("pvo", pet);
			
			return "menu/monitoring";
		} else {
			// 신규회원인 경우
			memberMapper.join(userInfo);
			Member memberNew = memberMapper.selectMember(userInfo);
			session.setAttribute("vo", memberNew);
			
			// pet 테이블에 NULL값 INSERT
			String mbIdx = memberNew.getMbIdx();
			memberMapper.joinPet(mbIdx);
			
			Pet pet = memberMapper.selectPet(mbIdx);
			session.setAttribute("pvo", pet);
			
			return "member/welcome";
		}

	}

	@GetMapping("/logout")
	public String kakaoLogout(HttpSession session) {
		session.invalidate();

		return "redirect:/login";
	}
	
	// 함수1 - token 가져오는 함수
	private String getAccessToken(String code) {
		String accessToken = "";
		String refreshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=b38c873dac6c4b245d22412fae37e4af"); // rest api key
			sb.append("&redirect_uri=http://localhost:8081/controller/kakaoLogin"); // redirect uri
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			System.out.println("access_token : " + accessToken);
			System.out.println("refresh_token : " + refreshToken);

			br.close();
			bw.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return accessToken;
	}
	
	// 함수2 - 가져온 토큰으로 user정보 가져오는 함수
	private HashMap<String, Object> getUserInfo(String accessToken) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();

		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String phonenumeber = kakao_account.getAsJsonObject().get("phone_number").getAsString();
			String profileImg = properties.getAsJsonObject().get("profile_image").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("phonenumeber", phonenumeber);
			userInfo.put("profileImg", profileImg);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userInfo;
	}
	
	//함수3 - 로그아웃
	public void exeLogout(String accessToken) {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String result = "";
			String line = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println(result);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
