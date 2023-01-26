package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.PlaceImg;
import com.project.dang.dto.DangPlaceDto;

public interface DangPlaceDao {
	
	/**
	 * @author hyunjae
	 * @param DangPlaceDto : 모임장소 테이블 클래스
	 */
	void placeInsert(DangPlaceDto dangPlaceDto);
	
	//장소 리스트 추출
	List<DangPlaceDto> placeList(Double lat1,Double lng1,Double lat2,Double lng2);
	
	//장소 한개 셀렉트
	DangPlaceDto placeOne(int placeNo);
	
	//시퀀스 번호 추출
	int sequence();
	
	//장소 이미지 삽입
	void placeImgInsert(PlaceImg placeImg);
	
	//모든 장소의 갯수
	int countPlace();
	
	//장소 검색
	List<DangPlaceDto> search(String placeName);
}
