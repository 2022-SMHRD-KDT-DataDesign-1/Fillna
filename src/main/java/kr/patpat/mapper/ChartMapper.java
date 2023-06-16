package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartMapper {

	List<HashMap<String, String>> selectWeekly(String mbIdx, String petIdx);

}

