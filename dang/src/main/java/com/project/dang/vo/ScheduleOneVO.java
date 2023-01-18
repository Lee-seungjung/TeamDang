package com.project.dang.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class ScheduleOneVO {
	private int scheduleNo;
	private String scheduleTitle;
	private String scheduleStart;
	private String scheduleHour;
	private String placeName;
	private Integer dangNo;
}
