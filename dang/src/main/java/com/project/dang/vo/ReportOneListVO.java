package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@AllArgsConstructor
public class ReportOneListVO {
	/*private String dangName;
	private int reportNo;
	private int userNo;
	private int dangNo;
	private String memberNick;
	private String reportContent;
	private Date reportDate;
	private String reportState;
	private int reportAlert;	
	private int memberNo;
	private String memberOwner;*/
	
	private String dangName;
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
