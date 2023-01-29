package com.project.dang.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangPlaceDao;
import com.project.dang.vo.DangGroupRegionVO;

@Controller
@RequestMapping("/admin")
public class DangAdmin {

	@Autowired
	DangPlaceDao dangPlaceDao;
	@Autowired
	AdminDao adminDao;
	
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
}
