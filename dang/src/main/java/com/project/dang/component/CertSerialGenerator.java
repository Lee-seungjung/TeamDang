package com.project.dang.component;

public interface CertSerialGenerator {

	/**
	 * 인증번호 반환
	 * @param power
	 * @return 멱(power)에 해당하는 자릿수 범위 내의 인증번호
	 */
	public String generateCertNo(int power);
}
