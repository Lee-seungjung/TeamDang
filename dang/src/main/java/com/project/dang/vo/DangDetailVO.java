package com.project.dang.vo;

import java.util.List;

import com.project.dang.dto.DangHashtagDto;
import com.project.dang.dto.DangInfoDto;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class DangDetailVO {

	private DangInfoDto dangInfo;
	private List<DangHashtagDto> dangHashtag;
}
