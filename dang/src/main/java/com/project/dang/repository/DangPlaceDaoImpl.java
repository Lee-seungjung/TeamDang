package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.PlaceImg;
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

	@Override
	public int sequence() {
		return sqlSession.selectOne("place.sequence");
	}

	@Override
	public void placeImgInsert(PlaceImg placeImg) {
		sqlSession.insert("place.placeImg", placeImg);
	}

	@Override
	public int countPlace() {
		return sqlSession.selectOne("place.countAll");
	}

	@Override
	public List<DangPlaceDto> search(String placeName) {
		return sqlSession.selectList("place.searchPlace",placeName);
	}

	@Override
	public boolean placeDelete(int placeNo) {
		return sqlSession.delete("place.placeDelete", placeNo)>0;
	}

	@Override
	public boolean placeEdit(DangPlaceDto dangPlaceDto) {
		return sqlSession.update("place.placeEdit", dangPlaceDto)>0;
	}
	
	@Override
	public List<DangPlaceDto> placeListArea(Double lat1,Double lng1,Double lat2,Double lng2) {
		Map<String, String> param = new HashMap<>();
		param.put("lat1", String.valueOf(lat1));
		param.put("lng1", String.valueOf(lng1));
		param.put("lat2", String.valueOf(lat2));
		param.put("lng2", String.valueOf(lng2));
		return sqlSession.selectList("place.placeListArea",param);
	}

	
}
