package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.repository.DangDao;
import com.project.dang.vo.DangTopVO;

@RestController
@RequestMapping("/rest_dang")
public class DangRestController {

	@Autowired
	private DangDao dangDao;
	
	// 상위 5개 댕모임 반환
	@GetMapping("/top")
	public List<DangTopVO> searchDangTop(@RequestParam String dangArea) {
		// 지역에서 좋아요 + 인원수 순으로 상위 5개 댕모임 반환
		return dangDao.searchDangTop(dangArea);
	}
}
