package com.project.dang.component;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.springframework.stereotype.Component;

@Component
public class CertSerialGeneratorImpl implements CertSerialGenerator {

	// Random 인스턴스 생성
	private Random random = new Random();
	
	@Override
	public String generateCertNo(int power) {
		// 난수 생성
		int range = (int)Math.pow(10, power); // 범위 설정 : 10의 거듭제곱(power)
		int randomNo = random.nextInt(range); // 해당 범위 내에서 난수 생성
		// 자릿수 보정
		StringBuffer buffer = new StringBuffer(); // power만큼 0을 붙인 문자열 생성
		for (int i = 0; i < power; i++) {
			buffer.append("0");
		}
		Format formatCertNo = new DecimalFormat(buffer.toString()); // 자릿수 보정을 위한 format 생성
		String certNo = formatCertNo.format(randomNo); // 난수의 비어있는 자릿수에 0으로 채워서 보정
		// 인증번호(보정한 난수) 반환
		return certNo;
	}
}
