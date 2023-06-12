package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface DiaryMapper {


	List<HashMap<String, Object>> selectAction(@Param("mbIdx") String mbIdx, @Param("petIdx") String petIdx, @Param("today") String today);
	
	
}

