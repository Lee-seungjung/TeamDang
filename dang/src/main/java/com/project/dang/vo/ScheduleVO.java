package com.project.dang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ScheduleVO {
	private String scheduleTitle;
	private String scheduleContent;
	private String scheduleLeader;
	private String scheduleStart;
	private String scheduleHour;
	private String placeName;
	private int scheduleHeadMax;
	private int scheduleHead;

}