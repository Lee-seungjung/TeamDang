package com.project.dang.service;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.MessagingException;

public interface DangCertEmailService {

	/**
	 * 이메일 발송
	 * @param certEmail : 이메일 주소
	 * @throws MessagingException 
	 * @throws IOException 
	 * @throws FileNotFoundException 
	 */
	public void sendEmail(String certEmail) throws MessagingException, FileNotFoundException, IOException;
}
