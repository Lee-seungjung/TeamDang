package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangReplyDto;
import com.project.dang.vo.ReplyHistoryVO;

public interface DangReplyDao {
	
	/**
	 * 댓글 시퀀스 조회
	 * @return replyNo
	 */
	int sequence();
	
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
	 * 댓글 하나만 조회
	 * @param replyNo
	 * @return DangReplyDto
	 */
	ReplyHistoryVO selectOne(int replyNo);
	
	/**
	 * 게시글에 달린 댓글번호만 조회
	 * @param boardNo
	 * @return replyNo 배열
	 */
	List<Integer> replyNoList(int boardNo);
	
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
	 * 댓글 작성자 닉네임 변경
	 * @param DangReplyDto
	 * @return true, false
	 */
	boolean updateNick(DangReplyDto dto);
	
	/**
	 * 댓글 삭제
	 * @param replyNo
	 * @return true, false
	 */
	boolean delete(int replyNo);
}
