package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangJoinDto;
import com.project.dang.dto.DangScheduleDto;
import com.project.dang.repository.DangScheduleDao;
import com.project.dang.vo.JoinMemberVO;
import com.project.dang.vo.ScheduleEditVO;
import com.project.dang.vo.ScheduleOneVO;
import com.project.dang.vo.ScheduleVO;

@CrossOrigin
@RestController
@RequestMapping("/rest/dangSchedule")
public class DangScheduleRestController {

	@Autowired
	DangScheduleDao dangScheduleDao;

	// 달력내 일정조회
	@GetMapping("/schedule")
	public List<ScheduleVO> list(@RequestParam Integer dangNo) {
		return dangScheduleDao.list(dangNo);
	}

	// 달력에서 클릭시 모달에서 일정 간단 조회
	@GetMapping("/schedule_modal")
	public ScheduleOneVO scheduleOne(@RequestParam int scheduleNo, @RequestParam Integer dangNo) {
		return dangScheduleDao.scheduleOne(scheduleNo, dangNo);
	}

	// 사이드 프로필 좌측하단 댕모임 등록
	@PostMapping("/schedule_insert")
	public int scheduleInsert(@RequestBody DangScheduleDto dangscheduleDto) {
		// 스케줄 번호 시퀀스 발급
		int scheduleNo = dangScheduleDao.scheduleSequence();
		// 발급한 시퀀스틑 Dto에 삽입
		dangscheduleDto.setScheduleNo(scheduleNo);
		// insert불러오기
		dangScheduleDao.insert(dangscheduleDto);
		// 파라미터 멤버 번호 추출
		int memberNo = dangscheduleDto.getMemberNo();
		// Dto에서 멤버 번호, 스케줄 번호 삽입
		DangJoinDto dangJoinDto = DangJoinDto.builder().memberNo(memberNo).scheduleNo(scheduleNo).build();
		System.out.println(dangJoinDto);
		// 댕모임 일정등록자 참여
		dangScheduleDao.memberJoin(dangJoinDto);

		return scheduleNo;

	}

	@GetMapping("schedule_memberCheck")
	public List<JoinMemberVO> checkMemberList(int scheduleNo, int memberNo) {		
		return dangScheduleDao.checkMemberList(scheduleNo, memberNo);
	}
	
	@PostMapping("schedule_join")
	public void  scheduleJoin(DangJoinDto dangJoinDto) {		
		 dangScheduleDao.memberJoin(dangJoinDto);
	}
	
	@DeleteMapping("schedule_cancel")
	public void  scheduleCancel(int scheduleNo, int memberNo) {		
		 dangScheduleDao.memberJoinCancel(scheduleNo, memberNo);
	}
	
	@GetMapping("schdule_edifInfo")
	public ScheduleEditVO scheduleEditInfo(@RequestParam int scheduleNo, @RequestParam Integer dangNo) {
		return dangScheduleDao.selectScheduleInfo(scheduleNo, dangNo);
	}
	
	 @PutMapping("schedule_edit") 
	 public boolean scheduleEdit(ScheduleEditVO scheduleEditVO) { 
		 return	 dangScheduleDao.scheduleEdit(scheduleEditVO);
	 }
	 
	 @DeleteMapping("schedule_delete") 
	 public boolean scheduleJoinCancel(int scheduleNo, int memberNo) { 
		 return	 dangScheduleDao.scheduleDelete(scheduleNo, memberNo);
	 }
	 

}
