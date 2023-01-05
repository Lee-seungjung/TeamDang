package com.project.dang.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangScheduleDao;
import com.project.dang.vo.SimpleScheduleVO;

@Controller
@RequestMapping("/dang")
public class DangController {
	
	@Autowired
	private DangChatDao dangChatDao;
	
	@Autowired
	private DangScheduleDao dangScheduleDao;

	@GetMapping("/{dangNo}")
	public String dangChatMain(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// DB방번호 조회
		int roomNo = dangChatDao.findRoomNo(dangNo);
		//model.addAttribute("roomNo", roomNo);
		
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		model.addAttribute("userNo", userNo);
		
		//로그인 미구현 상태로 상대방이 없음,,ㅠ 코드 나중에 변경가능성 있음!!!
		//일단 채팅방 메세지 최대10개 출력할 예정
		//(테이블 조인으로 방번호 포함됨-위에 방번호 model 주석처리 후 사용예정)
		//조인 : 채팅, 회원프로필(order by 채팅번호 asc)
		model.addAttribute("history", dangChatDao.listAll(roomNo));
		
		return "dang/chat";
	}
	
	@GetMapping("/{dangNo}/board")
	public String dangBoard(@PathVariable int dangNo, Model model) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		return "dang/board";
	}
	
	@GetMapping("/{dangNo}/calendar")
	public String dangCalendar(@PathVariable int dangNo, Model model ) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		
		/*
		 * // 우측 댕모임 심플스케줄 출력 위해 simpleList를 Model에 추가
		 * model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		 */
		
		
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

		return "dang/chat";
	}
	
	@GetMapping("/{dangNo}/member")
	public String dangMember(@PathVariable int dangNo, Model model) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		return "dang/member";
	}
}
