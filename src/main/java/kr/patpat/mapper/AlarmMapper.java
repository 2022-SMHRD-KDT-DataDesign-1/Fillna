package kr.patpat.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Alarm;
import kr.patpat.entity.Member;
import kr.patpat.entity.Pet;

@Mapper
public interface AlarmMapper {
	
	public Alarm selectAlarm(HashMap<String, Object> userInfo);
	
}

