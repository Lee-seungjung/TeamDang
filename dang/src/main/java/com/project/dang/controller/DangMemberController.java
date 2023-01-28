package com.project.dang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dang.dto.DangMemberJoinDto;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangMemberDao;

@Controller
@RequestMapping("/member")
public class DangMemberController {

	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private DangMemberDao dangMemberDao;
	
	@Autowired
	private DangChatDao dangChatDao;
	
	// 댕모임 가입
	@PostMapping("/join")
	public String join(@ModelAttribute DangMemberJoinDto dangMemberJoinDto) {
		// 댕모임 회원 번호 반환
		int memberNo = dangMemberDao.memberNo();
		// 입력받은 DangMemberDto에서 회원 번호 설정
		dangMemberJoinDto.setMemberNo(memberNo);
		// 댕모임 가입
		dangMemberDao.joinDang(dangMemberJoinDto);
		// 댕모임 회원수 반환
		int dangHead = dangMemberDao.countMember(dangMemberJoinDto.getDangNo());
		// 댕모임 회원수 갱신
		dangDao.updateDangHead(dangMemberJoinDto.getDangNo(), dangHead);
		return "redirect:/dang/"+dangMemberJoinDto.getDangNo();
	}
	
	@GetMapping("/delete_success")
	public String dangDelete(@RequestParam int dangNo, HttpSession session) {
		//댕모임 회원수 감소
		dangDao.minusDangHead(dangNo);
		//채팅내역 삭제
		int roomNo = dangChatDao.findRoomNo(dangNo);
		Integer userNo = (Integer)session.getAttribute("loginNo");
		dangChatDao.deleteChatList(roomNo, userNo);
		return "dang/delete_success";
	}
}
