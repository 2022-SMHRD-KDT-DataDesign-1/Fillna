package kr.patpat.config;

import org.springframework.web.multipart.commons.CommonsMultipartResolver;

public class CustomMultipartResolver extends CommonsMultipartResolver {
	public CustomMultipartResolver(){
		// 최대 파일 크기
		setMaxUploadSize(10485760); // 10MB
	}
}
