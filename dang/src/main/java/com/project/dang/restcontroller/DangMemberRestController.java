package com.project.dang.restcontroller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangAttendanceDto;
import com.project.dang.dto.DangMemberDto;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.vo.MemberEditVO;

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
	 
	 //출석 여부
	 @GetMapping("/is_attendance")
	 public DangAttendanceDto isAttendance(@RequestParam int memberNo){
		 return dangMemberDao.isAttendance(memberNo);
	 }
	 
	 //회원 단일조회
	 @GetMapping("/find_member")
	 public DangMemberDto findMember(@RequestParam int memberNo){
		 return dangMemberDao.restSelectOne(memberNo);
	 }
	 
	//회원 단일조회
	@GetMapping("/find_member_no")
	public int findMemberNo(@RequestParam int userNo, @RequestParam int dangNo){
		return dangMemberDao.findMemberNo(userNo,dangNo);
	}
		 
	//댕모임 회원등급 포인트 증가
	@PatchMapping("/score_plus")
	public boolean updateScore(@RequestBody DangMemberDto dto) {
		return dangMemberDao.plusScore(dto);
	}
	
	//댕모임 회원등급 포인트 감소
	@PatchMapping("/score_minus/{memberScore}/{memberNo}")
	public boolean updateMinusScore(@PathVariable int memberScore,
			@PathVariable int memberNo) {
		System.out.println("dsgsgsdgdg = "+memberScore);
		System.out.println(memberNo);
		return dangMemberDao.minusScore(memberScore,memberNo);
	}
	
	//댕모임 회원등급 포인트 조회
	@GetMapping("/score_find/{memberNo}")
	public int findScore(@PathVariable int memberNo) {
		return dangMemberDao.findScore(memberNo);
	}
	
	//댕모임 닉네임 중복 검사
	@GetMapping("/checkNick/{dangNo}/{memberNick}")
	public boolean checkNick(
			@PathVariable int dangNo, @PathVariable String memberNick) {
		 DangMemberDto dto = dangMemberDao.checkNick(dangNo, memberNick);
		 if(dto==null) {
			 return true;
		 }else {
			 return false;
		 } 
	}
	
	//댕모임 프로필 수정
	@PatchMapping("/profile_edit")
	public boolean profileEdit(@RequestBody MemberEditVO vo) {
		return dangMemberDao.editProfile(vo);
	}
	
	// 특정 회원이 가입한 댕모임 번호 반환
	@GetMapping("/search_already_join")
	public List<Integer> searchDangAlreadyJoin(@RequestParam int userNo) {
		return dangMemberDao.searchDangAlreadyJoin(userNo);
	}
	
	// 특정 회원이 특정 댕모임의 회원인지 검사
	@GetMapping("/is_dang_member")
	public boolean isDangMember(@RequestParam int userNo, @RequestParam int dangNo) {
		return dangMemberDao.isDangMember(userNo, dangNo);
	}
	
	// 댕모임 회원 탈퇴
	@DeleteMapping("/delete_member")
	public boolean deleteMember(@RequestParam int dangNo, @RequestParam int memberNo) {
		return dangMemberDao.deleteDangMember(dangNo, memberNo);
	}
	
}
