package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangPlaceDto;

public interface DangPlaceDao {
	
	/**
	 * @author hyunjae
	 * @param DangPlaceDto : 모임장소 테이블 클래스
	 */
	void placeInsert(DangPlaceDto dangPlaceDto);
	
	List<DangPlaceDto> placeList();
}
