package com.project.dang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dang.dto.DangListAdminDto;
import com.project.dang.dto.DangListAdminRestRequestDto;
import com.project.dang.dto.DangPlaceDto;
import com.project.dang.dto.DangUserDetailDto;
import com.project.dang.dto.DangUserListDto;
import com.project.dang.dto.MemberListDto;
import com.project.dang.dto.MemberListRequestDto;
import com.project.dang.dto.PlaceListRequestDto;
import com.project.dang.dto.PuppyListDto;
import com.project.dang.dto.PuppyListRequestDto;
import com.project.dang.dto.ReportListRequestDto;
import com.project.dang.dto.UserListRequestDto;
import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.repository.DangPlaceDao;
import com.project.dang.repository.DangPuppyDao;
import com.project.dang.repository.DangReportDao;
import com.project.dang.repository.DangUserDao;
import com.project.dang.vo.ReportOneListVO;

@Controller
@RequestMapping("/admin")
public class DangAdmin {

	@Autowired
	DangPlaceDao dangPlaceDao;
	@Autowired
	AdminDao adminDao;
	@Autowired
	private DangReportDao dangReportDao;
	@Autowired
	private DangMemberDao dangMemberDao;
	@Autowired
	private DangChatDao dangChatDao;
	
	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private DangPuppyDao dangPuppyDao;
	
	//관리자 페이지 대쉬보드(홈)으로 이동 맵핑
	@GetMapping("/dash_board")
	public String dashBoard(Model model) {
		model.addAttribute("recentLogin",adminDao.recentLogin());
		model.addAttribute("recentJoin",adminDao.recentJoin());
		model.addAttribute("recentDang",adminDao.recentDang());
		model.addAttribute("recentSchdule",adminDao.recentSchdule());
		
		return "dang_admin/dashBoard";
	}
	//관리자 페이지 장소목록 이동 맵핑
	@GetMapping("/place_list")
	public String placeList(Model model, @ModelAttribute PlaceListRequestDto placeListRequestDto) {
		int count = dangPlaceDao.countPlace(placeListRequestDto);
		placeListRequestDto.setCount(count);
		List<DangPlaceDto> placeList = dangPlaceDao.selectList(placeListRequestDto);
		model.addAttribute("placeList", placeList);
		return "dang_admin/list";
	}
	//관리자 페이지 장소목록 이동 맵핑
	@GetMapping("/place_insert")
	public String placeInsert() {
		return "dang_admin/insert";
	}
	
	//관리자페이지 신고
	@GetMapping("/report")
	public String report(Model model, @ModelAttribute ReportListRequestDto reportListRequestDto) {
		//신고 현황 카운트
		model.addAttribute("cnt", dangReportDao.cnt());
		//신고 목록 조회(첫화면)
		if(reportListRequestDto.getReportState()==null) {
			reportListRequestDto.setReportState("접수");
		}
		// 조회에 맞는 신고 갯수 반환
		int reportCount = dangReportDao.reportListCount(reportListRequestDto);
		// 갯수 설정
		reportListRequestDto.setTotal(reportCount);
		model.addAttribute("list", dangReportDao.reportList(reportListRequestDto));
		System.out.println(reportListRequestDto.getReportState());
		return "dang_admin/report";
	}
	
	//관리자페이지 신고 상세
	@GetMapping("/report_detail")
	public String reportDetail(@RequestParam int reportNo, 
			Model model) {
		//신고 단일조회
		ReportOneListVO vo = dangReportDao.selectOne(reportNo);
		model.addAttribute("detail", vo);
		//파일 조회
		model.addAttribute("img", dangReportDao.imgSelectList(reportNo));
		//신고 누적수(완료건) 조회
		model.addAttribute("reportAppCnt", dangReportDao.reportAppCnt(vo.getDangNo(), vo.getUserNo()));
		//가장 오래된 멤버 조회
		model.addAttribute("oldMember", dangMemberDao.oldOneMember(vo.getDangNo()));
		//채팅방 번호 조회
		model.addAttribute("roomNo", dangChatDao.findRoomNo(vo.getDangNo()));
		return "dang_admin/report_detail";
	}
	
	// 개설된 댕모임 조회
	@GetMapping("/dang_list")
	public String selectDangList(Model model, @ModelAttribute DangListAdminRestRequestDto dangListAdminRestRequestDto) {
		// 조건에 따른 조회 총 갯수 반환
		int countDangListAdmin = dangDao.countDangListAdmin(dangListAdminRestRequestDto);
		// dto에 총 갯수 설정
		dangListAdminRestRequestDto.setTotal(countDangListAdmin);
		// 댕모임 목록 전체/검색 조회
		List<DangListAdminDto> dangListAdmin = dangDao.searchDangListAdmin(dangListAdminRestRequestDto);
		System.out.println(dangListAdminRestRequestDto.toString());
		System.out.println(dangListAdmin.toString());
		model.addAttribute("dangListAdmin", dangListAdmin);
		return "dang_admin/dang_list";
	}
	
