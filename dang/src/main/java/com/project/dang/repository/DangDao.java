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
}
