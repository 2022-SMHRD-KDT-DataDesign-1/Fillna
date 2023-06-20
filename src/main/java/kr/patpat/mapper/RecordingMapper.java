package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.patpat.entity.Recording;

@Mapper
public interface RecordingMapper {

	public List<Recording> recordingList(HashMap<String, String> param);

	public List<Recording> recording_ai_List(String date);

}
