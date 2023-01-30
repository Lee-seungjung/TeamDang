package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangReportDto;
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
	@GetMapping("/report_list")
	public List<ReportListVO> reportList(@RequestParam String reportState,
			@RequestParam String type, @RequestParam String keyword){
		return dangReportDao.reportList(reportState, type, keyword);
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
