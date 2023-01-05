package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao{
	
	@Autowired
	private SqlSession sqlSession;

	//시퀀스- 파일번호 선발급
	@Override
	public int sequence() {
		return sqlSession.selectOne("attachment.sequence");
	}

	//파일 등록
	@Override
	public void insert(AttachmentDto dto) {
		sqlSession.insert("attachment.insert",dto);
		
	}

	//단일 조회
	@Override
	public AttachmentDto selectOne(int attachmentNo) {
		return sqlSession.selectOne("attachment.selectone",attachmentNo);
	}

	//파일 삭제
	@Override
	public boolean delete(int attachmentNo) {
		return sqlSession.delete("attachment.delete",attachmentNo)>0;
	}

}
