package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.repository.DangPlaceDao;

@Controller
public class HomeController {

	@Autowired
	DangPlaceDao dangPlaceDao;
	
	@RequestMapping("/")
	public String home(Model model) {
		model.addAttribute("recommendPlace", dangPlaceDao.homeRecommend());
		return "home";
	}
}
