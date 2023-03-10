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
@RequestMapping("/rest_admin")
public class DangAdminRestController {
	
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
	
	//?????? ??????(5???)
	@GetMapping("/group_list")
	public List<DangGroupRegionVO> groupList(){
		return adminDao.dangGroupRegion();
	}
	
	//?????? ??????
	@PostMapping("/report_list")
	public ReportListResponseDto reportList(@ModelAttribute ReportListRequestDto reportListRequestDto){
		// ????????? ?????? ?????? ?????? ??????
		int reportCount = dangReportDao.reportListCount(reportListRequestDto);
		// ?????? ??????
		reportListRequestDto.setTotal(reportCount);
		//System.out.println(reportCount);
		// ?????? ?????? ??????
		List<ReportListVO> reportList = dangReportDao.reportList(reportListRequestDto);

		System.out.println(reportListRequestDto.toString());
		// ????????? ?????? ??????
		ReportListResponseDto reportListResponseDto = new ReportListResponseDto();
		// ????????? ?????? ??????
		reportListResponseDto.setReportList(reportList);
		reportListResponseDto.setBlockStart(reportListRequestDto.blockStart());
		reportListResponseDto.setBlockEnd(reportListRequestDto.blockEnd());
		reportListResponseDto.setBlockPrev(reportListRequestDto.blockPrev());
		reportListResponseDto.setBlockNext(reportListRequestDto.blockNext());
		reportListResponseDto.setBlockFirst(reportListRequestDto.blockFirst());
		reportListResponseDto.setBlockLast(reportListRequestDto.blockLast());
		return reportListResponseDto;
	}
	
	//?????? ?????? ?????? ??????
	@PatchMapping("/report_update")
	public boolean stateUpdate(@RequestBody DangReportDto dto) {
		return dangReportDao.stateUpdate(dto);
	}
	
	//?????? ?????? ?????? ??????(?????? ?????? ?????? ??? ??????>??????)
	@PatchMapping("/report_rejected")
	public boolean stateRejUpdate(@RequestBody DangReportDto dto) {
		return dangReportDao.stateRejUpdate(dto);
	}
		
	// 
	@PostMapping("/dang_list")
	public DangListAdminRestResponseDto selectDangList(@ModelAttribute DangListAdminRestRequestDto dangListAdminRestRequestDto) {
		// ????????? ?????? ?????? ??? ?????? ??????
		int countDangListAdmin = dangDao.countDangListAdmin(dangListAdminRestRequestDto);
		// dto??? ??? ?????? ??????
		dangListAdminRestRequestDto.setTotal(countDangListAdmin);
		// ????????? ?????? ??????/?????? ??????
		List<DangListAdminDto> dangListAdmin = dangDao.searchDangListAdmin(dangListAdminRestRequestDto);
		// ????????? ?????? ??????
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
		// ????????? ?????? ?????? ??????
		DangDetailAdminInfoDto dangDetailAdminInfoDto = dangDao.searchDangDetailAdmin(dangNo, userNo);
		// ????????? ????????? ???????????? ??????
		DangDetailCreatorAdminDto dangDetailCreatorAdminDto = dangDao.searchDangCreatorDetailAdmin(dangNo, userNo);
		// ?????? ?????? ??????
		dangDetailAdminInfoDto.setDangDetailCreatorAdminDto(dangDetailCreatorAdminDto);
		return dangDetailAdminInfoDto;
	}
	
	@PostMapping("/user_list")
	public UsertListResponseDto selectUserList(@ModelAttribute UserListRequestDto userListRequestDto) {
		// ??? ????????? ??????
		int userTotal = dangUserDao.userCount(userListRequestDto);
		// dto??? ??? ?????? ??????
		userListRequestDto.setTotal(userTotal);
		// ?????? ?????? ??????/ ?????? ??????
		List<DangUserListDto> userListAdminB = dangUserDao.searchUserListAdmin(userListRequestDto);
		// ????????? ?????? ??????
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
		// ??? ???????????? ??????
		int puppyTotal = dangPuppyDao.dangCount(puppyListRequestDto);
		// dto??? ??? ?????? ??????
		puppyListRequestDto.setTotal(puppyTotal);
		// ?????? ?????? ??????/ ?????? ??????
		List<PuppyListDto> puppyListAdmin = dangPuppyDao.searchPuppyListAdmin(puppyListRequestDto);
		// ????????? ?????? ??????
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
		// ??? ????????? ????????? ??????
		int memberTotal = dangMemberDao.dangJoinCount(memberListRequestDto);
		// dto??? ??? ?????? ??????
		memberListRequestDto.setTotal(memberTotal);
		// ????????? ?????? ?????? ??????/ ?????? ??????
		List<MemberListDto> memberListAdmin = dangMemberDao.searchMemberListAdmin(memberListRequestDto);
		// ????????? ?????? ??????
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
