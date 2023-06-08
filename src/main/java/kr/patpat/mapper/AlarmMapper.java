package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Alarm;
import kr.patpat.entity.AlarmContent;
import kr.patpat.entity.Member;
import kr.patpat.entity.Pet;

@Mapper
public interface AlarmMapper {
	
	public Alarm selectAlarm(HashMap<String, Object> userInfo);

	public List<AlarmContent> alarmContentList();
	
}

