package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangReplyDto;
import com.project.dang.vo.ReplyHistoryVO;

public interface DangReplyDao {
	
	/**
	 * 댓글 등록
	 * @param dto
	 */
	void replyInsert(DangReplyDto dto);
	
	/**
	 * 게시글의 댓글조회
	 * @param boardNo
	 * @return List<ReplyHistoryVO>
	 */
	List<ReplyHistoryVO> oneBoardList(int boardNo);
	
	/**
	 * 게시글의 댓글조회(더보기+5)
	 * @param boardNo, replyNo
	 * @return List<ReplyHistoryVO>
	 */
	List<ReplyHistoryVO> moreReplyList(int boardNo, int replyNo);
	
	/**
	 * 내가 쓴 댓글 수
	 * @param memberNo
	 * @return 댓글 수(int)
	 */
	int ReplyWriteCount(int memberNo);
	
	/**
	 * 댓글 수정
	 * @param ReplyContent
	 * @param replyNo
	 * @return true, false
	 */
	boolean updateContent(String ReplyContent, int replyNo);
	
	/**
	 * 댓글 삭제
	 * @param replyNo
	 * @return true, false
	 */
	boolean delete(int replyNo);
}
