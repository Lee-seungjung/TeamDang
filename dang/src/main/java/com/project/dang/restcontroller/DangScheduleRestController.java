package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.repository.DangScheduleDao;
import com.project.dang.vo.ScheduleVO;

@CrossOrigin
@RestController
@RequestMapping("/rest/dangSchedule")
public class DangScheduleRestController {
	
	@Autowired
	DangScheduleDao dangScheduleDao;
	
	//달력내 일정조회
	@GetMapping("/schedule")
	public List<ScheduleVO> list(){
		return dangScheduleDao.list();//
	}

	 }
