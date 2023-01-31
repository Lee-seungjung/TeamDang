package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.PlaceImg;
import com.project.dang.dto.DangPlaceDto;

public interface DangPlaceDao {
	
	/**
	 * 장소 마커 등록 메소드
	 * @author hyunjae
	 * @param DangPlaceDto : 모임장소 테이블 클래스
	 */
	void placeInsert(DangPlaceDto dangPlaceDto);
	
	//장소 리스트 추출
	List<DangPlaceDto> placeList();
	
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
	
	/**
	 * 장소 마커정보 삭제 메소드
	 * @author hyunjae
	 * @param placeNo : 장소번호 pk
	 * @return boolean
	 */
	boolean placeDelete(int placeNo);
	
	/**
	 * 장소 마커정보 수정 메소드
	 * @author hyunjae
	 * @param dangPlaceDto : dangPlaceDto 클래스정보 
	 * @return boolean
	 */
	boolean placeEdit(DangPlaceDto dangPlaceDto);
	
	/**
	 * 영역내 지도마커 불러오기 메소드
	 * @author hyunjae
	 * @param Double : 카카오맵 api 해당영역 좌표값
	 * @return List<DangPlaceDto>
	 */
	List<DangPlaceDto> placeListArea(Double lat1,Double lng1,Double lat2,Double lng2);
}
