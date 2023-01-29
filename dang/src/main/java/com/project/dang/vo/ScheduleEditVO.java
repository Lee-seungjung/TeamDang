package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ScheduleEditVO {
	int scheduleNo;
	private int placeNo;
	private String scheduleTitle;
	private String scheduleContent;
	private int scheduleHeadmax;
	private Date scheduleStart;
	private String scheduleHour;
	private int scheduleMoney;
	

}
