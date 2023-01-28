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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.dang.dto.AttachmentDto;
import com.project.dang.dto.DangDto;
import com.project.dang.dto.DangListRequestDto;
import com.project.dang.dto.DangListResponseDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;
import com.project.dang.dto.RoomDto;
import com.project.dang.repository.AttachmentDao;
import com.project.dang.repository.DangBoardDao;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangInterestDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.repository.DangReplyDao;
import com.project.dang.repository.DangReportDao;
import com.project.dang.repository.DangScheduleDao;
import com.project.dang.vo.DangEditInfoVO;
import com.project.dang.vo.ReportInsertVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/dang")
@Slf4j
public class DangController {
	
	@Autowired
	private DangDao dangDao;
	@Autowired
	private DangInterestDao dangInterestDao;
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
	@Autowired
	private DangReportDao dangReportDao;

	
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
			// 댕모임 프로필 테이블 등록
			dangDao.insertDangImg(dangNo, attachmentNo);
			// 첨부파일 저장 하위경로 설정
			File target = new File(directory, String.valueOf(attachmentNo));
			// 첨부파일 전송
			dangProfile.transferTo(target);
		}
		// 댕모임 홈 화면으로 이동
		return "redirect:/dang/"+dangNo;
	}
	
	// 댕모임 찾기
	@GetMapping("/search")
	public String searchDang(HttpSession session, @ModelAttribute DangListRequestDto dangListRequestDto, Model model) {
		// 로그인 중인 회원번호 반환
		Integer userNo = (Integer)session.getAttribute("loginNo");
		// 로그인 중이라면
		if(userNo != null) {
			// 등록했던 관심지역을 조회하여 model에 추가
			List<String> dangInterest = dangInterestDao.selectInterest(userNo);
			model.addAttribute("dangInterest", dangInterest);
			// 입력받은 DangListRequestDto의 회원 번호를 로그인 중인 회원 번호로 설정
			dangListRequestDto.setUserNo(userNo);
		}
		// 로그인 중인 회원이 관심지역에 대해 조회를 한 경우
		if(userNo != null && dangListRequestDto.getSearchArea() != null) {
			// 관심지역 전체에 대한 조회일 경우
			if(dangListRequestDto.getSearchArea().get(0).equals("all")) {
				// 입력받은 DangListRequestDto의 관심지역 필드를 해당 회원의 관심지역으로 설정
				dangListRequestDto.setSearchArea(dangInterestDao.selectInterest(userNo));
			}
		}
		// 댕모임 전체/검색 조회 총 갯수 반환
		int countDangTotal = dangDao.countDangTotal(dangListRequestDto);
		// 반환한 총 갯수를 입력받은 DangListRequestDto에 설정
		dangListRequestDto.setTotal(countDangTotal);
		// 마지막 페이지 블럭 번호를 model에 추가
		model.addAttribute("pLast", dangListRequestDto.blockLast());
		// 댕모임 전체/검색 조회
		List<DangListResponseDto> dangList = dangDao.selectDangList(dangListRequestDto);
		if(userNo != null) {
			// 회원이 가입한 댕모임 번호 조회
			List<Integer> searchDangListAlreadyJoin = dangMemberDao.searchDangAlreadyJoin(userNo);
			// 댕모임 전체/검색 조회 목록에 가입 여부 설정
			for(int i = 0 ; i < dangList.size() ; i ++) { // 댕모임 전체/검색 조회 목록에 대해
				for(int j = 0 ; j < searchDangListAlreadyJoin.size() ; j ++) { // 회원이 가입한 댕모임 번호 목록 길이만큼 반복
					if(dangList.get(i).getDangInfo().getDangNo().equals(searchDangListAlreadyJoin.get(j))) { // 댕모임 전체/검색 조회 목록의 i번째 댕모임 번호가 회원이 가입한 댕모임 번호 목록의 j번째와 같을 때
						dangList.get(i).getDangInfo().setIsMember(1); // 해당 댕모임 정보의 댕모임 가입 여부(isMember) 필드의 값을 1로 변경
					}
				}
			}
		}
		// 조회 결과를 model에 추가
		model.addAttribute("dangList", dangList);
		return "dang/search";
	}
	
	// 댕모임 수정
	@GetMapping("/{dangNo}/edit")
	public String dangEdit(@PathVariable int dangNo, Model model, HttpSession session) {
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
		
		// 수정할 댕모임 정보를 조회하여 model에 추가
		model.addAttribute("dangEditInfo", dangDao.selectDangEditInfo(dangNo));
		
		return "dang/edit";
	}
	
	@PostMapping("/{dangNo}/edit")
	public String dangEdit(@PathVariable int dangNo, Model model, HttpSession session, @ModelAttribute DangEditInfoVO dangEditInfoVO, MultipartFile dangProfile) throws IllegalStateException, IOException {
		// 댕모임 정보 수정
		dangDao.editDangInfo(dangEditInfoVO);
		// 첨부파일 수정
		if(dangProfile.getSize() != 0) { // 첨부파일이 있다면
			// 기존 첨부파일 조회
			Integer attachmentNoExisting = dangDao.selectDangImg(dangNo);
			if(attachmentNoExisting != null) { // 기존 첨부파일이 존재한다면
				// 첨부파일 테이블에서 정보 삭제 (on delete cascade 조건에 의해 연결 테이블은 자동 삭제)
				attachmentDao.delete(attachmentNoExisting);
				// 기존 첨부파일 이름 반환
				String fileName = String.valueOf(attachmentNoExisting);
				// 삭제할 첨부파일 경로 설정
				File targetExisting = new File(directory, fileName);
				// 기존 첨부파일 삭제
				targetExisting.delete();
			}
			// 새로 첨부파일을 등록하기 위해 번호 반환
			int attachmentNo = attachmentDao.sequence();
			// 첨부파일 정보 DB 등록
			attachmentDao.insert(AttachmentDto.builder()
					.attachmentNo(attachmentNo)
					.attachmentName(dangProfile.getName())
					.attachmentType(dangProfile.getContentType())
					.attachmentSize(dangProfile.getSize())
					.build());
			// 댕모임 프로필 테이블 등록
			dangDao.insertDangImg(dangNo, attachmentNo);
			// 첨부파일 저장 경로 생성
			File target = new File(directory, String.valueOf(attachmentNo));
			// 파일 저장
			dangProfile.transferTo(target);
			// HttpSession에서 기존의 회원 프로필 번호 삭제
			session.removeAttribute("loginProfileImg");
			// 새로운 회원 프로필 번호를 HttpSession에 저장
			session.setAttribute("loginProfileImg", attachmentNo);
		}
		
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
		
		return "redirect:edit";
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
		//신고 정보 확인
		model.addAttribute("report", dangReportDao.checkReport(dangNo, Integer.parseInt(userNo)));
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
		
		//초기 출력값
		model.addAttribute("imgList",dangBoardDao.albumList(dangNo));
		
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
		
		//댕모임 정보
		model.addAttribute("dangInfo",dangDao.selectOne(dangNo));
		//댕모임 참여회원 수
		model.addAttribute("memberCnt", dangMemberDao.countMember(dangNo));
		//댕모임 회원정보
		model.addAttribute("memberList", dangMemberDao.memberList(dangNo));
		return "dang/member";
	}
	
	@GetMapping("/{dangNo}/schedule_detail")
	public String scheduleDetail(@PathVariable int dangNo, @RequestParam int scheduleNo, Model model, HttpSession session) {
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
		model.addAttribute("scheduleDetail", dangScheduleDao.detail(scheduleNo, dangNo));
		//댕모임 일정별 참여인원수 출력
		model.addAttribute("countJoin", dangScheduleDao.countJoin(scheduleNo));
		//댕모임 일정별 참여 멤버 프로필 사진 출력
		model.addAttribute("joinMemberList", dangScheduleDao.joinMemberList(scheduleNo));
		return "dang/schedule_detail";
	}
	
	@GetMapping("/report/{memberNo}")
	public String report(@PathVariable int memberNo,
			HttpSession session, Model model) {
		model.addAttribute("memberInfo", dangMemberDao.restSelectOne(memberNo));
		return "dang/report";
	}
	
	@PostMapping("/report/{memberNo}")
	public String report(@ModelAttribute ReportInsertVO vo, Model model) {
		//신고 번호
		int reportNo = dangReportDao.sequence();
		//신고 테이블 DB등록
		DangReportDto dto = DangReportDto.builder()
				.reportNo(reportNo)
				.dangNo(vo.getDangNo())
				.userNo(vo.getUserNo())
				.memberNick(vo.getMemberNick())
				.reportContent(vo.getReportContent())
				.build();
		dangReportDao.insert(dto);
		//신고 이미지 테이블 DB등록
		List<Integer> attachmentNo = vo.getAttachmentNo();
		for(int i=0; i<attachmentNo.size(); i++) {
			if(attachmentNo.get(i)!=null) {
				dangReportDao.imgInsert(ReportImgDto.builder()
						.attachmentNo(attachmentNo.get(i))
						.reportNo(reportNo)
						.build());
			}
		}
		return "redirect:/dang/report_success";
	}
	
	@GetMapping("/report_success")
	public String reportSuccess() {
		return "dang/report_success";
	}
	
	
}
