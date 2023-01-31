package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dang.dto.ReportListRequestDto;
import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangChatDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.repository.DangPlaceDao;
import com.project.dang.repository.DangReportDao;
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
	public String placeList() {
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
	public String reportDetail(@RequestParam int reportNo, @RequestParam int memberNo,
			Model model) {
		//신고 단일조회
		ReportOneListVO vo = dangReportDao.selectOne(reportNo, memberNo);
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
	public String selectDangList() {
		return "dang_admin/dang_list";
	}
}
