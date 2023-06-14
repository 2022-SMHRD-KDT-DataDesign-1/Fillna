package kr.patpat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Recording;

@Mapper
public interface RecordingMapper {

	public List<Recording> recordingList();

}
