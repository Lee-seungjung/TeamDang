package com.project.dang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.repository.DangPuppyDao;

@Controller
@RequestMapping("/puppy")
public class DangPuppyController {

	@Autowired
	private DangPuppyDao dangPuppyDao;
	
	// 댕댕이 수정
	@GetMapping("/edit_info")
	public String editPuppyInfo(HttpSession session) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		return "dang_puppy/edit_puppy_info";
	}
}
