package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
public class ReportOneListVO {
	private int dangNo;
	private String dangName;
	private int userNo;
	private int memberNo;
	private String memberNick;
	private String memberOwner;
	private int reportNo;
	private String reportContent;
	private Date reportDate;
	private String reportState;
	private int reportAlert;
}
