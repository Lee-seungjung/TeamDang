package com.project.dang.repository;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;

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
}
