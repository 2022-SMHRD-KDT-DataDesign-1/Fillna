package kr.patpat.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Kakao;

@Mapper
public interface KakaoMapper {

	public int kakaoJoin(HashMap<String, Object> userInfo);

	public Kakao selectKakao(HashMap<String, Object> userInfo);

}

