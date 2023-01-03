package com.project.dang.repository;

import com.project.dang.dto.DangCertDto;

public interface DangCertDao {

	/**
	 * 인증정보 등록
	 * @param dangCertDto : 인증메일 주소, 인증번호
	 */
	public void insertCert(DangCertDto dangCertDto);
	
	/**
	 * 인증정보 삭제
	 * @param certEmail : 인증메일 주소
	 * @return boolean : 인증정보 삭제 여부
	 */
	public boolean deleteCert(String certEmail);
	
	/**
	 * 특정 이메일에 발급된 인증번호 조회
	 * @param certEmail : 인증메일 주소
	 * @return certSerial : 인증번호
	 */
	public String selectCert(String certEmail);
}
