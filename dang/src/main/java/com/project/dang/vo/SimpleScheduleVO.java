package com.project.dang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SimpleScheduleVO {
	private String day;
	private Integer scheduleNo;
	private int dayNo;
	private String scheduleStart;
	private String scheduleHour;
	private String placeName;
	private int rn;
	private int dangNo;
}
