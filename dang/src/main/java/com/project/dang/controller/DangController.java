package com.project.dang.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.project.dang.dto.AttachmentDto;
import com.project.dang.dto.DangDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.dto.RoomDto;
import com.project.dang.repository.AttachmentDao;
import com.project.dang.repository.DangBoardDao;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.repository.DangReplyDao;
import com.project.dang.repository.DangScheduleDao;
import com.project.dang.vo.BoardHistoryVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/dang")
@Slf4j
public class DangController {
	
	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private AttachmentDao attachmentDao;
	
	@Autowired
	private DangChatDao dangChatDao;	
	@Autowired
	private DangMemberDao dangMemberDao;
	@Autowired
	private DangBoardDao dangBoardDao;
	@Autowired
	private DangReplyDao dangReplyDao;
	@Autowired
	private DangScheduleDao dangScheduleDao;
	
	// 기준 경로 설정
	private File directory = new File(System.getProperty("user.home"),"/dang"); // C드라이브 경로
	//private File directory = new File("D:/upload/dang"); // D드라이브 경로

	// 디렉토리 생성
	@PostConstruct
	public void prepare() {
		directory.mkdirs();
	}
	
	// 댕모임 개설
	@GetMapping("/create")
	public String createDang() {
		return "dang/create";
	}
	
	@PostMapping("/create")
	public String createDang(HttpSession session, @ModelAttribute DangDto dangDto, @ModelAttribute DangMemberDto dangMemberDto, MultipartFile dangProfile) throws IllegalStateException, IOException {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 반환한 회원번호를 dangDto에 설정
		dangDto.setUserNo(userNo);
		// 댕모임 번호 반환
		int dangNo = dangDao.dangNo();
		// 반환한 댕모임 번호를 dangDto에 설정
		dangDto.setDangNo(dangNo);
		// 댕모임 개설
		dangDao.createDang(dangDto);
		// 댕모임 회원번호 반환
		int memberNo = dangMemberDao.memberNo();
		// dangMemberDto 설정
		dangMemberDto.setMemberNo(memberNo);
		dangMemberDto.setDangNo(dangNo);
		dangMemberDto.setUserNo(userNo);
		// 댕모임 개설자 가입
		dangMemberDao.createDang(dangMemberDto);
		// 댕모임 채팅방 번호 반환
		int roomNo = dangChatDao.roomSequence();
		// 댕모임 채팅방 개설
		dangChatDao.roomInsert(RoomDto.builder().roomNo(roomNo).dangNo(dangNo).build());
		// 만약 첨부파일이 있다면
		if(dangProfile.getSize() != 0) {			
			// 댕모임 첨부파일 번호 반환
			int attachmentNo = attachmentDao.sequence();
			// 첨부파일 테이블 등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(dangProfile.getOriginalFilename())
					.attachmentType(dangProfile.getContentType())
					.attachmentSize(dangProfile.getSize())
				.build());
			// 첨부파일 저장 하위경로 설정
			File target = new File(directory, String.valueOf(attachmentNo));
			// 첨부파일 전송
			dangProfile.transferTo(target);
			// 댕모임 프로필 테이블 등록
			dangDao.insertDangImg(dangNo, attachmentNo);
		}
		// 댕모임 홈 화면으로 이동
		return "redirect:/dang/"+dangNo;
	}
	
	@GetMapping("/{dangNo}")
	public String dangChatMain(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// DB방번호 조회
		Integer roomNo = dangChatDao.findRoomNo(dangNo);
		// 기본 채팅 내역
		model.addAttribute("history", dangChatDao.listAll(roomNo));
		// 채팅 내역 없을 경우의 roomNo 전송
		model.addAttribute("roomNo", roomNo);
		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));
		
		return "dang/chat";
	}
	
	@GetMapping("/{dangNo}/board")
	public String dangBoard(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));
		
		//기본 동기 조회(5개)
		model.addAttribute("boardList", dangBoardDao.selectAll(dangNo));
		List<BoardHistoryVO> vo = dangBoardDao.selectAll(dangNo); 
		
		return "dang/board";
	}
	
	@GetMapping("/{dangNo}/calendar")
	public String dangCalendar(@PathVariable int dangNo, Model model, HttpSession session) {

		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);

		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));

		return "dang/calendar";
	}
	
	@GetMapping("/{dangNo}/album")
	public String dangAlbum(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));
		
		return "dang/album";
	}
	
	@GetMapping("/{dangNo}/chat")
	public String dangChat(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// DB방번호 조회
		int roomNo = dangChatDao.findRoomNo(dangNo);
		// 기본 채팅 내역
		model.addAttribute("history", dangChatDao.listAll(roomNo));
		// 채팅 내역 없을 경우의 roomNo 전송
		model.addAttribute("roomNo", roomNo);
		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));
		
		return "dang/chat";
	}
	
	@GetMapping("/{dangNo}/member")
	public String dangMember(@PathVariable int dangNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));
		
		return "dang/member";
	}
	
	@GetMapping("/{dangNo}/schedule_detail")
	public String scheduleDetail(@PathVariable int dangNo, int scheduleNo, Model model, HttpSession session) {
		// 특정 댕모임 내 메뉴 이동을 위해 dangNo를 Model에 추가
		model.addAttribute("dangNo", dangNo);
		// 회원 정보
		String userNo = String.valueOf(session.getAttribute("loginNo"));
		DangMemberDto dto = DangMemberDto.builder()
				.dangNo(dangNo)
				.userNo(Integer.parseInt(userNo))
				.build();
		DangMemberDto memberDto = dangMemberDao.selectOne(dto);
		model.addAttribute("profile", memberDto);
		
		//오늘 출석여부 확인
		model.addAttribute("attendance", dangMemberDao.isAttendance(memberDto.getMemberNo()));
		//참여모임 수
		model.addAttribute("joinDangCount", dangMemberDao.joinDangCount(Integer.parseInt(userNo)));
		//작성글
		model.addAttribute("boardWriteCount", dangBoardDao.boardWriteCount(memberDto.getMemberNo()));
		//댓글
		model.addAttribute("replyWriteCount", dangReplyDao.ReplyWriteCount(memberDto.getMemberNo()));
		//우측 댕모임 심플스케줄
		model.addAttribute("simpleSchedule", dangScheduleDao.simpleList());
		//프로필 파일번호
		model.addAttribute("attachmentNo", dangMemberDao.findAttachmentNo(Integer.parseInt(userNo)));
		//날짜별 일정 상세 출력
		model.addAttribute("scheduleDetail", dangScheduleDao.detail(scheduleNo));
		return "dang/schedule_detail";
	}
	
}
