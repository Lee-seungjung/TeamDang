package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangDetailAdminInfoDto;
import com.project.dang.dto.DangDetailCreatorAdminDto;
import com.project.dang.dto.DangListAdminDto;
import com.project.dang.dto.DangListAdminRestRequestDto;
import com.project.dang.dto.DangListAdminRestResponseDto;
import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.DangUserListDto;
import com.project.dang.dto.MemberListDto;
import com.project.dang.dto.MemberListRequestDto;
import com.project.dang.dto.MemberListResponseDto;
import com.project.dang.dto.PuppyListDto;
import com.project.dang.dto.PuppyListRequestDto;
import com.project.dang.dto.PuppyListResponseDto;
import com.project.dang.dto.ReportListRequestDto;
import com.project.dang.dto.ReportListResponseDto;
import com.project.dang.dto.UserListRequestDto;
import com.project.dang.dto.UsertListResponseDto;
import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangMemberDao;
import com.project.dang.repository.DangPuppyDao;
import com.project.dang.repository.DangReportDao;
import com.project.dang.repository.DangUserDao;
import com.project.dang.vo.DangGroupRegionVO;
import com.project.dang.vo.ReportListVO;

@RestController
@CrossOrigin
@RequestMapping("/admin")
public class AdminRestController {
	
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private DangReportDao dangReportDao;
	
	@Autowired
	private DangDao dangDao;
	
	@Autowired
	private DangUserDao dangUserDao;
	
	@Autowired
	private DangPuppyDao dangPuppyDao;
	
	@Autowired
	private DangMemberDao dangMemberDao;
	
	//전체 조회(5개)
	@GetMapping("/group_list")
	public List<DangGroupRegionVO> groupList(){
		return adminDao.dangGroupRegion();
	}
	
	//신고 조회
	@PostMapping("/report_list")
	public ReportListResponseDto reportList(@ModelAttribute ReportListRequestDto reportListRequestDto){
		// 조회에 맞는 신고 갯수 반환
		int reportCount = dangReportDao.reportListCount(reportListRequestDto);
		// 갯수 설정
		reportListRequestDto.setTotal(reportCount);
		//System.out.println(reportCount);
		// 신고 목록 조회
		List<ReportListVO> reportList = dangReportDao.reportList(reportListRequestDto);

		System.out.println(reportListRequestDto.toString());
		// 반환용 객체 생성
		ReportListResponseDto reportListResponseDto = new ReportListResponseDto();
		// 반환용 객체 설정
		reportListResponseDto.setReportList(reportList);
		reportListResponseDto.setBlockStart(reportListRequestDto.blockStart());
		reportListResponseDto.setBlockEnd(reportListRequestDto.blockEnd());
		reportListResponseDto.setBlockPrev(reportListRequestDto.blockPrev());
		reportListResponseDto.setBlockNext(reportListRequestDto.blockNext());
		reportListResponseDto.setBlockFirst(reportListRequestDto.blockFirst());
		reportListResponseDto.setBlockLast(reportListRequestDto.blockLast());
		return reportListResponseDto;
	}
	
	//경고 확인 컬럼 변경
	@PatchMapping("/report_update")
	public boolean stateUpdate(@RequestBody DangReportDto dto) {
		return dangReportDao.stateUpdate(dto);
	}
	
	//경고 확인 컬럼 변경(신고 처리 못한 건 접수>반려)
	@PatchMapping("/report_rejected")
	public boolean stateRejUpdate(@RequestBody DangReportDto dto) {
		return dangReportDao.stateRejUpdate(dto);
	}
		
	// 
	@PostMapping("/dang_list")
	public DangListAdminRestResponseDto selectDangList(@ModelAttribute DangListAdminRestRequestDto dangListAdminRestRequestDto) {
		// 조건에 따른 조회 총 갯수 반환
		int countDangListAdmin = dangDao.countDangListAdmin(dangListAdminRestRequestDto);
		// dto에 총 갯수 설정
		dangListAdminRestRequestDto.setTotal(countDangListAdmin);
		// 댕모임 목록 전체/검색 조회
		List<DangListAdminDto> dangListAdmin = dangDao.searchDangListAdmin(dangListAdminRestRequestDto);
		// 반환용 객체 생성
		DangListAdminRestResponseDto dangListAdminRestResponseDto = new DangListAdminRestResponseDto();
		dangListAdminRestResponseDto.setDangListAdmin(dangListAdmin);
		dangListAdminRestResponseDto.setBlockEnd(dangListAdminRestRequestDto.blockEnd());
		dangListAdminRestResponseDto.setBlockPrev(dangListAdminRestRequestDto.blockPrev());
		dangListAdminRestResponseDto.setBlockNext(dangListAdminRestRequestDto.blockNext());
		dangListAdminRestResponseDto.setBlockFirst(dangListAdminRestRequestDto.blockFirst());
		dangListAdminRestResponseDto.setBlockStart(dangListAdminRestRequestDto.blockStart());
		dangListAdminRestResponseDto.setBlockLast(dangListAdminRestRequestDto.blockLast());
		System.out.println(dangListAdminRestRequestDto.toString());
		return dangListAdminRestResponseDto;
	}
	
