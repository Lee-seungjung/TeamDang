package com.project.dang.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangPuppyDetailDto {
	private Integer puppyNo;
	private String puppyName;
	private Integer puppyAge;
	private String puppyGender;
	private String userId;
	private String puppyRegNo;	

}
