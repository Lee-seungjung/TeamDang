package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangPlaceDao;
import com.project.dang.repository.DangReportDao;

@Controller
@RequestMapping("/admin")
public class DangAdmin {

	@Autowired
	DangPlaceDao dangPlaceDao;
	@Autowired
	AdminDao adminDao;
	@Autowired
	private DangReportDao dangReportDao;
	
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
	public String report(Model model, @RequestParam(required = false) String reportState) {
		//신고 현황 카운트
		model.addAttribute("cnt", dangReportDao.cnt());
		//신고 목록 조회(첫화면)
		if(reportState==null) {
			reportState="접수";
		}
		String type="";
		String keyword="";
		model.addAttribute("list", dangReportDao.reportList(reportState, type, keyword));
		return "dang_admin/report";
	}
	
	//관리자페이지 신고 상세
	@GetMapping("/report_detail")
	public String reportDetail(@RequestParam int reportNo, 
			Model model) {
		//신고 단일조회
		model.addAttribute("detail", dangReportDao.selectOne(reportNo));
		//파일 조회
		model.addAttribute("img", dangReportDao.imgSelectList(reportNo));
		return "dang_admin/report_detail";
	}
	
}
