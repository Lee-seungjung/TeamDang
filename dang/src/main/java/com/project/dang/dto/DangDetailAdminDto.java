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
public class DangDetailAdminDto {

	private Integer dangNo;
	private String dangName;
	private String dangInfo;
	private Integer dangHeadmax;
	private Integer dangHead;
	private String dangArea;
	private Date dangCreatetime;
	private Integer dangLike;
	private String dangPrivate;
	private Integer attachmentNo;
}
