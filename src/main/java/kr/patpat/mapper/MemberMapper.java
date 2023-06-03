package kr.patpat.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Member;
import kr.patpat.entity.Pet;

@Mapper
public interface MemberMapper {

	public int join(HashMap<String, Object> userInfo);

	public Member selectMember(HashMap<String, Object> userInfo);

	public void setAlarm(HashMap<String, String> param);

	public void setPet(HashMap<String, String> param);

	public void joinPet(String mbIdx);

	public Pet selectPet(String mbIdx);

}

