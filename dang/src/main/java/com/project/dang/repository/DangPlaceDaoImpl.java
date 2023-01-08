package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangPlaceDto;

@Repository
public class DangPlaceDaoImpl  implements DangPlaceDao{

	@Autowired
	SqlSession sqlSession; //DB와 연결하기 위한 의존성 주입

	@Override
	public void placeInsert(DangPlaceDto dangPlaceDto) {
		sqlSession.insert("place.placeInsert", dangPlaceDto);
	}

	@Override
	public List<DangPlaceDto> placeList() {
		return sqlSession.selectList("place.placeList");
	}

	@Override
	public DangPlaceDto placeOne(int placeNo) {
		return sqlSession.selectOne("place.listOne", placeNo);
	}
	
	
}
