package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.repository.DangPlaceDao;

@Controller
@RequestMapping("/admin")
public class DangAdmin {

	@Autowired
	DangPlaceDao dangPlaceDao;
	
	@GetMapping("/place_list")
	public String placeList(Model model) {
		model.addAttribute("placeList", dangPlaceDao.placeList());
		model.addAttribute("placeCount", dangPlaceDao.countPlace());
		return "dang_admin/list";
	}
}
