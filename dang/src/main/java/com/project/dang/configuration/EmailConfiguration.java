package com.project.dang.configuration;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfiguration {

	// EmailProperties에 대한 의존성 주입
	@Autowired
	private EmailProperties emailProperties;
	
	// JavaMailSender의 인스턴스를 반환하는 메소드를 bean으로 등록
	@Bean
	public JavaMailSender returnMailSender() {
		// JavaMailSender 구현체의 인스턴스 생성
		JavaMailSenderImpl emailSender = new JavaMailSenderImpl();
		emailSender.setHost(emailProperties.getHost()); // Host 이름 설정
		emailSender.setPort(emailProperties.getPort()); // Port 번호 설정
		emailSender.setUsername(emailProperties.getUsername()); // 사용자 아이디 설정
		emailSender.setPassword(emailProperties.getPassword()); // 사용자 비밀번호 설정
		// 추가 설정
		Properties properties = new Properties();
		properties.setProperty("mail.smtp.auth", "true"); // 인증 여부
		properties.setProperty("mail.smtp.debug", "true"); // 디버깅 사용 여부
		properties.setProperty("mail.smtp.starttls.enable", "true"); // TLS 사용 여부
		properties.setProperty("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 버전 설정
		properties.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com"); // 신뢰할 수 있는 대상으로 추가
		
		emailSender.setJavaMailProperties(properties);
		
		return emailSender; // 반환 객체는 JavaMailSenderImpl이지만 JavaMailSender로 업캐스팅
	}
}
