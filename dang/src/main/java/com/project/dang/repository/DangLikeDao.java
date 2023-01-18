package com.project.dang.repository;

import java.util.List;

public interface DangLikeDao {

	/**
	 * 댕모임 좋아요 등록
	 * @param userNo : 회원 번호
	 * @param dangNo : 댕모임 번호
	 * @return Integer : 좋아요 갱신 후 상태
	 */
	public Integer insertDangLike(int userNo, int dangNo);
	
	/**
	 * 댕모임 좋아요 취소
	 * @param userNo : 회원 번호
	 * @param dangNo : 댕모임 번호
	 * @return Integer : 좋아요 갱신 후 상태
	 */
	public Integer deleteDangLike(int userNo, int dangNo);
	
	/**
	 * 특정 댕모임의 좋아요 갯수
	 * @param dangNo : 댕모임 번호
	 * @return int : 댕모임 좋아요 갯수
	 */
	public int countDangLike(int dangNo);
	
	/**
	 * 회원이 좋아요 한 댕모임 조회
	 * @param userNo : 회원 번호
	 * @return List<Integer> : 좋아요 한 댕모임 번호 List
	 */
	public List<Integer> selectDangLike(int userNo);
}
