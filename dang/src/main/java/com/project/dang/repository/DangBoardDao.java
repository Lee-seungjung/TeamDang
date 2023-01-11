package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangBoardDto;
import com.project.dang.vo.BoardHistoryVO;

public interface DangBoardDao {
	
	/**
	 * 글 번호 시퀀스 발급
	 * @return int
	 */
	int sequence();
	
	/**
	 * 등록
	 * @param DangBoardDto
	 */
	void write(DangBoardDto dto);
	
	/**
	 * 전체 게시글 조회
	 * @param dangNo
	 * @return List<BoardHistoryVO>
	 */
	List<BoardHistoryVO> selectAll(int dangNo);
	
	/**
	 * 내가 쓴 게시글 수
	 * @param memberNo
	 * @return 게시글 수(int)
	 */
	int boardWriteCount(int memberNo);
}
