package com.project.dang.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;
import com.project.dang.dto.ReportListRequestDto;
import com.project.dang.vo.ReportCntVO;
import com.project.dang.vo.ReportListVO;
import com.project.dang.vo.ReportOneListVO;

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
	
	//신고 누적수 확인
	@Override
	public int reportAppCnt(int dangNo, int userNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("dangNo", dangNo);
		param.put("userNo", userNo);
		return sqlSession.selectOne("dangReport.reportAppCnt",param);
	}
	
	//신고 파일 조회
	@Override
	public List<ReportImgDto> imgSelectList(int reportNo) {
		return sqlSession.selectList("dangReport.fingImg",reportNo);
	}
	
	//경고 알림 컬럼 변경
	@Override
	public boolean alertUpdate(int reportNo) {
		return sqlSession.update("dangReport.alertUpdate",reportNo)>0;
	}
	
	//신고 상태 변경
	@Override
	public boolean stateUpdate(DangReportDto dto) {
		return sqlSession.update("dangReport.stateUpdate",dto)>0;
	}
	
	//처리 못한 건 신고 상태 변경
	@Override
	public boolean stateRejUpdate(DangReportDto dto) {
		return sqlSession.update("dangReport.stateRejUpdate",dto)>0;
	}

	//(관리자) 신고 현황 카운트 조회
	@Override
	public ReportCntVO cnt() {
		return sqlSession.selectOne("dangReport.cntList");
	}
	
	//(관리자) 신고 목록 조회
	@Override
	public List<ReportListVO> reportList(ReportListRequestDto reportListRequestDto) {
		reportListRequestDto.setRownumStart(reportListRequestDto.rownumStart());
		reportListRequestDto.setRownumEnd(reportListRequestDto.rownumEnd());
		return sqlSession.selectList("dangReport.selectList",reportListRequestDto);
	}
	
	// 조건에 맞는 신고 갯수 카운트
	@Override
	public int reportListCount(ReportListRequestDto reportListRequestDto) {
		return sqlSession.selectOne("dangReport.countList", reportListRequestDto);
	}
	
	//(관리자) 신고 단일조회
	 @Override 
	 public ReportOneListVO selectOne(int reportNo) { 
		 return	 sqlSession.selectOne("dangReport.selectOne",reportNo); 
	 }

	 /*@Override
	public ReportOneListVO selectOne(int reportNo) {
		Map<String, Integer> param = new HashMap<>();
		param.put("reportNo", reportNo);
		param.put("memberNo", memberNo);
		return sqlSession.selectOne("dangReport.selectOne",param);
	}*/
	
}
