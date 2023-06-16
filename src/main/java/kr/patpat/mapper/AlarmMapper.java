package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Alarm;

@Mapper
public interface AlarmMapper {
	
	public Alarm selectAlarm(HashMap<String, Object> userInfo);

	public List<Map<String, String>> alarmContentList();

	public List<Map<String, String>> alarmCnt();

	
}

