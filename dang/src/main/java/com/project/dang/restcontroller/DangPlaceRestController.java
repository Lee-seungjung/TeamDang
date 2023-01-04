package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangPlaceDto;
import com.project.dang.repository.DangPlaceDao;

@CrossOrigin
@RestController
@RequestMapping("/rest_place")
public class DangPlaceRestController {

	//의존성 주입
	@Autowired
	private DangPlaceDao dangPlaceDao;
	
	//장소 등록
	@PostMapping("/place_insert")
	public void placeInsert(@RequestBody DangPlaceDto dangPlaceDto) {
		dangPlaceDao.placeInsert(dangPlaceDto);
	}
	
	@GetMapping("/place_list")
	public List<DangPlaceDto> placeList() {
		return dangPlaceDao.placeList();
	}
}
