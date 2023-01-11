package com.project.dang.restcontroller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.BoardImgDto;
import com.project.dang.dto.DangBoardDto;
import com.project.dang.repository.DangBoardDao;

@CrossOrigin
@RestController
@RequestMapping("/rest_board")
public class DangBoardRestController {
	
	@Autowired
	private DangBoardDao dangBoardDao;
	
	//시퀀스 조회
	@GetMapping("/find_no")
	public int sequence(){
		return dangBoardDao.sequence();
	}
	
	//등록
	@PostMapping("/insert")
	public void insert(@RequestBody DangBoardDto dto) {
		dangBoardDao.write(dto);
	}
	
	//board_img 등록
	@PostMapping("/img_insert")
	public void imgInsert(@RequestBody BoardImgDto dto) {
		dangBoardDao.imgInsert(dto);
	}

}
