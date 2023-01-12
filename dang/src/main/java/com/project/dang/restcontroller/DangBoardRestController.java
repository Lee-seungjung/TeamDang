package com.project.dang.restcontroller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.BoardImgDto;
import com.project.dang.dto.DangBoardDto;
import com.project.dang.dto.DangBoardLikeDto;
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
	
	//dang_board_like 등록
	@PostMapping("/like_insert")
	public void likeInsert(@RequestBody DangBoardLikeDto dto) {
		dangBoardDao.likeInsert(dto);
	}
	
	//기본조회(5개)
	@GetMapping("/find_img/{boardNo}")
	public List<BoardImgDto> findImg(@PathVariable int boardNo){
		return dangBoardDao.findImg(boardNo);
	}
	
	//좋아요 수 수정
	@PatchMapping("/update_like/{boardNo}/{type}")
	public boolean updateLike(@PathVariable int boardNo, @PathVariable int type) {
		//type이 1이면 증가 2면 감소
		if(type==1) {
			return dangBoardDao.plusLike(boardNo);
		}else {
			return dangBoardDao.minusLike(boardNo);
		}
	}
	
	//삭제
	@DeleteMapping("/delete/{boardNo}")
	public boolean delete(@PathVariable int boardNo) {
		return dangBoardDao.delete(boardNo);
	}

}
