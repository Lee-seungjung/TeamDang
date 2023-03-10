package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ReportListVO {
	private int reportNo;
	private int dangNo;
	private int reportUserNo;
	private int userNo;
	private String memberNick;
	private String reportContent;
	private Date reportDate;
	private String reportState;
	private int reportAlert;
	private String dangName;
	
}
