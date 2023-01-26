package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangPuppyInfoDto {

	private Integer puppyNo;
	private String puppyName;
	private String puppyGender;
	private Integer puppyAge;
	private Integer attachmentNo;
}
