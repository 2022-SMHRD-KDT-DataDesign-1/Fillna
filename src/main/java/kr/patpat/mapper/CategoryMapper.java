package kr.patpat.mapper;

import org.apache.ibatis.annotations.Mapper;

import kr.patpat.entity.Category;

@Mapper
public interface CategoryMapper {
	
	Category selectCategory(String categoryName);

	
}

