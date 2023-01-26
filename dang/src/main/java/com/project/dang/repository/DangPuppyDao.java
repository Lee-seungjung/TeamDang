package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangPuppyDto;
import com.project.dang.dto.DangPuppyInfoDto;
import com.project.dang.dto.DangPuppyListDto;

public interface DangPuppyDao {

	/**
	 * 댕댕이 번호 반환
	 * @return int : 댕댕이 번호
	 */
	public int puppyNo();
	
	/**
	 * 댕댕이 정보 등록
	 * @param dangPuppyDto : 회원 번호, 댕댕이 번호, 이름, 성별, 나이
	 */
	public void insertPuppy(DangPuppyDto dangPuppyDto);
	
	/**
	 * 댕댕이 특이사항 등록
	 * @param puppyNo : 댕댕이 번호
	 * @param characterContent : 특이사항 내용
	 */
	public void insertPuppyCharacter(int puppyNo, String characterContent);
	
	/**
	 * 댕댕이 프로필 이미지 정보 등록
	 * @param puppyNo : 댕댕이 번호
	 * @param attachmentNo : 첨부파일 번호
	 */
	public void insertPuppyImg(int puppyNo, int attachmentNo);
	
	/**
	 * 특정 회원의 댕댕이 목록
	 * @param userNo : 회원 번호
	 * @return DangPuppyListDto : 댕댕이 정보, 댕댕이 특이사항의 List
	 */
	public List<DangPuppyListDto> selectPuppyList(int userNo);
	
	/**
	 * 댕댕이 정보 변경
	 * @param dangPuppyInfoDto : 댕댕이 번호, 댕댕이 이름, 댕댕이 나이, 댕댕이 성별
	 * @return boolean : 댕댕이 정보 수정 여부
	 */
	public boolean updatePuppy(DangPuppyInfoDto dangPuppyInfoDto);
	
	/**
	 * 댕댕이 특이사항 삭제
	 * @param puppyNo : 댕댕이 번호
	 * @return boolean : 삭제 여부
	 */
	public boolean deletePuppyCharacter(int puppyNo);
	
	/**
	 * 댕댕이 첨부파일 번호 조회
	 * @param puppyNo : 댕댕이 번호
	 * @return Integer : 댕댕이 첨부파일 번호
	 */
	public Integer findPuppyImgNo(int puppyNo);
}
