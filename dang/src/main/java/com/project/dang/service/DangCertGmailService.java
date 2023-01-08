package com.project.dang.service;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Scanner;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.project.dang.component.CertSerialGenerator;
import com.project.dang.dto.DangCertDto;
import com.project.dang.repository.DangCertDao;

@Service
public class DangCertGmailService implements DangCertEmailService {
	
	@Autowired
	private CertSerialGenerator certSerialGenerator;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private DangCertDao dangCertDao;

	@Override
	public String sendEmail(String certEmail) throws MessagingException, FileNotFoundException, IOException {
		
		// 인증 번호 반환
		String certSerial = certSerialGenerator.generateCertNo(6);
		
		// MimeMessage의 인스턴스 생성
		MimeMessage message = javaMailSender.createMimeMessage();
			
		// MimeMessageHelper의 인스턴스 생성
		MimeMessageHelper helper = new MimeMessageHelper(message, false, "UTF-8");
		
		// 정보 설정
		helper.setTo(certEmail);
		helper.setSubject("댕모임 인증번호");
		
		// Spring 프로젝트 내 Resource 파일 읽기
		ClassPathResource resource = new ClassPathResource("email/dang_cert_join.html");
		
		// 해당 Resource 파일의 내용을 StringBuffer로 연결
		StringBuffer buffer = new StringBuffer();
		try(Scanner sc = new Scanner(resource.getFile())){ 
			while(sc.hasNextLine()) {
				buffer.append(sc.nextLine());
			}
		}
		String text = buffer.toString();
		// StringBuffer로 생성한 문자열을 HTML로 파싱(parsing)
		Document document = Jsoup.parse(text);
		// doc에서 'user-name'이라는 id를 가진 요소를 선택
		Element element = document.getElementById("cert-serial"); 
		// 선택한 요소에 해당 문자열을 설정(대체)
		element.text(certSerial); 
		// 내용(text)에 들어갈 값 및 html 적용여부 설정
		helper.setText(document.toString(), true);
		
		// Mime 메시지 전송
		javaMailSender.send(message);
		
		// 데이터베이스 등록
		// - 이전에 해당 이메일로 보냈던 인증번호 정보 삭제
		dangCertDao.deleteCert(certEmail);
		// - 새로 발급된 인증번호 정보 등록
		DangCertDto dangCertDto = DangCertDto.builder().certSerial(certSerial).certEmail(certEmail).build();
		dangCertDao.insertCert(dangCertDto);
		
		System.out.println(certSerial);
		
		// 인증번호 반환
		return certSerial;
	}
}
