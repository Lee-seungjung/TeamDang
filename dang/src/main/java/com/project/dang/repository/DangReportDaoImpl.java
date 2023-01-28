package com.project.dang.repository;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;

@Repository
public class DangReportDaoImpl implements DangReportDao{

	@Autowired
	private SqlSession sqlSession;
	
	//신고번호
	@Override
	public int sequence() {
		return sqlSession.selectOne("dangReport.sequence");
	}

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
	
	//신고 정보 확인
	@Override
	public DangReportDto checkReport(int dangNo, int userNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("dangNo", dangNo);
		param.put("userNo", userNo);
		return sqlSession.selectOne("dangReport.checkReport",param);
	}
	
	//경고 알림 컬럼 변경
	@Override
	public boolean alertUpdate(int reportNo) {
		return sqlSession.update("dangReport.alertUpdate",reportNo)>0;
	}
	
	
}
