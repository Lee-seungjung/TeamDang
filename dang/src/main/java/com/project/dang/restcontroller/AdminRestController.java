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
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportListRequestDto;
import com.project.dang.dto.ReportListResponseDto;
import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangReportDao;
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
		
}
