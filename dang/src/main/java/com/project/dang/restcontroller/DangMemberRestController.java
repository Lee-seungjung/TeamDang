package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.repository.DangMemberDao;

@CrossOrigin
@RestController
@RequestMapping("/rest_member")
public class DangMemberRestController {

	//의존성 주입
	@Autowired
	private DangMemberDao dangMemberDao;
	
	//출석 insert
	@PostMapping("/attendance_insert")
	public void attendanceInsert(@RequestBody DangAttendanceDto dto) {
		dangMemberDao.attendanceInsert(dto);
	}
	
	//출석 조회(한달 기준)
	 @GetMapping("/attendance_list")
	 public List<DangAttendanceDto> list(@RequestParam("memberNo") int memberNo){
		 return dangMemberDao.attendanceList(memberNo);
	 }

	
	//댕모임 회원등급 포인트 증가
	@PatchMapping("/score_plus")
	public boolean updateScore(@RequestBody DangMemberDto dto) {
		return dangMemberDao.plusScore(dto);
	}
	
}
