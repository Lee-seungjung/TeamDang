package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangDto {

	// 필드
	private int dangNo;
	private int dangAreaNo;
	private int userNo;
	private String dangName;
	private String dangInfo;
	private int dangHeadmax;
	private int dangHead;
	private int dangLike;
	private String dangPrivate;
	private String dangPw;
}
