package kr.patpat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.google.gson.JsonArray;

import kr.patpat.mapper.AlarmMapper;

@Controller
@RequestMapping("/kakaotalk")
public class KakaoTalkMessageController {
   
   RestTemplate restTemplate = new RestTemplate();
   private final String client_id = "b38c873dac6c4b245d22412fae37e4af";
   @GetMapping("/admin")
   public String adLogin(){
	   return "member/admin";
   }
   
   @Autowired
   private AlarmMapper mapper;
   
   public Map<String, String> getToken(String code) {
	   
	   
	   String apiUrl = "https://kauth.kakao.com/oauth/token";
	   
	   HttpHeaders headers = new HttpHeaders();
	   headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	   
	   UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(apiUrl)
	            .queryParam("grant_type", "authorization_code")
	            .queryParam("client_id", client_id)
	            .queryParam("redirect_uri", "http://localhost:8081/controller/kakaotalk/login")
	   			.queryParam("code",code);
	   
	   ResponseEntity<Map> response = restTemplate.exchange(uriBuilder.toUriString(),HttpMethod.GET,new HttpEntity<>(headers), Map.class);
	   
	   Map responseBody = response.getBody();
	   
	   String access_token = (String)responseBody.get("access_token");
	   String refresh_token = (String)responseBody.get("refresh_token");
	   Map<String,String> token = new HashMap<String,String>();
	   
	   token.put("access_token", access_token);
	   token.put("refresh_token", refresh_token);
	   
	   return token;
   }
   
   @GetMapping("/login")
   public String refreshToken(@RequestParam(value = "code",required=false)String code, HttpSession session) {
       if (session.getAttribute("cnt") == null) {
    	   session.setAttribute("cnt", "1");
    	   System.out.println(session.getAttribute("cnt"));
    	   session.setAttribute("template_id","95063");
    	   System.out.println("///1");
       }else if(session.getAttribute("cnt") == "1") {
    	   session.setAttribute("cnt", "2");
    	   session.setAttribute("template_id","95121");
    	   System.out.println("///2");
       }else if(session.getAttribute("cnt") == "2") {
    	   session.removeAttribute("cnt");
    	   session.setAttribute("template_id","95123");
    	   System.out.println("///3");
       }
	   Map<String, String> token = getToken(code);
	   System.out.println(token);
	   String apiUrl = "https://kapi.kakao.com/v2/user/me";
	   
	   HttpHeaders headers = new HttpHeaders();
	   headers.set("Authorization","Bearer "+token.get("access_token"));
	   headers.set("Content-type","application/x-www-form-urlencoded;charset=utf-8");
	   
	   ResponseEntity<Map> response = restTemplate.exchange(apiUrl, HttpMethod.GET, new HttpEntity<>(headers),Map.class);
	   
	   Map responseBody = response.getBody();
	   
	   System.out.println("로그인"+responseBody);
	   String uuid = getFriend(token.get("access_token"));
	   SendMessage(uuid,token.get("access_token"),session);
	   
	   System.out.println("완료");

	   
	   return "member/admin";
   }
   
   

   
   public String getFriend(String access_token) {
	   String apiUrl = "https://kapi.kakao.com/v1/api/talk/friends?limit=1&friend_order=favorite&order=asc";
	   
	   HttpHeaders headers = new HttpHeaders();
	   headers.set("Authorization", "Bearer "+access_token);
	   
	   
	   UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(apiUrl)
			   .queryParam("offset", 1);
	   ResponseEntity<Map> response = restTemplate.exchange(uriBuilder.toUriString(),HttpMethod.GET,new HttpEntity<>(headers), Map.class);
	   
	   
	   Map responseBody = response.getBody();
	   System.out.println(responseBody);
	   List<Map<String, Object>> elements =   (List<Map<String,Object>>)responseBody.get("elements");
	   Map<String,Object> firstElement = elements.get(0);
	   String uuid = (String) firstElement.get("uuid");

	   System.out.println(uuid);
	   return uuid;
   }
   
   public void SendMessage(String uuid , String token , HttpSession session) {
	   String apiUrl = "https://kapi.kakao.com/v1/api/talk/friends/message/send";
	   
	   HttpHeaders headers = new HttpHeaders();
	   headers.set("Authorization", "Bearer "+token);
	   headers.set("Content-type","application/x-www-form-urlencoded");
	   
	   uuid = uuid.trim();
	   
	   // 기본 템플릿
		/*
		 * String template_string = "{"; template_string += "\"object_type\":\"text\",";
		 * template_string += "\"text\":\"텍스트 영역입니다.\","; template_string +=
		 * "\"link\":{"; template_string += "\"web_url\":\"\","; template_string +=
		 * "\"mobile_web_url\":\"\""; template_string += "},"; template_string +=
		 * "\"button_title\":\"바로 확인\""; template_string += "}";
		 */
	   
       // 사용자 정의 템플릿
		/*
		 * List<Map<String, String>> list = mapper.alarmContentList();
		 * 
		 * Map<String,String> content = list.get(0); String val =
		 * content.get("alarm_content");
		 */
		/*
		 * String template_args =
		 * "{\"alarm_content\":\""+val.replaceAll("\\※","※").replaceAll("\\①","①").
		 * replaceAll("\\②","②")
		 * .replaceAll("\\③","").replaceAll("\\④","").replaceAll("\\⑤","").replaceAll(
		 * "\n","")+"\"}";
		 * 
		 * System.out.println(template_args);
		 */
       String template_id = (String) session.getAttribute("template_id");
       System.out.println(template_id);
	   JsonArray uuidsArray = new JsonArray(); uuidsArray.add(uuid);
	   System.out.println("UUIDs: " + uuidsArray.toString());
	  
       MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
       params.add("receiver_uuids", uuidsArray.toString());
       params.add("template_id", "95123");
		/* params.add("template_args", template_args); */ 
       
       HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(params, headers);
       
       
	   try {
		   ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.POST, requestEntity, String.class);
		   System.out.println(response);
		   
	   }catch(HttpClientErrorException e) {
		   System.out.println(e.getResponseBodyAsString());
	   
	   }
	   
	   
   }
   
   
   
}