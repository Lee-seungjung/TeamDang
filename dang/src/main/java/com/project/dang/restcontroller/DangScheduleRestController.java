package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.repository.DangScheduleDao;
import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;

@CrossOrigin
@RestController
@RequestMapping("/rest/dangSchedule")
public class DangScheduleRestController {
	
	@Autowired
	DangScheduleDao dangScheduleDao;
	
	//달력내 일정조회
	@GetMapping("/schedule")
	public List<ScheduleVO> list(int DangNo){
		return dangScheduleDao.list(DangNo);
	}
	
	//달력에서 클릭시 모달에서 일정 간단 조회
	@GetMapping("/schedule_modal")
	public ScheduleOneVO scheduleOne(@RequestParam int scheduleNo,int DangNo){
		return dangScheduleDao.scheduleOne(scheduleNo, DangNo);
	 }
	
}
