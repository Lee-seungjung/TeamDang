package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangListAdminDto {
	private Integer dangNo;
	private Integer userNo;
	private String dangName;
	private Integer dangHead;
	private Integer dangHeadmax;
	private Integer dangLike;
	private String dangPrivate;
}
