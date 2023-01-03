package com.project.dang.restcontroller;

import java.io.FileNotFoundException;
import java.io.IOException;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.repository.DangUserDao;
import com.project.dang.service.DangCertEmailService;
import com.project.dang.vo.DangUserVO;

@RestController
@RequestMapping("/rest_user")
public class DangUserRestController {
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private DangCertEmailService dangCertEmailService;

	// 아이디 중복 검사
	@GetMapping("/check_id")
	public boolean checkId(@RequestParam String userId) {
		// 입력한 아이디로 회원 정보 단일 조회
		DangUserVO searchUserVO = dangUserDao.checkId(userId);
		// 만약 조회 정보가 존재한다면 (이미 존재하는 아이디라면)
		if(searchUserVO != null) return false; // false를 반환
		// 그 외의 경우에는
		return true; // true를 반환 (중복되지 않는 아이디)
	}
	
	// 이메일 전송
	@GetMapping("/send_email")
	public void sendEmail(@RequestParam String userEmail) throws FileNotFoundException, MessagingException, IOException {
		dangCertEmailService.sendEmail(userEmail);
	}
	
	// 인증번호 조회
	/*
	 * @GetMapping("/check_serial") public String checkSerial(@RequestParam String
	 * userEmail) {
	 * 
	 * }
	 */
}
