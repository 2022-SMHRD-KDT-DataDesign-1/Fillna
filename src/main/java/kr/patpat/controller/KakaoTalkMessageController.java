package kr.patpat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Controller
@RequestMapping("/kakaotalk")
public class KakaoTalkMessageController {
   
   RestTemplate restTemplate = new RestTemplate();
   private final String client_id = "b38c873dac6c4b245d22412fae37e4af";
   
   @GetMapping("/admin")
   public String adLogin(){
	   return "member/admin";
   }
   
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
   public void refreshToken(@RequestParam(value = "code",required=false)String code) {
	   
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
	   SendMessage(uuid,token.get("access_token"));
	   
	   System.out.println("완료");
   }
   
   

   
   public String getFriend(String access_token) {
	   String apiUrl = "https://kapi.kakao.com/v1/api/talk/friends?limit=1&friend_order=favorite&order=asc";
	   
	   HttpHeaders headers = new HttpHeaders();
	   headers.set("Authorization", "Bearer "+access_token);
	   
	   ResponseEntity<Map> response = restTemplate.exchange(apiUrl,HttpMethod.GET,new HttpEntity<>(headers), Map.class);
	   
	   Map responseBody = response.getBody();
	   List<Map<String, Object>> elements =   (List<Map<String,Object>>)responseBody.get("elements");
	   Map<String,Object> firstElement = elements.get(0);
	   String uuid = (String) firstElement.get("uuid");

	   System.out.println(uuid);
	   return uuid;
   }
   
   public void SendMessage(String uuid , String token) {
	   String apiUrl = "https://kapi.kakao.com/v1/api/talk/friends/message/default/send";
	   
	   HttpHeaders headers = new HttpHeaders();
	   headers.set("Authorization", "Bearer "+token);
	   
	   String template_object = "{";
       template_object += "\"object_type\": \"text\",";
       template_object += "\"text\": '텍스트 영역입니다.\",";
       template_object += "\"link\": {";
       template_object += "\"web_url\": \"https://developers.kakao.com\",";
       template_object += "\"mobile_web_url\": \"https://developers.kakao.com\"";
       template_object += "},"; 
       template_object += "\"button_title\": \"바로 확인\"";
       template_object += "}";
	   
	   System.out.println(uuid+"/"+token);
	   UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromUriString(apiUrl)
	            .queryParam("receiver_uuids", uuid)
	            .queryParam("template_object",template_object);
	   
	   
	   ResponseEntity<String> response = restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, new HttpEntity<>(headers),String.class);
	   System.out.println(response);
	   
	   
   }
   
   
   
}