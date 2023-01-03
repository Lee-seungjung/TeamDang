package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangCertDto;

@Repository
public class DangCertDaoImpl implements DangCertDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertCert(DangCertDto dangCertDto) {
		sqlSession.insert("dangCert.insertCert", dangCertDto);
	}

	@Override
	public boolean deleteCert(String certEmail) {
		int result = sqlSession.delete("dangCert.deleteCert", certEmail);
		return result > 0;
	}

	@Override
	public String selectCert(String certEmail) {
		return sqlSession.selectOne("dangCert.selectCert");
	}
}
