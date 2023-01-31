package com.project.dang.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class JoinScheduleListVO {
	private String dangName;	
	private String scheduleTitle;
	private String placeName;
	private Date scheduleStart;
	private int scheduleMoney;

}
