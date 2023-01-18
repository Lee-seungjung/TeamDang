package com.project.dang.repository;

import java.util.List;

import com.project.dang.vo.DangLikeVO;

public interface DangLikeDao {

	/**
	 * 댕모임 좋아요 등록
	 * @param dangLikeVO : 회원 번호, 댕모임 번호
	 */
	public void insertDangLike(DangLikeVO dangLikeVO);
	
	/**
	 * 댕모임 좋아요 취소
	 * @param dangLikeVO : 회원 번호, 댕모임 번호
	 * @return boolean : 댕모임 좋아요 삭제 여부
	 */
	public boolean deleteDangLike(DangLikeVO dangLikeVO);
	
	/**
	 * 회원이 좋아요 한 댕모임 조회
	 * @param userNo : 회원 번호
	 * @return List<Integer> : 좋아요 한 댕모임 번호 List
	 */
	public List<Integer> selectDangLike(int userNo);
}
