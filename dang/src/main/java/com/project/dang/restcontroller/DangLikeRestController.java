package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.repository.DangLikeDao;
import com.project.dang.vo.DangLikeVO;

@RestController
@RequestMapping("/rest_dang_like")
public class DangLikeRestController {

	@Autowired
	private DangLikeDao dangLikeDao;
	
	// 댕모임 좋아요 등록
	@PostMapping("/insert")
	public void insertDangLike(@ModelAttribute DangLikeVO dangLikeVO) {
		dangLikeDao.insertDangLike(dangLikeVO);
	}
	
	// 댕모임 좋아요 취소
	@DeleteMapping("/delete")
	public void deleteDangLike(@ModelAttribute DangLikeVO dangLikeVO) {
		dangLikeDao.deleteDangLike(dangLikeVO);
	}
	
	// 회원이 좋아요한 댕모임 목록을 번호로 조회
	@GetMapping("/select")
	public List<Integer> selectDangLike(@RequestParam int userNo) {
		return dangLikeDao.selectDangLike(userNo);
	}
	
}
