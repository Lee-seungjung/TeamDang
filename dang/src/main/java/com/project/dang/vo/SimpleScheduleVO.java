package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class SimpleScheduleVO {
	private String day;
	private int dayNo;
	private Date scheduleStart;
	private String scheduleHour;
	private String placeName;
}
