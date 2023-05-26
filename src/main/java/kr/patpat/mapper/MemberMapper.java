package kr.patpat.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Member;

@Mapper
public interface MemberMapper {

	public int join(HashMap<String, Object> userInfo);

	public Member selectMember(HashMap<String, Object> userInfo);

}

