package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangReportDto {
	private int reportNo;
	private int dangNo;
	private int reportUserNo;
	private int userNo;
	private String memberNick;
	private String reportContent;
	private Date reportDate;
	private String reportState;
	private int reportAlert;
}
