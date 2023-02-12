package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.PlaceImg;
import com.project.dang.dto.PlaceListRequestDto;
import com.project.dang.dto.DangPlaceDto;

public interface DangPlaceDao {
	
	/**
	 * 장소 마커 등록 메소드
	 * @author hyunjae
	 * @param DangPlaceDto : 장소 테이블 클래스
	 */
	void placeInsert(DangPlaceDto dangPlaceDto);
	
	/**
	 * 장소 리스트
	 * @author hyunjae
	 * @return List<DangPlaceDto> : 장소 테이블 클래스
	 */
	List<DangPlaceDto> placeList();
	
	/**
	 * 하나의 장소 추출 메소드
	 * @author hyunjae
	 * @param int : 장소 번호 pk
	 * @return DangPlaceDto : 장소 테이블 클래스
	 */
	DangPlaceDto placeOne(int placeNo);
	
	/**
	 * 시퀀스 발급
	 * @author hyunjae
	 * @return int : 시퀀스 발급
	 */
	int sequence();
	
	/**
	 * 장소 이미지 삽입
	 * @author hyunjae
	 * @param int : 장소 첨부파일 테이블
	 * @return void
	 */
	void placeImgInsert(PlaceImg placeImg);
	
	/**
	 * 모든 장소의 갯수
	 * @author hyunjae
	 * @return int : count(*)
	 */
	int countPlace();
	
	/**
	 * 장소 검색
	 * @author hyunjae
	 * @param String : keyword값
	 * @return List<DangPlaceDto> : 장소 클래스 리스트 객체 반환
	 */
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
	
	/**
	 * 장소 조회
	 * @author hyunjae
	 * @param PlaceListRequestDto : 페이징을 위한 장소 DTO
	 * @return List<DangPlaceDto>
	 */
	public List<DangPlaceDto> selectList(PlaceListRequestDto PlaceListRequestDto);
	/**
	 * 장소 검색 목록
	 * @author hyunjae
	 * @param PlaceListRequestDto : 페이징을 위한 장소 DTO
	 * @return List<DangPlaceDto>
	 */
	public List<DangPlaceDto> selectSearch(PlaceListRequestDto PlaceListRequestDto);
	/**
	 * 장소 전체 목록
	 * @author hyunjae
	 * @param PlaceListRequestDto : 페이징을 위한 장소 DTO
	 * @return List<DangPlaceDto>
	 */
	public List<DangPlaceDto> selectAll(PlaceListRequestDto PlaceListRequestDto);
	/**
	 * 장소 마커 총 갯수 반환
	 * @author hyunjae
	 * @param PlaceListRequestDto : 페이징을 위한 장소 DTO
	 * @return int
	 */
	public int countPlace(PlaceListRequestDto PlaceListRequestDto);
	/**
	 * 검색 조회시 장소마커 총 갯수 반환
	 * @author hyunjae
	 * @param PlaceListRequestDto : 페이징을 위한 장소 DTO
	 * @return int
	 */
	public int searchCountPlace(PlaceListRequestDto PlaceListRequestDto);
	/**
	 * 전체 조회시 장소마커 총 갯수 반환
	 * @author hyunjae
	 * @param PlaceListRequestDto : 페이징을 위한 장소 DTO
	 * @return int
	 */	
	public int listCountPlace(PlaceListRequestDto PlaceListRequestDto);
	/**
	 * 홈화면 슬라이드 장소추천을 위한 메서드
	 * @author hyunjae
	 * @return List<DangPlaceDto>
	 */	
	public List<DangPlaceDto> homeRecommend();
	/**
	 * 중간 테이블 place_img 삭제
	 * @author hyunjae
	 * @param int : placeNo
	 * @return boolean
	 */	
	boolean deletePlaceImg(int placeNo);
	/**
	 * 중간 테이블 attachmentNo 추출 메소드
	 * @author hyunjae
	 * @param int : placeNo
	 * @return int : attachmetNo
	 */	
	int placeImgSearch(int placeNo);
}
