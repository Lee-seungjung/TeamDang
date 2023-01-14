package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangReplyDto;
import com.project.dang.vo.ReplyHistoryVO;

@Repository
public class DangReplyDaoImpl implements DangReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	//댓글 등록
	@Override
	public void replyInsert(DangReplyDto dto) {
		sqlSession.insert("dangReply.insert",dto);	
	}
	
	//게시글의 댓글조회
	@Override
	public List<ReplyHistoryVO> oneBoardList(int boardNo) {
		return sqlSession.selectList("dangReply.oneBoardList",boardNo);
	}
	
	//내가 쓴 댓글 수
	@Override
	public int ReplyWriteCount(int memberNo) {
		return sqlSession.selectOne("dangReply.writeCount",memberNo);
	}
	
	//댓글 수정
	@Override
	public boolean updateContent(String ReplyContent, int replyNo) {
		Map<String, String> param = new HashMap<>();
		param.put("replyContent", ReplyContent);
		param.put("replyNo", String.valueOf(replyNo));
		return sqlSession.delete("dangReply.update",param)>0;
	}

	//댓글 삭제
	@Override
	public boolean delete(int replyNo) {
		return sqlSession.delete("dangReply.delete",replyNo)>0;
	}

	

}
