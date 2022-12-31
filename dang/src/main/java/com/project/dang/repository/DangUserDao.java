package com.project.dang.repository;

import com.project.dang.dto.DangUserDto;

public interface DangUserDao {

	/**
	 * 회원 번호 반환
	 * @return 회원 번호
	 */
	public int userNo();
	
	/**
	 * 회원 가입
	 * @param dangUserDto
	 */
	public void join(DangUserDto dangUserDto);
}
