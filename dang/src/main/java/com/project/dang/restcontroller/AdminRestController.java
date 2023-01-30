package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangReportDto;
import com.project.dang.repository.AdminDao;
import com.project.dang.repository.DangReportDao;
import com.project.dang.vo.DangGroupRegionVO;

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
	
	//경고 확인 컬럼 변경
	@PatchMapping("/report_update")
	public boolean stateUpdate(@RequestBody DangReportDto dto) {
		return dangReportDao.stateUpdate(dto);
	}
}
