package com.project.dang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.dto.DangUserDto;
import com.project.dang.repository.DangUserDao;
import com.project.dang.vo.DangUserVO;

@Controller
@RequestMapping("/user")
public class DangUserController {
	
	@Autowired
	private DangUserDao dangUserDao;
	
	// 회원 가입
	@GetMapping("/join")
	public String join() {
		return "dang_user/join";
	}
	
	@PostMapping("/join")
	public String join(@ModelAttribute DangUserDto dangUserDto) {
		// 회원번호를 반환하여 회원 정보로 설정
		int userNo = dangUserDao.userNo();
		dangUserDto.setUserNo(userNo);
		// 회원 가입
		dangUserDao.join(dangUserDto);
		// 로그인 Mapping으로 redirect
		return "redirect:login";
	}
	
	// 회원가입 완료
	@GetMapping("/join_success")
	public String joinSuccess() {
		return "dang_user/join_success";
	}
	
	// 로그인
	@GetMapping("/login")
	public String login() {
		return "dang_user/login";
	}
	
	@PostMapping("/login") 
	public String login(DangUserVO inputUserVO, HttpSession session) {
		// 입력받은 회원 아이디로 회원 정보 단일 조회 (ID 검사)
		DangUserVO searchUserVO = dangUserDao.checkId(inputUserVO.getUserId());
		if(searchUserVO == null) { // 조회 결과가 없다면
			return "redirect:login?error";
		}
		// 비밀번호 일치 여부 판정 (PW 검사)
		boolean pwCheck = dangUserDao.checkPw(inputUserVO.getUserPw(), searchUserVO.getUserPw());
		if(pwCheck) { // 비밀번호가 일치한다면
			session.setAttribute("loginNo", searchUserVO.getUserNo()); // 회원 번호 저장
			session.setAttribute("loginGrade", searchUserVO.getUserGrade()); // 회원 등급 저장
			return "redirect:/";
		} else { // 비밀번호가 일치하지 않는다면
			return "redirect:login?error"; 
		}
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginNo");
		session.removeAttribute("loginGrade");
		return "redirect:/";
	}
}
