package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangPuppyDto {
	private Integer puppyNo;
	private Integer userNo;
	private String puppyRegNo;
	private String puppyName;
	private String puppyGender;
	private Integer puppyAge;
}
