package kr.patpat.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.tMember;

@Mapper
public interface MemberMapper {

	public int join(HashMap<String, Object> userInfo);

	public tMember selectMember(HashMap<String, Object> userInfo);

}

