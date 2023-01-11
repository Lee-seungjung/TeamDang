package com.project.dang.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.BoardImgDto;
import com.project.dang.dto.DangBoardDto;
import com.project.dang.vo.BoardHistoryVO;

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

	//게시글 첨부파일 테이블 등록
	@Override
	public void imgInsert(BoardImgDto dto) {
		sqlSession.insert("dangBoard.imgInsert",dto);		
	}
	

	

}
