package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangInterestDto;

public interface DangInterestDao {

	/**
	 * 관심지역 등록
	 * @param dangInterestDto : 회원 번호, 관심지역명
	 */
	public void insertInterest(DangInterestDto dangInterestDto);
	
	/**
	 * 관심지역 조회
	 * @param userNo : 회원 번호
	 * @return List<String> : 관심지역명 List
	 */
	public List<String> selectInterest(int userNo);
	
	/**
	 * 관심지역 전체 삭제
	 * @param userNo : 회원 번호
	 * @return boolean : 삭제 여부
	 */
	public boolean deleteInterest(int userNo);
}
