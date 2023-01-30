package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ScheduleEditVO {
	private int scheduleNo;
	private int dangNo;
	private int placeNo;
	private String scheduleTitle;
	private String scheduleContent;
	private int scheduleHeadmax;
	private int scheduleHead;
	private Date scheduleStart;
	private String scheduleHour;
	private int scheduleMoney;
	

}
