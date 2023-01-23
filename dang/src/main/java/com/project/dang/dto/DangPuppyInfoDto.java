package com.project.dang.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DangPuppyInfoDto {

	private DangPuppyDto dangPuppyDto;
	private List<String> dangPuppyCharacterList;
}
