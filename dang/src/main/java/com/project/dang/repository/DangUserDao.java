package com.project.dang.repository;

import com.project.dang.dto.DangUserDto;
import com.project.dang.vo.DangUserLoginVO;

public interface DangUserDao {

	/**
	 * 회원 번호 반환
	 * @return userNo
	 */
	public int userNo();
	
	/**
	 * 회원 가입
	 * @param dangUserDto
	 */
	public void join(DangUserDto dangUserDto);
	
	/**
	 * ID 검사 : 로그인 요청시 입력한 아이디와 일치하는 회원 정보 조회
	 * @param userId : 입력 아이디
	 * @return DangUserLoginVO : 회원 번호, 회원 아이디, 회원 비밀번호, 
	 */
	public DangUserLoginVO loginIdCheck(String userId);
	
	/**
	 * PW 검사 : 로그인 요청시 입력한 비밀번호가 특정 아이디의 비밀번호와 일치하는지 여부 반환
	 * @param inputPw : 입력 비밀번호
	 * @param searchPw : 암호화된 비밀번호
	 * @return boolean : 비밀번호 일치 여부
	 */
	public boolean loginPwCheck(String inputPw, String searchPw);	
}
