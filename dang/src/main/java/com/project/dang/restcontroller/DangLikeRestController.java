package com.project.dang.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.dang.dto.DangLikeRestRequestDto;
import com.project.dang.dto.DangLikeRestResponseDto;
import com.project.dang.repository.DangDao;
import com.project.dang.repository.DangLikeDao;

@RestController
@RequestMapping("/rest_dang_like")
public class DangLikeRestController {

	@Autowired
	private DangLikeDao dangLikeDao;
	
	@Autowired
	private DangDao dangDao;
	
	// 댕모임 좋아요 갱신
	@PostMapping("/change")
	public DangLikeRestResponseDto updateDangLike(@ModelAttribute DangLikeRestRequestDto dangLikeRestRequestDto) {
		// 좋아요 처리 후 상태
		Integer isLikeUpdate;
		// 좋아요 상태에 따라 다른 처리
		if(dangLikeRestRequestDto.getIsLike() == 1) { // 좋아요 상태였다면
			// 좋아요 취소
			isLikeUpdate = dangLikeDao.deleteDangLike(dangLikeRestRequestDto.getUserNo(), dangLikeRestRequestDto.getDangNo());
		} else { // 그렇지 않다면(좋아요 상태가 아니였다면)			
			// 좋아요 등록
			isLikeUpdate = dangLikeDao.insertDangLike(dangLikeRestRequestDto.getUserNo(), dangLikeRestRequestDto.getDangNo());
		}
		// 좋아요 갯수 반환
		int dangLikeCount = dangLikeDao.countDangLike(dangLikeRestRequestDto.getDangNo());
		// 좋아요 갯수 갱신
		dangDao.updateDangLike(dangLikeCount, dangLikeRestRequestDto.getDangNo());
		// 좋아요 처리 후 응답 반환
		return DangLikeRestResponseDto.builder().isLike(isLikeUpdate).dangLikeCount(dangLikeCount).build();
	}

	// 회원이 좋아요한 댕모임 목록을 번호로 조회
	@GetMapping("/select")
	public List<Integer> selectDangLike(@RequestParam int userNo) {
		return dangLikeDao.selectDangLike(userNo);
	}
	
}
