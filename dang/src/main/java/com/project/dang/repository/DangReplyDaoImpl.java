package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DangReplyDaoImpl implements DangReplyDao{

	@Autowired
	private SqlSession sqlSession;
	
	//내가 쓴 댓글 수
	@Override
	public int ReplyWriteCount(int memberNo) {
		return sqlSession.selectOne("dangReply.writeCount",memberNo);
	}

}
