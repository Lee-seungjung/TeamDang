package com.project.dang.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.dang.repository.DangPlaceDao;

@Controller
@RequestMapping("/place")
public class DangPlace {
	
	@Autowired
	DangPlaceDao dangPlaceDao;
	
	//장소의 상세 주소를 위한 맵핑
	@GetMapping("/detail/{placeNo}")
	public String placeDetail(@PathVariable int placeNo, Model model) {
		model.addAttribute("placeList", dangPlaceDao.placeOne(placeNo));
		
		return "place/detail";
	}
	
	
}
