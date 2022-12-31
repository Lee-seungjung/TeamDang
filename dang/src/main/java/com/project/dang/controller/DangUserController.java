package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.dto.DangUserDto;
import com.project.dang.repository.DangUserDao;

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
		int userNo = dangUserDao.userNo();
		dangUserDto.setUserNo(userNo);
		dangUserDao.join(dangUserDto);
		return "redirect:/";
	}
}
