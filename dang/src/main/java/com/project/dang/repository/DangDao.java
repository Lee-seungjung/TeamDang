package com.project.dang.repository;

import com.project.dang.dto.DangDto;

public interface DangDao {
	
	/**
	 * 댕모임 번호 반환
	 * @return int (댕모임 번호)
	 */
	public int dangNo();

	/**
	 * 댕모임 개설
	 * @param dangDto
	 */
	public void createDang(DangDto dangDto);
	
	/**
	 * 댕모임 개설 (공개)
	 * @param dangDto
	 */
	public void createDangPublic(DangDto dangDto);
	
	/**
	 * 댕모임 개설 (비공개)
	 * @param dangDto
	 */
	public void createDangPrivate(DangDto dangDto);
	
	/**
	 * 댕모임 프로필 정보 등록
	 * @param dangNo : 댕모임 번호
	 * @param attachmentNo : 첨부파일 번호
	 */
	public void insertDangImg(int dangNo, int attachmentNo);
}
