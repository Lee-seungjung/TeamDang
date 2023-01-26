package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DangOneInfoVO {
	private Integer dangNo;
	private String dangName;
	private String dangInfo;
	private Integer dangHeadmax;
	private Integer dangHead;
	private Date createTime;
	private int dangLike;
	private String dangPrivate;
	private String dangPw;
	private int userNo;
	private String dangArea;
	private Integer attachmentNo;
}
