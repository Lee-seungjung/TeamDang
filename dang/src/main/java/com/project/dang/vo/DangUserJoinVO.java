package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DangUserJoinVO {

	private Integer dangNo;
	private String dangName;
	private String dangInfo;
	private String dangArea;
	private String dangPrivate;
	private Integer attachmentNo;
	private Date memberJoindate;
}
