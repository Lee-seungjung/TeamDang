package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangDetailAdminInfoDto {

	private DangDetailAdminDto dangDetailAdminDto;
	private List<DangHashtagInfoDto> dangHashtag;
	private DangDetailCreatorAdminDto dangDetailCreatorAdminDto;
}
