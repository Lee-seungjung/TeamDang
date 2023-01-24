package com.project.dang.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class DangScheduleDto {
	private int scheduleNo;
	private int memberNo;
	private int placeNo;
	private String scheduleTitle;
	private String scheduleContent;
	private int scheduleHeadmax;
	private int schdeuleHead;
	private Date scheduleStart;
	private String scheduleHour;
	private int scheduleMoney;

	
	
}
