package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ScheduleVO {
	private int scheduleNo;
	private int memberNo;
	private String scheduleTitle;
	private String scheduleContent;
	private String memberNick;
	private Date scheduleStart;
	private String scheduleHour;
	private String placeName;
	private int scheduleHeadMax;
	private int scheduleHead;
	private Integer dangNo;
	private int placeNo;
	private int scheduleMoney;

}
