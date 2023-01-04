package com.project.dang.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangScheduleDto;
import com.project.dang.repository.DangScheduleDao;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@CrossOrigin
@RestController
@RequestMapping("/rest/dangSchedule")
public class DangScheduleRestController {
	
	/*
	 * @Autowired private DangMemberDao dangMemberDao;
	 */
	
	@Autowired
	private DangScheduleDao dangScheduleDao;
	/*
	@ResponseBody
	@RequestMapping("/scheduleInsert")
	public void scheduleInsert(@RequestBody DangScheduleDto dangScheduleDto) {
		
	}
	*/
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/scheduleUpdate")
	 */
	
	@ResponseBody
	@RequestMapping("/scheduleDelete")
	public void scheduleDelete(@RequestBody int scheduleNo) {
		dangScheduleDao.delete(scheduleNo);
	}

}
