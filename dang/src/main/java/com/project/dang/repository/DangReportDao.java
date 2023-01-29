package com.project.dang.repository;

import java.util.List;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;
import com.project.dang.vo.ReportCntVO;
import com.project.dang.vo.ReportListVO;

public interface DangReportDao {

	/**
	 * 신고번호 시퀀스
	 * @return int : 신고번호
	 */
	int sequence();
	
	/**
	 * 신고 접수(등록)
	 * @param dto
	 */
	void insert(DangReportDto dto);
	
	/**
	 * 신고 파일 등록
	 * @param dto
	 */
	void imgInsert(ReportImgDto dto);
	
	/**
	 * 신고 정보 확인
	 * @param dangNo
	 * @param userNo
	 * @return DangReportDto
	 */
	DangReportDto checkReport(int dangNo, int userNo);
	
	/**
	 * 알림컬럼 변경
	 * @param reportNo
	 * @return true, false
	 */
	boolean alertUpdate(int reportNo);
	
	/**
	 * (관리자) 신고 현황 카운트 조회
	 * @return ReportCntVO
	 */
	ReportCntVO cnt();
	
	/**
	 * (관리자) 신고 목록 검색조회
	 * @return List<ReportListVO>
	 */
	List<ReportListVO> reportList(String reportState, String type, String keyword);
	
	/**
	 * (관리자) 신고 단일조회
	 * @param reportNo
	 * @return ReportListVO
	 */
	ReportListVO selectOne(int reportNo);
	
}
