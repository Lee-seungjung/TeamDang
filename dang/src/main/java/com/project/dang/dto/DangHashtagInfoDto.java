package com.project.dang.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class DangHashtagInfoDto {

	private Integer hashtagNo;
	private String hashtagContent;
}
