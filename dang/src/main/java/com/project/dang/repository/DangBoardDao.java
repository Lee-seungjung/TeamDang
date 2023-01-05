package com.project.dang.repository;

public interface DangBoardDao {
	/**
	 * 내가 쓴 게시글 수
	 * @param memberNo
	 * @return 게시글 수(int)
	 */
	int boardWriteCount(int memberNo);
}
