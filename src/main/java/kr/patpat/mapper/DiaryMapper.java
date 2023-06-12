package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.patpat.entity.Memo;

@Mapper
public interface DiaryMapper {


	List<HashMap<String, Object>> selectAction(@Param("mbIdx") String mbIdx, @Param("petIdx") String petIdx, @Param("date") String date);

	List<HashMap<String, Object>> selectMemoList(@Param("mbIdx") String mbIdx, @Param("date") String date);
	
	
}

