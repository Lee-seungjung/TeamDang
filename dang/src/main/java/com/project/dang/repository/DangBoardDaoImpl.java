package com.project.dang.repository;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.BoardImgDto;
import com.project.dang.dto.DangBoardDto;
import com.project.dang.dto.DangBoardLikeDto;
import com.project.dang.vo.BoardEditVO;
import com.project.dang.vo.BoardHistoryVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class DangBoardDaoImpl implements DangBoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	//글번호 발급
	@Override
	public int sequence() {
		return sqlSession.selectOne("dangBoard.sequence");
	}
	
	//글쓰기 등록
	@Override
	public void write(DangBoardDto vo) {
		sqlSession.insert("dangBoard.write",vo);	
	}
	
	//게시글 첨부파일 테이블 등록
	@Override
	public void imgInsert(BoardImgDto dto) {
		sqlSession.insert("dangBoard.imgInsert",dto);		
	}
	
	//게시글 좋아요 테이블 등록
	@Override
	public void likeInsert(DangBoardLikeDto dto) {
		sqlSession.insert("dangBoard.likeInsert",dto);		
	}
	
	//전체 게시글 조회
	@Override
	public List<BoardHistoryVO> selectAll(int dangNo) {
		return sqlSession.selectList("dangBoard.selectAll",dangNo);
	}
	
	//내가 쓴 게시글 수
	@Override
	public int boardWriteCount(int memberNo) {
		return sqlSession.selectOne("dangBoard.writeCount",memberNo);
	}
	
	//하루에 작성한 게시글 수
	@Override
	public int dayWriteCount(int dangNo, int memberNo, String boardWriteDate) {
		Map<String, String> param = new HashMap<>();
		param.put("dangNo", String.valueOf(dangNo));
		param.put("memberNo", String.valueOf(memberNo));
		param.put("boardWriteDate", boardWriteDate);
		return sqlSession.selectOne("dangBoard.dayWriteCount",param);
	}
	
	//카테고리 선택조회
	@Override
	public List<BoardHistoryVO> categorySearch(String keyword, int dangNo) {
		Map<String, String> param = new HashMap<>();
		param.put("keyword", keyword);
		param.put("dangNo", String.valueOf(dangNo));
		return sqlSession.selectList("dangBoard.categorySearch",param);
	}
	
	//검색조회
		@Override
		public List<BoardHistoryVO> inputSearch(String type, String keyword, int dangNo, String category) {
			Map<String, String> param = new HashMap<>();
			param.put("type", type);
			param.put("keyword", keyword);
			param.put("dangNo", String.valueOf(dangNo));
			param.put("category", category);
			return sqlSession.selectList("dangBoard.inputSearch",param);
		}

	//게시글 첨부파일 조회
	@Override
	public List<BoardImgDto> findImg(int boardNo) {
		return sqlSession.selectList("dangBoard.findImg",boardNo);
	}
	
	//좋아요 테이블 조회
	@Override
	public List<DangBoardLikeDto> findlike(int memberNo) {
		return sqlSession.selectList("dangBoard.findLike",memberNo);
	}
	
	//게시글 수정
	@Override
	public boolean editBoard(BoardEditVO vo) {
		return sqlSession.update("dangBoard.editBoard",vo)>0;
	}
	
	//게시글 좋아요 수 증가
	@Override
	public boolean plusLike(int boardNo) {
		return sqlSession.update("dangBoard.plusLike",boardNo)>0;
	}

	//게시글 좋아요 수 감소
	@Override
	public boolean minusLike(int boardNo) {
		return sqlSession.update("dangBoard.minusLike",boardNo)>0;
	}

	//게시글 삭제
	@Override
	public boolean delete(int boardNo) {
		return sqlSession.delete("dangBoard.delete",boardNo)>0;
	}
	
	//좋아요 테이블 삭제
	@Override
	public boolean deleteLike(DangBoardLikeDto dto) {
		return sqlSession.delete("dangBoard.deleteLike",dto)>0;
	}

	

	

	
	

	

}
