package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DashBoardReportVO {
	private String memberNick;
	private Date reportDate;
	private String reportState;
	private String dangName;
}
