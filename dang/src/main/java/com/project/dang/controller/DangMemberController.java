package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.dto.DangMemberJoinDto;
import com.project.dang.repository.DangMemberDao;

@Controller
@RequestMapping("/member")
public class DangMemberController {

	@Autowired
	private DangMemberDao dangMemberDao;
	
	// 댕모임 가입
	@PostMapping("/join")
	public String join(@ModelAttribute DangMemberJoinDto dangMemberJoinDto) {
		// 댕모임 회원 번호 반환
		int memberNo = dangMemberDao.memberNo();
		// 입력받은 DangMemberDto에서 회원 번호 설정
		dangMemberJoinDto.setMemberNo(memberNo);
		System.out.println(dangMemberJoinDto.toString());
		// 댕모임 가입
		dangMemberDao.joinDang(dangMemberJoinDto);
		return "redirect:/dang/"+dangMemberJoinDto.getDangNo();
	}
}