	@GetMapping("/dang_detail")
	public DangDetailAdminInfoDto selectDangDetail(@RequestParam int dangNo, @RequestParam int userNo) {
		// 댕모임 상세 정보 조회
		DangDetailAdminInfoDto dangDetailAdminInfoDto = dangDao.searchDangDetailAdmin(dangNo, userNo);
		// 댕모임 개설자 상세정보 조회
		DangDetailCreatorAdminDto dangDetailCreatorAdminDto = dangDao.searchDangCreatorDetailAdmin(dangNo, userNo);
		// 반환 객체 설정
		dangDetailAdminInfoDto.setDangDetailCreatorAdminDto(dangDetailCreatorAdminDto);
		return dangDetailAdminInfoDto;
	}
	
	@PostMapping("/user_list")
	public UsertListResponseDto selectUserList(@ModelAttribute UserListRequestDto userListRequestDto) {
		
		//System.out.println(userListRequestDto.getType());
		//System.out.println(userListRequestDto.getKeyword());
		//System.out.println(userListRequestDto.getP());
		
		// 총 회원수 조회
		int userTotal = dangUserDao.userCount(userListRequestDto);
		// dto에 총 갯수 설정
		userListRequestDto.setTotal(userTotal);
		// 회원 목록 전체/ 검색 조회
		List<DangUserListDto> userListAdminB = dangUserDao.searchUserListAdmin(userListRequestDto);
		// 반환용 객체 생성
		UsertListResponseDto userListResponseDto = new UsertListResponseDto();
		userListResponseDto.setUserList(userListAdminB);
		userListResponseDto.setBlockStart(userListRequestDto.blockStart());
		userListResponseDto.setBlockEnd(userListRequestDto.blockEnd());
		userListResponseDto.setBlockPrev(userListRequestDto.blockPrev());
		userListResponseDto.setBlockNext(userListRequestDto.blockNext());
		userListResponseDto.setBlockFirst(userListRequestDto.blockFirst());
		userListResponseDto.setBlockLast(userListRequestDto.blockLast());
		System.out.println(userListRequestDto.toString());
		return userListResponseDto;
	}
	
	@PostMapping("/puppy_list")
	public PuppyListResponseDto selectPuppyList(@ModelAttribute PuppyListRequestDto puppyListRequestDto) {
		
		System.out.println(puppyListRequestDto.getType());
		System.out.println(puppyListRequestDto.getKeyword());
		System.out.println(puppyListRequestDto.getP());
		
		// 총 댕댕이수 조회
		int puppyTotal = dangPuppyDao.dangCount(puppyListRequestDto);
		// dto에 총 갯수 설정
		puppyListRequestDto.setTotal(puppyTotal);
		// 회원 목록 전체/ 검색 조회
		List<PuppyListDto> puppyListAdmin = dangPuppyDao.searchPuppyListAdmin(puppyListRequestDto);
		// 반환용 객체 생성
		PuppyListResponseDto puppyListResponseDto = new PuppyListResponseDto();
		puppyListResponseDto.setPuppyList(puppyListAdmin);
		puppyListResponseDto.setBlockStart(puppyListRequestDto.blockStart());
		puppyListResponseDto.setBlockEnd(puppyListRequestDto.blockEnd());
		puppyListResponseDto.setBlockPrev(puppyListRequestDto.blockPrev());
		puppyListResponseDto.setBlockNext(puppyListRequestDto.blockNext());
		puppyListResponseDto.setBlockFirst(puppyListRequestDto.blockFirst());
		puppyListResponseDto.setBlockLast(puppyListRequestDto.blockLast());
		System.out.println(puppyListRequestDto.toString());
		return puppyListResponseDto;
	}
	
	@PostMapping("/member_list")
	public 	MemberListResponseDto selectMemberList(@ModelAttribute MemberListRequestDto memberListRequestDto) {
		
		System.out.println(memberListRequestDto.getType());
		System.out.println(memberListRequestDto.getKeyword());
		System.out.println(memberListRequestDto.getP());
		
		// 총 댕모임 멤버수 조회
		int memberTotal = dangMemberDao.dangJoinCount(memberListRequestDto);
		// dto에 총 갯수 설정
		memberListRequestDto.setTotal(memberTotal);
		// 댕모임 멤버 목록 전체/ 검색 조회
		List<MemberListDto> memberListAdmin = dangMemberDao.searchMemberListAdmin(memberListRequestDto);
		// 반환용 객체 생성
		MemberListResponseDto memberListResponseDto = new MemberListResponseDto();
		memberListResponseDto.setMemberList(memberListAdmin);
		memberListResponseDto.setBlockStart(memberListRequestDto.blockStart());
		memberListResponseDto.setBlockEnd(memberListRequestDto.blockEnd());
		memberListResponseDto.setBlockPrev(memberListRequestDto.blockPrev());
		memberListResponseDto.setBlockNext(memberListRequestDto.blockNext());
		memberListResponseDto.setBlockFirst(memberListRequestDto.blockFirst());
		memberListResponseDto.setBlockLast(memberListRequestDto.blockLast());
		System.out.println(memberListRequestDto.toString());
		return memberListResponseDto;
	}
	
}
