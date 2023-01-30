package com.project.dang.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinScheduleListVO {
	private int scheduleNo;
	private int dangNo;
	private int placeNo;
	private String dangName;
	private Date memberJoinDate;	
	private String scheduleName;
	private String placeName;
	private int scheduleMoney;

}
