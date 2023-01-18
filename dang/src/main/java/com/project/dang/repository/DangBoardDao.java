package com.project.dang.repository;

import java.sql.Date;
import java.util.List;

import com.project.dang.dto.BoardImgDto;
import com.project.dang.dto.DangBoardDto;
import com.project.dang.dto.DangBoardLikeDto;
import com.project.dang.vo.BoardEditVO;
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
	 * 게시글 첨부파일 등록
	 * @param BoardImgDto
	 */
	void imgInsert(BoardImgDto dto);
	
	/**
	 * 게시글 좋아요 테이블 등록
	 * @param BoardImgDto
	 */
	void likeInsert(DangBoardLikeDto dto);
	
	/**
	 * 전체 게시글 조회
	 * @param dangNo
	 * @return List<BoardHistoryVO>
	 */
	List<BoardHistoryVO> selectAll(int dangNo);
	
	/**
	 * 카테고리 선택 조회
	 * @param dangNo
	 * @param keyword
	 * @return BoardHistoryVO
	 */
	List<BoardHistoryVO> categorySearch(String keyword, int dangNo);
	
	/**
	 * 검색 조회
	 * @param type
	 * @param keyword
	 * @param dangNo
	 * @return BoardHistoryVO
	 */
	List<BoardHistoryVO> inputSearch(String type, String keyword, int dangNo, String category);
	
	/**
	 * 내가 쓴 게시글 수
	 * @param memberNo
	 * @return 게시글 수(int)
	 */
	int boardWriteCount(int memberNo);
	
	/**
	 * 하루에 작성한 게시글 수
	 * @param memberNo
	 * @return 게시글 수(int)
	 */
	int dayWriteCount(int dangNo, int memberNo, String boardWriteDate);
	
	/**
	 * 게시글 첨부파일 조회
	 * @param boardNo
	 * @return List<BoardImgDto>
	 */
	List<BoardImgDto> findImg(int boardNo);
	
	/**
	 * 좋아요 테이블 조회
	 * @param memberNo
	 * @return
	 */
	List<DangBoardLikeDto> findlike(int memberNo);
	
	/**
	 * 게시글 수정
	 * @param BoardEditVO
	 * @return true, false 
	 */
	boolean editBoard(BoardEditVO vo);
	
	/**
	 * 게시글 좋아요 수 증가
	 * @param boardNo
	 * @return true, false
	 */
	boolean plusLike(int boardNo);
	
	/**
	 * 게시글 좋아요 수 감소
	 * @param boardNo
	 * @return true, false
	 */
	boolean minusLike(int boardNo);
	
	/**
	 * 게시글 삭제
	 * @param boardNo
	 * @return true, false
	 */
	boolean delete(int boardNo);
	
	/**
	 * 좋아요 테이블 삭제
	 * @param dto
	 * @return true, false
	 */
	boolean deleteLike(DangBoardLikeDto dto);
	
	
	
	
	
}
