package kr.patpat.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Memo;

@Mapper
public interface MemoMapper {

	void updateMemo(Memo memo);

	Memo showMemo(String idx);

	void insertMemo(Memo memo);

	void deleteMemo(String idx);

	List<HashMap<String, String>> showMemoCategoryDetail(String category);
}

