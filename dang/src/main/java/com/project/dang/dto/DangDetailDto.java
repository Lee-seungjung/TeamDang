package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangDetailDto {

	private DangInfoDto dangInfo;
	private List<DangHashtagInfoDto> dangHashtag;
	private Integer isMember;
}
