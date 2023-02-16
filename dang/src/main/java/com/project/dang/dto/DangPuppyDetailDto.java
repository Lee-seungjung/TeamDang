package com.project.dang.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangPuppyDetailDto {
	private int userNo;
	private int puppyNo;
	private String puppyName;
	private String puppyAge;
	private String puppyGender;
	private String userId;
	private int puppyRegNo;	

}
