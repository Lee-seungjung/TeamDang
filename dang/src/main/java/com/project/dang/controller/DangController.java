package com.project.dang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangMemberDao;

@Controller
@RequestMapping("/dang")
public class DangController {
	
	@Autowired
	private DangChatDao dangChatDao;
	@Autowired
	private DangMemberDao dangMemberDao;


	@GetMapping("/{dangNo}")
	public String dangChatMain(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// DB방번호 조회
		int roomNo = dangChatDao.findRoomNo(dangNo);
		
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		model.addAttribute("userNo", userNo);
		
		//로그인 미구현 상태로 상대방이 없음,,ㅠ 코드 나중에 변경가능성 있음!!!
		//일단 채팅방 메세지 최대10개 출력할 예정
		//조인 : 채팅, 회원프로필(order by 채팅번호 asc)
		model.addAttribute("history", dangChatDao.listAll(roomNo));
		
		//프로필 정보 데이터 준비
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		
		return "dang/chat";
	}
	
	@GetMapping("/{dangNo}/board")
	public String dangBoard(@PathVariable int dangNo, Model model) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		return "dang/board";
	}
	
	@GetMapping("/{dangNo}/calendar")
	public String dangCalendar(@PathVariable int dangNo, Model model) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		return "dang/calendar";
	}
	
	@GetMapping("/{dangNo}/album")
	public String dangAlbum(@PathVariable int dangNo, Model model) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		return "dang/album";
	}
	
	@GetMapping("/{dangNo}/chat")
	public String dangChat(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// DB방번호 조회
		int roomNo = dangChatDao.findRoomNo(dangNo);
		//model.addAttribute("roomNo", roomNo);
		
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		model.addAttribute("userNo", userNo);
		
		model.addAttribute("history", dangChatDao.listAll(roomNo));
		
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));

		return "dang/chat";
	}
	
	@GetMapping("/{dangNo}/member")
	public String dangMember(@PathVariable int dangNo, Model model) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		return "dang/member";
	}
}
