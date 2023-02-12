package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.PlaceImg;
import com.project.dang.dto.PlaceListRequestDto;
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

	@Override
	public List<DangPlaceDto> selectList(PlaceListRequestDto PlaceListRequestDto) {
		// 검색 조회인지 판정
				boolean isSearch = PlaceListRequestDto.isSearch();
				if(isSearch) { // 검색 조회일 경우
					return selectSearch(PlaceListRequestDto);
				}
				else { // 검색 조회가 아닐 경우(전체 조회일 경우)
					return selectAll(PlaceListRequestDto);
				}
	}

	@Override
	public List<DangPlaceDto> selectSearch(PlaceListRequestDto PlaceListRequestDto) {
		// map 생성
				Map<String, String> param = new HashMap<>();
				param.put("type", PlaceListRequestDto.getType());
				param.put("keyword", PlaceListRequestDto.getKeyword());
				param.put("startRow", String.valueOf(PlaceListRequestDto.startRow()));
				param.put("endRow", String.valueOf(PlaceListRequestDto.endRow()));
				return sqlSession.selectList("place.searchList", param);
	}

	@Override
	public List<DangPlaceDto> selectAll(PlaceListRequestDto PlaceListRequestDto) {
		Map<String, String> param = new HashMap<>();
		param.put("startRow", String.valueOf(PlaceListRequestDto.startRow()));
		param.put("endRow", String.valueOf(PlaceListRequestDto.endRow()));

		return sqlSession.selectList("place.allList", param);
	}

	@Override
	public int countPlace(PlaceListRequestDto PlaceListRequestDto) {
		if(PlaceListRequestDto.isSearch()) { // 검색 조회라면
			return searchCountPlace(PlaceListRequestDto);
		}
		else { // 전체 조회라면
			return listCountPlace(PlaceListRequestDto);
		}
	}

	@Override
	public int searchCountPlace(PlaceListRequestDto PlaceListRequestDto) {
		Map<String, String> param = new HashMap<>();
		param.put("type", PlaceListRequestDto.getType());
		param.put("keyword", PlaceListRequestDto.getKeyword());
		return sqlSession.selectOne("place.searchCount", param);
	}

	@Override
	public int listCountPlace(PlaceListRequestDto PlaceListRequestDto) {
		return sqlSession.selectOne("place.allCount", PlaceListRequestDto);
	}

	@Override
	public List<DangPlaceDto> homeRecommend() {
		return sqlSession.selectList("place.recommendPlace");
	}

	@Override
	public boolean deletePlaceImg(int placeNo) {
		return sqlSession.delete("place.deletePlaceImg",placeNo)>0;
	}

	@Override
	public int placeImgSearch(int placeNo) {
		return sqlSession.selectOne("place.placeImgSearch", placeNo);
	}

	@Override
	public List<PlaceImg> placeImgList(int placeNo) {
		return sqlSession.selectList("place.placeImgList",placeNo);
	} 
	
	

	
}
