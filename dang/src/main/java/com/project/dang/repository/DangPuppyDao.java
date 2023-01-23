package com.project.dang.repository;

import com.project.dang.dto.DangPuppyDto;

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
}
