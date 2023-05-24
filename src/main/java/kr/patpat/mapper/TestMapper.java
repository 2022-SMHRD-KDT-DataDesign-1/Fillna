package kr.patpat.mapper;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface TestMapper {

	public String selectTest();
	
}

// root-context에서 SqlSessionFactoryBean 클래스를 알아서 구현해줌
