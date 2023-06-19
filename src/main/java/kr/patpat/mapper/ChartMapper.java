package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartMapper {

	List<HashMap<String, String>> selectWeekly(HashMap<String, String> param);

	List<HashMap<String, String>> selectWeeklyTotal(HashMap<String, String> param);

	List<HashMap<String, String>> selectMonthly(HashMap<String, String> param);

}

