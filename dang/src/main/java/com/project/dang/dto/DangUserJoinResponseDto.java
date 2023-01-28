package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangUserJoinResponseDto {

	private Integer dangNo;
	private String dangName;
	private String dangInfo;
	private String dangArea;
	private String dangPrivate;
	private Integer attachmentNo;
	private Date memberJoindate;
	private Integer isOwner = 0;
}
