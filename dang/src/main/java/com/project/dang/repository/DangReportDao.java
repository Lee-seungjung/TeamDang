package com.project.dang.repository;

import com.project.dang.dto.DangReportDto;
import com.project.dang.dto.ReportImgDto;

public interface DangReportDao {

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
	
	
}
