package kr.patpat.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Category;

@Mapper
public interface CategoryMapper {
	
	List<Category> selectCategory(String categoryName);


	
}

