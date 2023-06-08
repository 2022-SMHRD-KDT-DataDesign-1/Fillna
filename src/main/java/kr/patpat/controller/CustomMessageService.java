package kr.patpat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.patpat.entity.tAlarm;

@Service
public class CustomMessageService {

	@Autowired
	MessageService messageService;

	public boolean sendMyMessage() {
		tAlarm myMsg = new tAlarm();
		myMsg.setBtnTitle("자세히보기");
		myMsg.setMobileUrl("https://www.naver.com/");
		myMsg.setObjType("text");
		myMsg.setWebUrl("https://www.naver.com/");
		myMsg.setText("테스트 메시지 티비2");

		String accessToken = AuthService.authToken;

		return messageService.sendMessage(accessToken, myMsg);
	}
}