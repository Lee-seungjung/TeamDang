package com.project.dang.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class PuppyListDto {
	private int puppyNo;
	private String puppyName;
	private int puppyAge;
	private String puppyGender;
	private String userId;

}
