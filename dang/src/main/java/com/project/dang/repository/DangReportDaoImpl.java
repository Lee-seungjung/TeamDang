package com.project.dang.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;

@Repository
public class DangReportDaoImpl implements DangReportDao{

	@Autowired
	private SqlSession sqlSession;

	//신고 접수 등록
	@Override
	public void insert(DangReportDto dto) {
		sqlSession.insert("dangReport.insert",dto);
	}

	//신고 파일 등록
	@Override
	public void imgInsert(ReportImgDto dto) {
		sqlSession.insert("dangReport.imgInsert",dto);
	}
	
	
}
