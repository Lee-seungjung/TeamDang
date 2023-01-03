package com.project.dang.repository;

import com.project.dang.dto.DangUserDto;
import com.project.dang.vo.DangUserVO;

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
	 * ID 검사 : 입력한 아이디와 일치하는 회원 정보 조회
	 * @param userId : 입력 아이디
	 * @return DangUserVO : 회원 번호, 회원 아이디, 회원 비밀번호, 회원 등급
	 */
	public DangUserVO checkId(String userId);
	
	/**
	 * PW 검사 : 입력한 비밀번호가 특정 아이디의 비밀번호와 일치하는지 여부 반환
	 * @param inputPw : 입력 비밀번호
	 * @param searchPw : 암호화된 비밀번호
	 * @return boolean : 비밀번호 일치 여부
	 */
	public boolean checkPw(String inputPw, String searchPw);	
	
	/**
	 * 프로필 파일 번호 찾기
	 * @param userNo : 회원번호
	 * @return attachmentNo : 파일번호
	 */
	public Integer findAttachmentNo(int userNo);
	
	
	
}