	//회원목록 조회(회원관리 현황)
	@GetMapping("/user_list")
	public String UserList(Model model, @ModelAttribute UserListRequestDto userListRequestDto 
			, @ModelAttribute PuppyListRequestDto puppyListRequestDto, @ModelAttribute MemberListRequestDto memberListRequestDto ) {
		// 회원 목록 전체 조회
		List<DangUserListDto> userListAdmin = dangUserDao.UserList();
		//System.out.println(userListAdmin.toString());
		model.addAttribute("userListAdmin", userListAdmin);
		// 총 회원수 조회
		int userTotal = dangUserDao.userCount(userListRequestDto);
		// dto에 총 갯수 설정
		userListRequestDto.setTotal(userTotal);
		//System.out.println(userTotal);
		model.addAttribute("userTotal",userTotal);
		// 회원 목록 전체/ 검색 조회
		List<DangUserListDto> userListAdminB = dangUserDao.searchUserListAdmin(userListRequestDto);
		model.addAttribute("userListAdminB", userListAdminB);
		//총 댕댕이 등록 수 조회
		int dangTotal = dangPuppyDao.dangCount(puppyListRequestDto);
		model.addAttribute("dangTotal", dangTotal);
		// 총 댕모임 가입자수 조회
		int dangMemberTotal = dangMemberDao.dangJoinCount(memberListRequestDto);
		model.addAttribute("dangMemberTotal", dangMemberTotal);
		return "dang_admin/user_list";
	}
	
	//회원목록 조회 상세(회원관리 현황)
	@GetMapping("/user_detail")
	public String userDetail(Model model, @RequestParam int userNo) {
		System.out.println(userNo); 
		DangUserDetailDto userDetail = dangUserDao.userDetail(userNo);
		// 회원 목록 상세 조회		
		model.addAttribute("userDetail", userDetail);
		return "dang_admin/user_detail";
	}
	
	//댕댕이 목록 조회(회원관리 현황)
	@GetMapping("/puppy_list")
	public String PuppyList(Model model, @ModelAttribute UserListRequestDto userListRequestDto 
			, @ModelAttribute PuppyListRequestDto puppyListRequestDto, @ModelAttribute MemberListRequestDto memberListRequestDto ) {
		// 총 회원수 조회
		int userTotal = dangUserDao.userCount(userListRequestDto);
		// dto에 총 갯수 설정
		userListRequestDto.setTotal(userTotal);
		//System.out.println(userTotal);
		model.addAttribute("userTotal",userTotal);
		// 댕댕이 목록 전체/ 검색 조회
		List<PuppyListDto> puppyListAdmin = dangPuppyDao.searchPuppyListAdmin(puppyListRequestDto);
		model.addAttribute("puppyListAdmin", puppyListAdmin);
		//총 댕댕이 등록 수 조회
		int dangTotal = dangPuppyDao.dangCount(puppyListRequestDto);
		model.addAttribute("dangTotal", dangTotal);
		// 총 댕모임 가입자수 조회
		int dangMemberTotal = dangMemberDao.dangJoinCount(memberListRequestDto);
		model.addAttribute("dangMemberTotal", dangMemberTotal);
		return "dang_admin/puppy_list";
	}
	
	//댕모임 멤버 목록 조회(회원관리 현황)
	@GetMapping("/member_list")
	public String MemberList(Model model, @ModelAttribute UserListRequestDto userListRequestDto 
			, @ModelAttribute PuppyListRequestDto puppyListRequestDto, @ModelAttribute MemberListRequestDto memberListRequestDto ) {
		// 총 회원수 조회
		int userTotal = dangUserDao.userCount(userListRequestDto);
		// dto에 총 갯수 설정
		userListRequestDto.setTotal(userTotal);
		//System.out.println(userTotal);
		model.addAttribute("userTotal",userTotal);
		// 댕모임 멤버 목록 전체/ 검색 조회
		List<MemberListDto> memberListAdmin = dangMemberDao.searchMemberListAdmin(memberListRequestDto);
		model.addAttribute("memberListAdmin", memberListAdmin);
		//총 댕댕이 등록 수 조회
		int dangTotal = dangPuppyDao.dangCount(puppyListRequestDto);
		model.addAttribute("dangTotal", dangTotal);
		// 총 댕모임 가입자수 조회
		int dangMemberTotal = dangMemberDao.dangJoinCount(memberListRequestDto);
		model.addAttribute("dangMemberTotal", dangMemberTotal);
		return "dang_admin/member_list";
	}
}
