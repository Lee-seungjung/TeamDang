package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangScheduleDto;
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
	public List<ScheduleVO> list(@RequestParam Integer dangNo){
		return dangScheduleDao.list(dangNo);
	}
	
	//달력에서 클릭시 모달에서 일정 간단 조회
	@GetMapping("/schedule_modal")
	public ScheduleOneVO scheduleOne(@RequestParam int scheduleNo, @RequestParam Integer dangNo){
		return dangScheduleDao.scheduleOne(scheduleNo, dangNo);
	 }
	
	//사이드 프로필 좌측하단 댕모임 등록
	@PostMapping("/schedule_insert")
	public void scheduleInsert(@RequestBody DangScheduleDto dangscheduleDto) {
		dangScheduleDao.insert(dangscheduleDto);
	}
	
}
