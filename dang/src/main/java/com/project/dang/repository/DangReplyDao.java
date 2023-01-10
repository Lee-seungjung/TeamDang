package com.project.dang.repository;

import java.util.List;

import com.project.dang.vo.ReplyHistoryVO;

public interface DangReplyDao {
	
	/**
	 * 게시글의 댓글조회
	 * @param boardNo
	 * @return List<ReplyHistoryVO>
	 */
	List<ReplyHistoryVO> oneBoardList(int boardNo);
	
	/**
	 * 내가 쓴 댓글 수
	 * @param memberNo
	 * @return 댓글 수(int)
	 */
	int ReplyWriteCount(int memberNo);
}
