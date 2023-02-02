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
import com.project.dang.dto.ReportListRequestDto;
import com.project.dang.dto.ReportListResponseDto;
import com.project.dang.dto.UserListRequestDto;
import com.project.dang.dto.UsertListResponseDto;
import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangDao;
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
		
		System.out.println(userListRequestDto.getType());
		System.out.println(userListRequestDto.getKeyword());
		System.out.println(userListRequestDto.getP());
		
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
	
}
