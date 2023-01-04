package com.project.dang.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.MessagingException;

public interface DangCertEmailService {

	/**
	 * 인증 이메일 발송 후 인증번호 반환
	 * @param certEmail : 이메일 주소
	 * @return String : 인증 번호
	 * @throws MessagingException
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public String sendEmail(String certEmail) throws MessagingException, FileNotFoundException, IOException;
}
